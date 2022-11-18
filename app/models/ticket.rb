class Ticket < ApplicationRecord
  belongs_to :user
  after_create :set_user_notification

  delegate :wants_notifications, to: :user

  def set_user_notification
    return unless wants_notifications
    UserTicketNotificationJob.set(
      wait_until: notification_datetime
    ).perform_later(id)
  end

  def notification_datetime
    (due_date - user.send_due_date_reminder.to_i.days + user_reminder_time_in_seconds).to_datetime
  end

  def user_reminder_time_in_seconds
    user.due_date_reminder_time.seconds_since_midnight.seconds
  end
end