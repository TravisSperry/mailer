namespace :send do
  desc "Send Expo Emails"
  task expo_reminder: :environment do
    expo_reminder
  end

  def expo_reminder
    registrations = ExpoRegistration.all
    count = 0

    registrations.each do |registrations|
      count += 1
      PonyExpress.expo_registration_follow_up(registration).deliver
    end

    puts "#{count} emails sent."
  end
end
