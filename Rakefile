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
  Twitter.update("#{@status.text}")
  Twitter.update("#{@reply}")
end

task :follow => :environment do 
  Twitter.follow("mattruzicka")
end

task :interact => [:search, :reply, :follow]

def query
  @reply = "are you sure that's a tautology?"
  return "tautology"
end