require "rubygems"
require "bundler"
Bundler.setup

require 'twitter'
require 'gabbler'

ENVIRONMENT = "development"
APP_CONFIG = YAML.load(File.read("config/config.yml"))[ENVIRONMENT]

Twitter.configure do |config|
  config.consumer_key = APP_CONFIG[:twitter][:consumer_key]
  config.consumer_secret = APP_CONFIG[:twitter][:consumer_secret]
  config.oauth_token = APP_CONFIG[:twitter][:oauth_token]
  config.oauth_token_secret = APP_CONFIG[:twitter][:oauth_token_secret]
end

# load dictionary
GABBLER = Gabbler.new
dictionary = File.read('config/dictionary.txt')
GABBLER.learn(dictionary)