class PagesController < ApplicationController

  def home
    @contact = Contact.new
    @expo_registrations = ExpoRegistration.all
    @contacts = Contact.all
  end

  def robotics
  end

  def camp_expo
    @expo_registration = ExpoRegistration.new
  end
end
