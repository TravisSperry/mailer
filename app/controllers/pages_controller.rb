class PagesController < ApplicationController

  def home
    @contact = Contact.new
    if current_admin
    end
  end

  def robotics
  end

  def camp_expo
    @expo_registration = ExpoRegistration.new
  end
end
