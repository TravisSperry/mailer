require 'postageapp/mailer'

class PonyExpress < PostageApp::Mailer
  default from: "events@enrichcolumbus.org"

  def registration_confirmation(contact)
    @contact = contact

    mail(
      to: "#{contact.email}"
      )
  end

  def event_email(email)
    mail(
      to: "#{email}",
      subject: "New Albany Summer Camp Fair"
      )
  end

  def email(email, subject, email_body)
    mail(
      to: "#{email}",
      body: email_body,
      subject: "New Albany Summer Camp Fair"
      )
  end
end