class AddQrCodeUidStringToExpoRegistrations < ActiveRecord::Migration
  def change
    add_column :expo_registrations, :qr_code_uid, :string
  end
end
