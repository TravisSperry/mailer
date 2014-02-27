namespace :mail do
  desc "Send Event Mailer"
  task event_email: :environment do
    emails = %w(
      gjasper@ymcacolumbus.org
      info@campwyandot.org
      contact@friendlyhouseonline.com
      )

    emails.each do |email|
      PonyExpress.event_email(email).deliver
    end
  end
end