class AddStripeToVedorRegistrations < ActiveRecord::Migration
  def change
    add_column :vendor_registrations, :vendor_stripe_card_token, :string
  end
end
