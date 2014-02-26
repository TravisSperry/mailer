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
      subject: "New Albany Summer Camp Fair",
      to: "#{email}"
      )
  end
end