class AddCheckInToExpoRegistration < ActiveRecord::Migration
  def change
    add_column :expo_registrations, :checked_in, :boolean, default: false
    add_column :expo_registrations, :checked_in_at, :date
  end
end
