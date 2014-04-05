class PagesController < ApplicationController
  force_ssl

  def home
    @contact = Contact.new
    @registrations = Registration.all
    @contacts = Contact.all
  end
end
