task :environment do
  require File.expand_path(File.join(*%w[ initializer ]), File.dirname(__FILE__))
  require './VinosPhilos'
end

task :search => :environment do 
  Twitter.search("#{query}", :rpp => 1, :result_type => "recent").map do |status|
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

def query
  @reply = "Are you sure that's a tautology?"
  return "tautology"
end