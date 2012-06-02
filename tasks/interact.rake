task :retweet => :environment do
  next unless Time.now.utc.hour % 3 == 0
  Twitter.home_timeline(:count => 1).each do |status|
    tweet = "RT @#{status.from_user} #{status.full_text}"
    Twitter.update(tweet) if tweet.length <= 140 &&  status.is_from_self? == false
    sleep some_time 
  end
end

task :search_and_reply => :environment do 
  unless select_query == nil 
    Twitter.search("#{select_query}", :rpp => 1, :result_type => "recent").map do |status|
      @status = status
    end
  end
  Twitter.update("@#{@status.from_user} #{@reply}", in_reply_to_status_id: @status.id) unless @status.is_from_self?
  sleep some_time
end

task :follow => :environment do 
  Twitter.follow(@status.from_user) unless @status.is_from_self?
end

task :tweet => :environment do
  next unless Time.now.utc.hour % 2 == 0
  tweeted = false
  until tweeted 
    tweet = GABBLER.sentence 
    if tweet.length > 30 && tweet.length <= 140
      Twitter.update(tweet)
      tweeted = true
    end
  end
end

public
 
  def is_from_self?
    self.from_user.downcase == "vinosphilos"
  end
  
  def some_time
    (5..30).to_a.sample
  end
    
