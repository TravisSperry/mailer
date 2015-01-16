class AddStripeTokenToVendorRegistrations < ActiveRecord::Migration
  def change
    add_column :vendor_registrations, :stripe_charge_token, :string
  end
end
