PostageApp.configure do |config|
  config.api_key            = 'HWXKe24ITnHkcga8BFfwKUAM5cnNIAwG'
  config.recipient_override = 'tkendalls1@gmail.com' unless Rails.env.production?
end
