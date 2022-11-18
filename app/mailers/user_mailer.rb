class UserMailer < ApplicationMailer
  def ticket_reminder(ticket)
    mail(
      to: ticket.user.mail,
      subject: "The #{ticket.title} ticket must be done by #{ticket.due_date}.",
      body: %(
        Descripiton:
        #{ticket.description}
      )
    )
  end
end
