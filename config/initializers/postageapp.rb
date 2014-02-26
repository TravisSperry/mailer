PostageApp.configure do |config|
  config.api_key            = 'w3CH8Skb6A1usfe1IeogVWWMER19TLTR'
  config.recipient_override = 'tkendalls1@gmail.com' unless Rails.env.production?
end
