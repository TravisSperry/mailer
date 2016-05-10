task spread_the_word: :environment do
  send_email
end

def send_email
  registration_emails = Registration.distinct(:contact_email).pluck(:contact_email)
  count = 0

  registration_emails.each do |email|
    if PonyExpress.jrmf_spread_word(email).deliver
      count += 1
    end
  end

  puts "#{count} emails sent."
end
