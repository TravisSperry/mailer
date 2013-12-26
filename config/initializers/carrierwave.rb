CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['S3_KEY1'],                    # required
    :aws_secret_access_key  => ENV['S3_SECRET1'],                 # required
    :region                 => 'eu-east-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['S3_BUCKET1']                       # required
  config.fog_public     = false                              # optional, defaults to true
end