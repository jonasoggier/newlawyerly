CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => "AWS",                       
    :aws_access_key_id      => ENV["AWS_ACCESSKEYID"],            
    :aws_secret_access_key  => ENV["AWS_SECRETACCESSKEY"],   
    :region                 => 'eu-west-1',       
  }
  config.fog_directory  = "lawyerly"     
end