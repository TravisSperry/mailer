class PagesController < ApplicationController

  def home
    @contact = Contact.new
    @registrations = Registration.where(year: 1)
    @contacts = Contact.all
  end

  def robotics
  end

  def camp_expo
    @expo_registration = ExpoRegistration.new
  end
end
