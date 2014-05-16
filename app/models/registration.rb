class Registration < ActiveRecord::Base

  validates :contact_email, presence: true, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, on: :create }

    /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i


  belongs_to :event
  has_many :students
  has_many :parents

  accepts_nested_attributes_for :students, :reject_if => lambda { |a| a[:first_name].blank? && a[:last_name].blank? }
  accepts_nested_attributes_for :parents, :reject_if => lambda { |a| a[:first_name].blank? && a[:last_name].blank? }

  def save_with_payment
    if valid?
      charge_total = total
      charge = Stripe::Charge.create(
                                      amount: charge_total,
                                      currency: "usd",
                                      card: stripe_card_token,
                                      description: "Registration for #{student_count} student(s)."
                                    )
      self.stripe_charge_token = charge.id
      save!
    end
  end

  def save_without_payment
    if valid?
      save!
    end
  end
end
