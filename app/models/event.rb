class Event < ActiveRecord::Base
  attr_accessible :address, :city, :contact, :cost, :description,
                  :organization, :phone, :state, :title, :zip, :date,
                  :cost, :email, :age

  has_many :registrations
end
