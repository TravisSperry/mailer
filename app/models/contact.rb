class Contact < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => false, :presence => true

  def name
    first_name + " " + last_name
  end
end
