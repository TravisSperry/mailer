class Student < ActiveRecord::Base
  attr_accessible :email, :first_name, :grade, :last_name, :registration_id

  GRADES = (5..9).to_a
end
