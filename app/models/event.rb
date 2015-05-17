class Event < ActiveRecord::Base

  has_many :registrations
  has_many :students, through: :registrations
  has_many :parents, through: :registrations



  def registrations_to_csv
    CSV.generate do |csv|
      registrations.each do |registration|
        attributes = []
        attributes << registration.id
        registration.parents{|parent| attributes << parent.full_name}
        registration.students{|student| attributes << student.full_name}
        csv << attributes
      end
    end
  end
end
