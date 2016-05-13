class AddConfirmationCodeToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :confirmation_code, :string
  end
end
