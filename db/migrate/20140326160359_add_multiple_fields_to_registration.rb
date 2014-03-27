class AddMultipleFieldsToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :volunteer, :boolean
    add_column :registrations, :fee_waiver, :boolean
    add_column :registrations, :consent, :boolean
    add_column :registrations, :comments, :text
  end
end
