task :environment do
  require File.expand_path(File.join(*%w[ initializer ]), File.dirname(__FILE__))
  require './VinosPhilos'
end
 
task :search => :environment do 
  unless select_query == nil 
    Twitter.search("#{select_query}", :rpp => 1, :result_type => "recent").map do |status|
      @status = status
    end
  end
end

task :reply => :environment do 
  Twitter.update("@#{@status.from_user} #{@reply}", in_reply_to_status_id: @status.id) unless @status.from_user.downcase == "vinosphilos"
end

task :follow => :environment do 
  Twitter.follow(@status.from_user) unless @status.from_user.downcase == "vinosphilos"
end

task :build_dictionary => :environment do 
  home_timeline = Twitter.user_timeline("VinosPhilos") #Twitter.home_timeline(:count => 200) 
  
  home_timeline.each do |status| 
    File.open('config/dictionary.txt', 'a') do |f|
        f.puts(status.text)
    end
  end
end

task :tweet => :environment do
  gabbler = Gabbler.new
  dictionary = File.read('config/dictionary.txt')
  gabbler.learn(dictionary)
  tweeted = false
  until tweeted 
    tweet = gabbler.sentence 
    if tweet.length > 30 && tweet.length <= 140
      puts tweet # Twitter.update(tweet)
      tweeted = true
    end
  end
end



task :all => [:search, :reply, :follow]

def select_query
  case Time.now.hour
  when 0 
    @reply = "Wow, interesting. I definitely have questions though. Think you can help?"
    "\"phenomenological\""
  when 1 
    @reply = "Wow, interesting. I definitely have questions though. Think you can help?"
    "\"phenomenological\""
  when 2
    @reply = "I'm not quite sure I agree. Does that distinction even apply?"
    "normative descriptive"
  when 3
    @reply = "There is no problem, God doesn't exist... boom."
    "\"the problem of evil\""
  when 4
    @reply = "Reductio ad absurdum? Maybe you should look up what that means again."
    "reductio ad absurdum"
  when 5
    @reply = "In what way? I don't see the circularity."
    "circular logic"
  when 6
    @reply = "What do you mean?"
    "reductionist"
  when 7
    @reply = "Maybe that's a priori, but it also seems synthetic and a bit dishonest."
    "\"a priori knowledge\" -synthetic"
  when 8
    @reply = "That's not a necessary condition. Do I really need to explain why?"
    "\"is a necessary condition\""
  when 9 
    @reply = "Definitely not a sufficient condition. How is that even a consideration?"
    "\"sufficient condition\""
  when 10
    @reply = "Wait, why is that a fallacy? I'm not sure I get it..."
    "\"logical fallacy\" is OR it's OR a"
  when 11
    @reply = "Self-contradictory? I don't think so. Your tweet might be self-contradictory though..."
    "\"Self-contradictory\""
  when 12
    @reply = "How is that a tautology?"
    "tautology"
  when 13
    @reply = "That's beautiful! I want to hear more."
    "aesthetic nature"
  when 14
    @reply = "Sounds like hogwash... What in the world are you talking about?"
    "epistemic -closure"
  when 15
    # @reply = "Sounds like hogwash... What in the world are you talking about?"
    # "epistemic -closure"
  when 16
    # @reply = "Sounds like hogwash... What in the world are you talking about?"
    # "epistemic -closure"
  when 17
    # @reply = "Sounds like hogwash... What in the world are you talking about?"
    # "epistemic -closure"
  when 18
    # @reply = "Sounds like hogwash... What in the world are you talking about?"
    # "epistemic -closure"
  when 19
    # @reply = "Sounds like hogwash... What in the world are you talking about?"
    # "epistemic -closure"
  when 20
    # @reply = "Sounds like hogwash... What in the world are you talking about?"
    # "epistemic -closure"
  when 21
    # @reply = "Sounds like hogwash... What in the world are you talking about?"
    # "epistemic -closure"
  when 22
    # @reply = "Sounds like hogwash... What in the world are you talking about?"
    # "epistemic -closure"
  when 23
    # @reply = "Sounds like hogwash... What in the world are you talking about?"
    # "epistemic -closure"
  when 24
    # @reply = "Sounds like hogwash... What in the world are you talking about?"
    # "epistemic -closure"
  end
end
    
