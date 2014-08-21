class PagesController < ApplicationController

  def home
    @contact = Contact.new
    @registrations = Registration.all
    @contacts = Contact.all
  end

  def robotics
  end
end
