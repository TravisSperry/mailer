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
      subject: "Enrich Columbus: Monthly Events for April!",
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
    @expo_registration.update_attribute(:follow_up, true)
  end

  def expo_registration_follow_up(expo_registration)
    @expo_registration = expo_registration
    mail(
      subject: "The Dublin Summer Camp Expo Is Coming! Please Read!",
      to: "#{expo_registration.email}"
      )
  end

  def expo_reminder(expo_registration)
    @expo_registration = expo_registration
    mail(
      subject: "Dublin Summer Camp Expo Tomorrow! Great Summer Activities!",
      to: "#{expo_registration.email}"
      )
  end

  def vendor_registration_confirmation(vendor_registration)
    @vendor_registration = vendor_registration
    mail(
      subject: "Vendor Registration Confirmation",
      to: "#{vendor_registration.email}"
      )
  end

  def vendor_follow_up(vendor_registration)
    @vendor_registration = vendor_registration
    attachments['dsce15_flyer.pdf'] = File.read('app/assets/forms/dsce15_flyer.pdf')
    mail(
      subject: "Expo Follow Up -- Please Read!",
      to: "#{vendor_registration.email}"
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
