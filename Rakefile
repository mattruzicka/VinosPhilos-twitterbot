task :environment do
  require File.expand_path(File.join(*%w[ initializer ]), File.dirname(__FILE__))
  require './VinosPhilos'
end

# import all tasks/files endeding in .rake 
Dir.glob('tasks/*.rake').each { |r| import r }

task :search => :environment do 
  unless select_query == nil 
    Twitter.search("#{select_query}", :rpp => 1, :result_type => "recent").map do |status|
      @status = status
    end
  end
end

task :reply => :environment do 
  Twitter.update("@#{@status.from_user} #{@reply}", in_reply_to_status_id: @status.id) unless @status.from_user.downcase == "vinosphilos" || @status == "" 
end

task :follow => :environment do 
  Twitter.follow(@status.from_user) unless @status.from_user.downcase == "vinosphilos"
end

task :tweet => :environment do
  tweeted = false
  until tweeted 
    tweet = GABBLER.sentence 
    if tweet.length > 30 && tweet.length <= 140
      puts tweet#Twitter.update(tweet)
      tweeted = true
    end
  end
end

task :all => [:search, :reply, :follow, :augment_dictionary, :tweet]

def retweet(status)
  Twitter.update("RT @#{status.from_user} #{status.text}")
end

def select_query
  case (Time.now.hour)
  when 0 
    @reply = "C'mon now... you high?"
    "construct OR constructs mind reality OR human OR thoughts"
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
    @reply = "That sounds like the same thing as saying nothing... what?"
    "subjective existence"
  when 16
    @reply = "Universal law? In what universe is that..?"
    "\"universal law\""
  when 17
    @reply = "Categorical imperative?.."
    "\"categorical imperative\""
  when 18
    @reply = "That's interesting, but it hardly seems definsible. Please elaborate."
    "relativism truth OR truths OR objective"
  when 19
    @reply = "Speaking of a "
    "defensible OR logical position"
  when 20
     @reply = "Speaking of dialectics, please explain to me what you mean."
     "dialectic"
  when 21
    @reply = "What, exactly, is being said here?"
    "determinism \"free will\" -exam -PPT -cards"
  when 22
    @reply = "Hmm... in what way?"
    "aspects logic OR reality"
  when 23
    @reply = "Maybe that's true of your mind..."
    "\"the mind\" -my is -of -have -fuck -clear"
  when 24
    @reply = "Interesting, I'd say you're on the right track. Please say more."
    "\"ethical systems\" OR \"ethical system\""
  end
end
    
