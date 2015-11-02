class Newsletter < ActiveRecord::Base
  has_many :events

  validates :month, uniqueness: { scope: :year }

  def name
    "#{Date::MONTHNAMES[month]} #{year}"
  end
end
