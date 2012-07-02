require "rubygems"
require "bundler"
Bundler.setup

require 'twitter'
require 'gabbler'

ENVIRONMENT = "development"
APP_CONFIG = YAML.load(File.read("config/config.yml"))[ENVIRONMENT]

if ENVIRONTMENT == "developmeent"
  Twitter.configure do |config|
    config.consumer_key = APP_CONFIG[:twitter][:consumer_key]
    config.consumer_secret = APP_CONFIG[:twitter][:consumer_secret]
    config.oauth_token = APP_CONFIG[:twitter][:oauth_token]
    config.oauth_token_secret = APP_CONFIG[:twitter][:oauth_token_secret]
  end
else 
  Twitter.configure do |config|
    config.consumer_key = CONSUMER_KEY
    config.consumer_secret = CONSUMER_SECRET
    config.oauth_token = OAUTH_TOKEN
    config.oauth_token_secret = OAUTH_TOKEN_SECRET
  end
end

# load dictionary
GABBLER = Gabbler.new
dictionary = File.read('config/dictionary.txt')
GABBLER.learn(dictionary)