class AddQrCodeToExpoRegistration < ActiveRecord::Migration
  def change
    add_column :expo_registrations, :qr_code, :text
  end
end
