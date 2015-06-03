#!/usr/bin/ruby

load 'build_parameter.rb'

load 'build/test_app.rb'
load 'build/build_app.rb'
load 'build/sign_app.rb'
load 'build/distribute_app.rb'

load 'metrics/count_lines.rb'



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
		puts "\n\n✅  Everything done!"
		puts "==================================="
		puts ""
	end
	
end



namespace :analyze do

	desc "Count the lines of code"
	task :loc do
		count_lines
	end
	
	
	desc "Runs all the code metrics (loc)"
	task :ALL => [:loc] do
		puts "\n\n✅  Everything analyzed!"
		puts "==================================="
		puts ""
	end
end











def setup_parameters
	puts "\n\n🔵  Build parameters and settings ..."
	puts "-----------------------------------"
	
	# Print current Xcode verion
	puts "🔹  Xcode version \t\t" + `xcodebuild -version`.gsub("\n", "  ")
	puts "🔹  Xcode path \t\t\t" + `xcode-select -print-path`
	puts "---\n\n"
	
	# Print build parameter
	puts "➔  Overwrite the following parameters (🔸 ) in Jenkins build job. Use the parameter name in [brackets]"
	puts "---"
	
	puts "🔹  Workspace \t\t\t" + @workspace
	puts "🔹  Reports directory path \t" + @reports_directory_path
	
	build_directory_path = `echo "$BUILD_DIRECTORY_PATH"`.strip
	if !build_directory_path.empty?; @build_directory_path = build_directory_path end
	puts "🔸  [BUILD_DIRECTORY_PATH] \t" + @build_directory_path + ""
	
	info_plist_path = `echo "$INFO_PLIST_PATH"`.strip
	if !info_plist_path.empty?; @info_plist_path = info_plist_path end
	puts "🔸  [INFO_PLIST_PATH] \t\t" + @info_plist_path + ""
	puts ""
	
	project_name = `echo "$PROJECT_NAME"`.strip
	if !project_name.empty?; @project_name = project_name end
	puts "🔸  [PROJECT_NAME] \t\t" + @project_name + ""
	
	scheme = `echo "$SCHEME"`.strip
	if !scheme.empty?; @scheme = scheme end
	puts "🔸  [SCHEME] \t\t\t" + @scheme + ""
	
	configuration = `echo "$CONFIGURATION"`.strip
	if !configuration.empty?; @configuration = configuration end
	puts "🔸  [CONFIGURATION] \t\t" + @configuration + ""
	puts ""
	
	file_name_base = `echo "$FILE_NAME_BASE"`.strip
	if !file_name_base.empty?; @file_name_base = file_name_base end
	puts "🔸  [FILE_NAME_BASE] \t\t" + @file_name_base + ""
	
	file_name_suffix = `echo "$FILE_NAME_SUFFIX"`.strip
	if !file_name_suffix.empty?; @file_name_suffix = file_name_suffix end
	puts "🔸  [FILE_NAME_SUFFIX] \t\t" + @file_name_suffix + ""
	
	puts "🔹  App version \t\t\t" + @app_version + ""
	
	puts "🔹  File name (app/ipa) \t\t" + @file_name + ""
	puts ""

	bundle_identifier = `echo "$BUNDLE_IDENTIFIER"`.strip
	if !bundle_identifier.empty?; @bundle_identifier = bundle_identifier end
	puts "🔸  [BUNDLE_IDENTIFIER] \t\t" + @bundle_identifier + ""
	puts ""
	
	source_directories = `echo "$SOURCE_DIRECTORIES"`.strip
	if !source_directories.empty?; @source_directories = source_directories end
	puts "🔸  [SOURCE_DIRECTORIES] \t" + @source_directories + ""
	puts ""

	user_defined_arguments = `echo "$USER_DEFINED_ARGUMENTS"`.strip
	if !user_defined_arguments.empty?; @user_defined_arguments = user_defined_arguments end
	puts "🔸  [USER_DEFINED_ARGUMENTS] \t" + @user_defined_arguments + ""
	
	preprocessor_macros = `echo "$PREPROCESSOR_MACROS"`.strip
	if !preprocessor_macros.empty?; @preprocessor_macros = preprocessor_macros end
	puts "🔸  [PREPROCESSOR_MACROS] \t" + @preprocessor_macros + ""
end



def setup_metadata
	puts "\n\n🔵  Setting build metadata ..."
	puts "-----------------------------------"
	
	if File.file?(@workspace + '/BuildMetadata.plist')
		build_commit = `git log --pretty=format:'%H' -n 1`
		puts "DVAGBuildCommit\t\t = #{build_commit}"
		`/usr/libexec/PlistBuddy -c 'Set :DVAGBuildCommit #{build_commit}' #{@workspace}/BuildMetadata.plist`

		# Date format must be like "Sun Dec 31 16:00:00 CET 2011"
		`export LANG=en_US.UTF-8`
		build_date = `date +'%a %b %d %H:%M:%S %Z %Y'`
		puts "DVAGBuildTime\t\t = #{build_date}"
		`/usr/libexec/PlistBuddy -c 'Set :DVAGBuildTime #{build_date}' #{@workspace}/BuildMetadata.plist`
	end
	
	`/usr/libexec/PlistBuddy -c 'Set :CFBundleIdentifier #{@bundle_identifier}' #{@info_plist_path}`
	puts "CFBundleIdentifier\t = #{@bundle_identifier}"
end