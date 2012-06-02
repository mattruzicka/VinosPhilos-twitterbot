task :environment do
  require File.expand_path(File.join(*%w[ initializer ]), File.dirname(__FILE__))
  require './VinosPhilos'
end

Dir.glob('tasks/*.rake').each { |r| import r } # import all tasks/files.rake

task :dictionary => [:augment, :load]
task :interact => [:retweet, :search_and_reply, :follow, :tweet]
