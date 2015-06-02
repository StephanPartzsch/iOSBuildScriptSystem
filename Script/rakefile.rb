#!/usr/bin/ruby

load 'build_parameter.rb'
load 'build/test_app.rb'
load 'build/build_app.rb'
load 'build/sign_app.rb'
load 'build/distribute_app.rb'


task :default do
	system "rake --tasks"
end


namespace :build do
	
	desc "Prepare and log neccessary build parameters and settings (set/overwrite)"
	task :setup do
		setup
	end
	
	desc "Cleans the build directory"
	task :clean do
		clean_build_directory
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
	task :ALL => [:setup, :clean, :test, :build, :sign, :distribute] do
		puts "✅  Everything done."
		puts ""
	end
	
end



namespace :analyze do

	desc "Count the lines of code"
	task :loc do
#		if true
#			puts "Calling test2 task."
#			Rake::Task["main:test2"].invoke #invokes main:test2
#		else
#			abort()
#		end
		puts "🔵  Counting lines of code..."
	end
	
	
	desc "Runs all the code metrics (loc)"
	task :ALL => [:loc] do
		puts "\n\n✅  Everything analyzed."
	end
end











def setup
	puts "\n\n🔵  Build parameters and settings..."
	puts "-----------------------------------"
	
	# Print current Xcode verion
	puts "🔹  Xcode version \t" + `xcodebuild -version`
	puts "🔹  Xcode path \t\t" + `xcode-select -print-path`
	puts ""
	
	# Print build parameter
	puts "➔  Overwrite the following parameters in Jenkins build job. Use the parameter name in [brackets]"
	puts "---"
	
	workspace = `echo "$WORKSPACE"`.strip
	if !workspace.empty?; @workspace = workspace end
	puts "🔹  Workspace \t\t" + @workspace
	
	build_directory = `echo "$BUILD_DIRECTORY"`.strip
	if !build_directory.empty?; @build_directory = build_directory end
	puts "🔸  [BUILD_DIRECTORY] \t" + @build_directory + ""
	
	project_name = `echo "$PROJECT_NAME"`.strip
	if !project_name.empty?; @project_name = project_name end
	puts "🔸  [PROJECT_NAME] \t" + @project_name + ""
	
	scheme = `echo "$SCHEME"`.strip
	if !scheme.empty?; @scheme = scheme end
	puts "🔸  [SCHEME] \t\t" + @scheme + ""
	
	configuration = `echo "$CONFIGURATION"`.strip
	if !configuration.empty?; @configuration = configuration end
	puts "🔸  [CONFIGURATION] \t\t" + @configuration + ""
end



def clean_build_directory
	puts "\n\n🔵  Cleaning build directory..."
	puts "-----------------------------------"
	
	# Clean build directory
	`rm -rvf #{@build_directory}`
	`mkdir -p #{@build_directory}`
end