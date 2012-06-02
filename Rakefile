task :environment do
  require File.expand_path(File.join(*%w[ initializer ]), File.dirname(__FILE__))
  require './VinosPhilos'
end

Dir.glob('tasks/*.rake').each { |r| import r } # import all tasks/files.rake

task :all => [:retweet, :search_and_reply, :follow, :tweet]

task :augment_dictionary => :environment do 
  home_timeline = Twitter.home_timeline(count: 30)
  File.open('config/dictionary.txt', 'a') do |f|
    home_timeline.each do |status|
      f.puts(filter_tweet(status.full_text.downcase)) unless status.is_from_self?
    end
  end
end

def filter_tweet(status)
  status.gsub!(/RT\s*@\S*\s*/i, "")
  status.gsub!(/http\S*/i, "")
  status.gsub!(/\sRT/i, ".")
  status.gsub!(/&\S*/, "")
  status.gsub!(/\s*$/, "")
  if status =~ /([.!?]$)/
    return status
  else 
    return status + "."
  end
end