class UserTicketNotificationJob < ApplicationJob
  queue_as :default

  def perform(ticket_id)
    ticket = Ticket.find_by(id: ticket_id)
    return if ticket.blank?
    UserMailer.ticket_reminder(ticket)
  end
end
