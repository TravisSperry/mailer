class NewsletterPreview < ActionMailer::Preview

  def montly_mailer
    Newsletter.monthly_mailer(Contact.find 77)
  end
end
