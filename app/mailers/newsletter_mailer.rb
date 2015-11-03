  require 'postageapp/mailer'

class NewsletterMailer < PostageApp::Mailer
  default from: "events@enrichcolumbus.org"

  def monthly_mailer(contact, newsletter)
    @contact = contact
    @newsletter = newsletter
    @events = newsletter.events

    mail(
      subject: "Enrich Columbus: Monthly Events for #{Date::MONTHNAMES[@newsletter.month]}!",
      to: "#{contact.email}"
      )
  end
end
