class RemoveQrCodeFromExpoRegistrations < ActiveRecord::Migration
  def change
    remove_column :expo_registrations, :qr_code, :text
  end
end
