task count: :environment do
   def count_students_registered(year)
     registrations = Registration.where(year: year)

     count = 0
     registrations.each do |registration|
       count += registration.students.count
     end

     puts count
   end
end
