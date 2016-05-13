task count: :environment do
   def count_students_registered(year)
     registrations = Registration.where(year: year)

     count = 0
     registrations.each do |registration|
       count
     end
   end
end
