class Event < ActiveRecord::Base

  has_many :registrations
  has_many :students, through: :registrations
  has_many :parents, through: :registrations



  def self.registrations_to_csv
    CSV.generate do |csv|
      csv << column_names
      registrations.each do |registration|
        csv << registration.attributes.values_at(*column_names)
      end
    end
  end
end
