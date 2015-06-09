#!/usr/bin/ruby


require_relative 'build_steps/setup_parameters.rb'
require_relative 'build_steps/set_plist_values.rb'
require_relative 'build_steps/test_app.rb'
require_relative 'build_steps/build_app.rb'
require_relative 'build_steps/sign_app.rb'
require_relative 'build_steps/distribute_app.rb'

require_relative 'metrics/count_lines.rb'




##
# Rake task for each step to build the app
##

namespace :build do
	
	desc "Prepares and logs neccessary build parameters (set/overwrite)"
	task :setup_parameters do
		setup_parameters 
	end
	
	desc "Sets up info-plist values"
	task :set_plist_values do
		set_plist_values
	end

	desc "Runs all tests of the defined project's scheme"
	task :test do
		test_app
	end
	
	desc "Builds the application"
	task :build do
		build_app
	end

	desc "Signs the application" 
	task :sign do
		sign_app
	end
	
	desc "Distributes the app to Tankstelle and S3 server"	
	task :distribute do
		distribute_app
	end
	
	desc "Runs the whole build prozess (setup|clean|test|build|sign|distribute)"
	task :ALL do
	
		Rake::Task["build:setup_parameters"].invoke
		Rake::Task["build:set_plist_values"].invoke
		Rake::Task["build:test"].invoke
		Rake::Task["build:build"].invoke
		Rake::Task["build:sign"].invoke
		Rake::Task["build:distribute"].invoke

		puts "\n\n✅  Everything done!"
		puts "==================================="
		puts ""
	end
	
end



##
# Rake tasks for each step to analyze the app
##

namespace :analyze do

	desc "Count the lines of code"
	task :loc do
		count_lines
	end
	
	
	desc "Runs all the code metrics (loc)"
	task :ALL do
		Rake::Task["build:setup_parameters"].invoke
		Rake::Task["analyze:loc"].invoke
		
		puts "\n\n✅  Everything analyzed!"
		puts "==================================="
		puts ""
	end
end





##
# Helper methods
##

def get_app_version
	app_version = `/usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' #{@info_plist_path}`.strip
	return app_version
end