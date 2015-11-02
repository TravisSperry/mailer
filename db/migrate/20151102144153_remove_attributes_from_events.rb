class RemoveAttributesFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :contact, :string
    remove_column :events, :phone, :string
    remove_column :events, :address, :string
    remove_column :events, :city, :string
    remove_column :events, :state, :string
    remove_column :events, :zip, :string
    remove_column :events, :date, :date
    remove_column :events, :cost, :string
    remove_column :events, :approved, :boolean
    remove_column :events, :age, :string
    remove_column :events, :email, :string
  end
end
