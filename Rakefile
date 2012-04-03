#############################################################################
#
# Helper functions
#
#############################################################################

def bootstrap_file
  @bootstrap_file ||= File.expand_path("../config/boot.rb", __FILE__)
end

#############################################################################
#
# Standard tasks
#
#############################################################################

desc "Open an irb session preloaded with this app"
task :console do
  sh "irb -r #{bootstrap_file}"
end

task :environment do
  require bootstrap_file
end
