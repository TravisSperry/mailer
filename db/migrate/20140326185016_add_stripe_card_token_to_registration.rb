class AddStripeCardTokenToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :stripe_card_token, :string
  end
end
