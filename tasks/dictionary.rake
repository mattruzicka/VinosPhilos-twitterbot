
task :augment => :environment do 
  home_timeline = Twitter.home_timeline(count: 50)
  File.open('config/dictionary.txt', 'a') do |f|
    home_timeline.each do |status|
      f.puts(filter_tweet(status.full_text.downcase)) unless status.is_from_self?
    end
  end
end

task :load => :environment do 
  GABBLER = Gabbler.new
  dictionary = File.read('config/dictionary.txt')
  GABBLER.learn(dictionary)
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


