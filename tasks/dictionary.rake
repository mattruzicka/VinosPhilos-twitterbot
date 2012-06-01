task :load_dictionary => :environment do
  dictionary = File.read('config/dictionary.txt')
  GABBLER.learn(dictionary)
end

task :augment_dictionary => :environment do 
  home_timeline = Twitter.home_timeline(:count => 200)
  File.open('config/dictionary.txt', 'a') do |f|
    home_timeline.each do |status|
      f.puts(filter_tweet(status.full_text)) unless status.from_user == "VinosPhilos"
    end
  end
end

def filter_tweet(status)
  status.gsub!(/RT\s*@\S*\s*/i, "")
  status.gsub!(/@\S*/, "philosophy")
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