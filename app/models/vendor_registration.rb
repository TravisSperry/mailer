class VendorRegistration < ActiveRecord::Base
  validates :email, format: { with:  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: true

  def save_with_payment
    if valid?
      charge_total = total * 100
      charge = Stripe::Charge.create(
                                      amount: charge_total,
                                      currency: "usd",
                                      card: vendor_stripe_card_token,
                                      description: "Registration for Dublin Summer Camp Expo."
                                    )
      self.stripe_charge_token = charge.id
      self.paid = true
      save!
    end
  end

  def save_without_payment
    if valid?
      save!
    end
  end
end
