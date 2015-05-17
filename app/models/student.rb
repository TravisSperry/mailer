class Student < ActiveRecord::Base

  belongs_to :registration

  GRADES = (4..9).to_a

  def full_name
    "#{first_name} #{last_name}"
  end
end