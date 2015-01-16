class AddPaidToVendorRegistrations < ActiveRecord::Migration
  def change
    add_column :vendor_registrations, :paid, :boolean, default: false
  end
end
