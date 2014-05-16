class Event < ActiveRecord::Base

  has_many :registrations
  has_many :students, through: :registrations
  has_many :parents, through: :registrations
end
