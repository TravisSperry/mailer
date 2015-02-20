class Student < ActiveRecord::Base

  belongs_to :registration

  GRADES = (4..9).to_a
end