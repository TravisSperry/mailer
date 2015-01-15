class AddYearToVendorRegistrations < ActiveRecord::Migration
  def change
    add_column :vendor_registrations, :year, :integer
  end
end
