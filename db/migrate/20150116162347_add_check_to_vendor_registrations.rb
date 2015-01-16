class AddCheckToVendorRegistrations < ActiveRecord::Migration
  def change
    add_column :vendor_registrations, :pay_by_check, :boolean, default: false
  end
end
