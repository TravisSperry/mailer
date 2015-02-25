class ExpoRegistration < ActiveRecord::Base
  validates :email, format: { with:  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: { message: "Looks like you may have already registered."}

  dragonfly_accessor :qr_code

  def add_qr
    if Rails.env.development? || Rails.env.development?
      qr_code_img = RQRCode::QRCode.new(Rails.application.routes.url_helpers.check_in_url(:host => "localhost:3000", id: self.id), :size => 7, :level => :h ).to_img
    else
      qr_code_img = RQRCode::QRCode.new(Rails.application.routes.url_helpers.check_in_url(:host => "enrichcolumbus.org"), :size => 7, :level => :h ).to_img
    end
    qr_code_img = qr_code_img.resize(200, 200)
    self.update_attribute :qr_code, qr_code_img.to_string
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |expo_reg|
        csv << expo_reg.attributes.values_at(*column_names)
      end
    end
  end
end
