task add_code_toregistrations: :environment do
   def update_codes
     registrations = Registrations.all

     registrations.each do |registration|
       registration.update_attribute :confirmation_code, SecureRandom.base64(12)
     end
   end
end
