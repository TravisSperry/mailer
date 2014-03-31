class AddCosiToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :cosi_member, :boolean
  end
end
