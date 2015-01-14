require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret ENV['DRAGON_FLY_SECRET']

  url_format "/media/:job/:name"

  if Rails.env.development? || Rails.env.test?
    datastore :s3,
              bucket_name: ENV['S3_BUCKET2D'],
              access_key_id: ENV['S3_KEY2'],
              secret_access_key: ENV['S3_SECRET2'],
              url_scheme: 'https'
  else
    datastore :s3,
              bucket_name: ENV['S3_BUCKET2'],
              access_key_id: ENV['S3_KEY2'],
              secret_access_key: ENV['S3_SECRET2'],
              url_scheme: 'https'
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
