require 'postageapp/mailer'

class PonyExpress < PostageApp::Mailer
  default from: "events@enrichcolumbus.org"

  def registration_confirmation(contact)
    @contact = contact

    mail(
      subject: "Enrich Columbus: Registration Confirmation",
      to: "#{contact.email}"
      )
  end

  def monthly_mailer(contact)
    @contact = contact

    mail(
      subject: "Enrich Columbus: Monthly Events for January!",
      to: "#{contact.email}"
      )
  end

  def event_registration_confirmation(registration)
    @registration = registration
    mail(
      subject: "Event Registration Confirmation",
      to: "#{registration.contact_email}"
      )
  end

  def expo_registration_confirmation(expo_registration)
    @expo_registration = expo_registration
    mail(
      subject: "Expo Registration Confirmation",
      to: "#{expo_registration.email}"
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
