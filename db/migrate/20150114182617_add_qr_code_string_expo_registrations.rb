class AddQrCodeStringExpoRegistrations < ActiveRecord::Migration
  def change
    add_column :expo_registrations, :qr_code, :string
  end
end
