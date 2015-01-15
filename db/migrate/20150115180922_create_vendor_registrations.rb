class CreateVendorRegistrations < ActiveRecord::Migration
  def change
    create_table :vendor_registrations do |t|
      t.string :organization_name
      t.string :contact
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :ages
      t.boolean :registration_fee
      t.boolean :late_fee
      t.boolean :ad_fee
      t.integer :total

      t.timestamps
    end
  end
end
