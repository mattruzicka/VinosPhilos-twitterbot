task :environment do
  require File.expand_path(File.join(*%w[ initializer ]), File.dirname(__FILE__))
  require './VinosPhilos'
end

task :search => :environment do 
  Twitter.search("#{select_query}", :rpp => 1, :result_type => "recent").map do |status|
    @status = status
  end
end

task :reply => :environment do 
  Twitter.update("@#{@status.from_user} #{@reply}", in_reply_to_status_id: @status.id)
end

task :follow => :environment do 
  Twitter.follow(@status.from_user)
end

task :interact => [:search, :reply, :follow]

def select_query
  $selection = $selection ||= 0
  $selection += 1 
  case $selection
  when 1 
    @reply = "Definitely not a sufficient condition. How is that even a consideration?"
    "\"sufficient condition\""
  when 2
    @reply = "I'm not quite sure I agree. Does the distinction even apply?"
    "\"normative descriptive\""
  when 3
    @reply = "There is no problem, God doesn't exist... boom."
    "circularity -measuring -bankia"
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
    @reply = "Wow, interesting. I definitely have questions though. Think you can help?"
    "phenomenological"
  when 8
    @reply = "That's not a necessary condition. Do I really need to explain why?"
    "\"is a necessary condition\""
  when 9 
    @reply = "Wow, interesting. I definitely have questions though. Think you can help?"
    "\"necessary condition\""
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
    $selection = 0
    @reply = "Sounds like hogwash... What in the world are you talking about?"
    "\"epistemic -closure\""
  end
end

