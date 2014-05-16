class Student < ActiveRecord::Base

  belongs_to :registration

  GRADES = (5..9).to_a
end