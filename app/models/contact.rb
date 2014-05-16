class Contact < ActiveRecord::Base

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :format => { :with => /\A\S+@\S+\.\S+\z/ }, :allow_blank => false, :presence => true

  def name
    first_name + " " + last_name
  end
end
