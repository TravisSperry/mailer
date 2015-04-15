class PagesController < ApplicationController

  def home
    @contact = Contact.new
    if current_user
      @registrations = Registration.where(year: 1)
      @contacts = Contact.all
      @jrmf_students_count = Event.find(17).students.count
    end
  end

  def robotics
  end

  def camp_expo
    @expo_registration = ExpoRegistration.new
  end
end
