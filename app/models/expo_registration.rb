class ExpoRegistration < ActiveRecord::Base
  validates :email, format: { with:  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: { message: "Looks like you may have already registered."}
end
