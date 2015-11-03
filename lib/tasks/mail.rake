namespace :mail do
  desc "Send Monthly Newsletter"
  task monthly_mailer: :environment do
    monthly_mailer
  end

  task monthly_mailer_test: :environment do
    monthly_mailer_test
  end

  def monthly_mailer
    #args passed to rake task month="March" year=2015 accessed with ENV['month'] etc.
    month = Date::MONTHNAMES.index(ENV['month'].downcase.capitalize)
    year = ENV['year'].to_i
    newsletter = Newsletter.where(month: month).where(year: 2015).first
    contacts = Contact.where("email_opt_in = ?", true)

    contacts.each do |contact|
      NewsletterMailer.monthly_mailer(contact, newsletter).deliver
    end
  end

  def monthly_mailer_test
    #args passed to rake task month="March" year=2015 accessed with ENV['month'] etc.
    month = Date::MONTHNAMES.index(ENV['month'].downcase.capitalize)
    year = ENV['year'].to_i
    newsletter = Newsletter.where(month: month).where(year: 2015).first

    if Rails.env.development?
      contact = Contact.find 77
    else
      contact = Contact.find 2
    end
    response = NewsletterMailer.monthly_mailer(contact, newsletter).deliver
    puts response
  end
end
