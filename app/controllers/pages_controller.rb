class PagesController < ApplicationController
  force_ssl if Rails.env.production?

  def home
    @contact = Contact.new
    @registrations = Registration.all
    @contacts = Contact.all
  end

  def robotics
  end
end
