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
	
	desc "Prepares and logs neccessary build parameters (set/overwrite)"
	task :setup_parameters do
		setup_parameters
	end
	
	desc "Sets up relevant metadata in plist files"
	task :setup_metadata do
		setup_metadata
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
	task :ALL => [:setup_parameters, :setup_metadata, :test, :build, :sign, :distribute] do
		puts "\n\n✅  Everything done."
		puts "==================================="
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
		puts "🔵  Counting lines of code ..."
	end
	
	
	desc "Runs all the code metrics (loc)"
	task :ALL => [:loc] do
		puts "\n\n✅  Everything analyzed."
	end
end











def setup_parameters
	puts "\n\n🔵  Build parameters and settings ..."
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
	
	build_directory_path = `echo "$BUILD_DIRECTORY_PATH"`.strip
	if !build_directory_path.empty?; @build_directory_path = build_directory_path end
	puts "🔸  [BUILD_DIRECTORY_PATH] \t" + @build_directory_path+ ""
	
	project_name = `echo "$PROJECT_NAME"`.strip
	if !project_name.empty?; @project_name = project_name end
	puts "🔸  [PROJECT_NAME] \t" + @project_name + ""
	
	scheme = `echo "$SCHEME"`.strip
	if !scheme.empty?; @scheme = scheme end
	puts "🔸  [SCHEME] \t\t" + @scheme + ""
	
	configuration = `echo "$CONFIGURATION"`.strip
	if !configuration.empty?; @configuration = configuration end
	puts "🔸  [CONFIGURATION] \t\t" + @configuration + ""
	
	app_name = `echo "$APP_NAME"`.strip
	if !app_name.empty?; @app_name = app_name end
	puts "🔸  [APP_NAME] \t\t" + @app_name + ""
end



def setup_metadata
	puts "\n\n🔵 Setting build metadata ..."
	puts "-----------------------------------"
	
	if File.file?(@workspace + '/BuildMetadata.plist')
		build_commit = `git log --pretty=format:'%H' -n 1`
		puts "DVAGBuildCommit\t = #{build_commit}"
		`/usr/libexec/PlistBuddy -c 'Set :DVAGBuildCommit #{build_commit}' #{@workspace}/BuildMetadata.plist`

		# Date format must be like "Sun Dec 31 16:00:00 CET 2011"
		`export LANG=en_US.UTF-8`
		build_date = `date +'%a %b %d %H:%M:%S %Z %Y'`
		puts "DVAGBuildTime\t = #{build_date}"
		`/usr/libexec/PlistBuddy -c 'Set :DVAGBuildTime #{build_date}' #{@workspace}/BuildMetadata.plist`
	end
end