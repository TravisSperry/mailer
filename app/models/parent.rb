class Parent < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :registration_id, :role, :volunteer
  ROLES = %w(Teacher Parent Other)
  VOLUNTEER = ["Assign me where I'm most needed", "I can help with math", "Setup", "Cleanup", "I cannot assist"]
end
