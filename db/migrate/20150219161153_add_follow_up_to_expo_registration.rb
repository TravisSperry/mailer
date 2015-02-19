class AddFollowUpToExpoRegistration < ActiveRecord::Migration
  def change
    add_column :expo_registrations, :follow_up, :boolean, default: false
  end
end
