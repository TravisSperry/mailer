class Newsletter < ActiveRecord::Base
  has_many :events

  def name
    "#{Date::MONTHNAMES[month]} #{year}"
  end
end
