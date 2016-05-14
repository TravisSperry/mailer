task send_reminder: :environment do
  send_reminder
end

def send_reminder
  registrations = Registration.where(year: 2)

  registrations.each do |registration|
   PonyExpress.registration_ticket(registration).deliver
  end
end
