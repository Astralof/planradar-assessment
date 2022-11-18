# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def ticket_reminder
    # http://localhost:3000/rails/mailers/user_mailer/ticket_reminder
    UserMailer.ticket_reminder(Ticket.last)
  end
end
