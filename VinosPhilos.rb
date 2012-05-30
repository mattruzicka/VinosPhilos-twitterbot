require 'sinatra'
require './initializer'

get '/' do
  @tweet = Twitter.home_timeline.first['text']
  erb :index
end

not_found do  
  erb :index  
end
