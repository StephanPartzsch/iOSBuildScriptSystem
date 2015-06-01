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
	
	desc "Prepare neccessary build parameter (set/overwrite)"
	task :prepare_build do
		prepare_build_parameter
	end
	
	desc "Logs all relevant build parameter and settings"
	task :log do
		log_build_info
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
		puts ">>> Building app ..."
				build_app
	end

	desc "CSigns the application" 
	task :sign do
		puts ">>> Signing app ..."
	end
	
	desc "Distributes the app to Tankstelle and S3 server"	
	task :distribute do
		puts ">>> Distributing app ..."
	end
	
	desc "Runs the whole build prozess (test|build|sign|distribute)"
	task :ALL => [:prepare_build, :log, :clean, :test, :build, :sign, :distribute] do
		puts ">>> Everything done."
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
		puts ">>> Counting lines of code..."
	end
	
	
	desc "Runs all the code metrics (loc)"
	task :ALL => [:loc] do
		puts ">>> Everything analyzed."
	end
end












def prepare_build_parameter
	puts "\n\n>>> Setting build parameter..."
	puts "-----------------------------------"
	puts "Overwrite the following parameter in Jenkins build job..."

	workspace = `echo "$WORKSPACE"`.strip
	if !workspace.empty?; @workspace = workspace end
	
	puts "- BUILD_DIRECTORY"
	build_directory = `echo "$BUILD_DIRECTORY"`.strip
	if !build_directory.empty?; @build_directory = build_directory end

	puts "- PROJECT_NAME"
	project_name = `echo "$PROJECT_NAME"`.strip
	if !project_name.empty?; @project_name = project_name end

	puts "- SCHEME"
	scheme = `echo "$SCHEME"`.strip
	if !scheme.empty?; @scheme = scheme end
end


def log_build_info
	puts "\n\n>>> Build parameter and settings..."
	puts "-----------------------------------"
	
	# Print current Xcode verion
	puts "Xcode version: " + `xcodebuild -version`
	puts "Xcode path: " + `xcode-select -print-path`
	puts ""
	
	# Print build parameter
	puts "Workspace: " + @workspace
	puts "Build directory: " + @build_directory
	puts "Project name: " + @project_name
	puts "Scheme: " + @scheme
end


def clean_build_directory
	puts "\n\n>>> Cleaning build directory..."
	puts "-----------------------------------"
	
	# Clean build directory
	`rm -rvf #{@build_directory}`
	`mkdir -p #{@build_directory}`
end