class AddContactEmailToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :contact_email, :string
  end
end
