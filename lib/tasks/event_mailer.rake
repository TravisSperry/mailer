namespace :mail do
  desc "Send Event Mailer"
  task event_email: :environment do
    emails = %w(
      director@mathplusacademy.com
      raj@mathplusacademy.com
      madison@mathplusacademy.com
      )

    emails.each do |email|
      PonyExpress.event_email(email).deliver
    end
  end
end