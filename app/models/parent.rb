class Parent < ActiveRecord::Base
  ROLES = %w(Teacher Parent Other)
  VOLUNTEER = ["Assign me where I'm most needed", "I can help with math", "Setup", "Cleanup", "I cannot assist"]



  def full_name
    "#{first_name} #{last_name}"
  end
end
