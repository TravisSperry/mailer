class Admin < ActiveRecord::Base
  devise :database_authenticatable,:recoverable, :trackable, :validatable
end
