task send_survey: :environment do
  send_survey
end

def send_survey
  registrations = Registration.where(year: 2)

  registrations.each do |registration|
   PonyExpress.jrmf_survey(registration.contact_email).deliver
  end
end
