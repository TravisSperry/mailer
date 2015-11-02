class NewsletterMailer < ActionMailer::Base
  default from: "events@enrichcolumbus.org"

  def monthly_mailer(contact)
    @contact = contact

    mail(
      subject: "Enrich Columbus: Monthly Events for October!",
      to: "#{contact.email}"
      )
  end
end
