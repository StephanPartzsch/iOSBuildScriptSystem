#!/usr/bin/ruby


##
# This file contains all default build parameters
# and defines overall build steps.
##

require_relative '../build_scripts/build_process.rb'



######################################
# SET THIS VALUE to group rake tasks #
######################################
job_name = 'setting_01'



namespace job_name do

	##
	# Define project specific settings
	##
	
	desc "Set the default parameters for Job: " + job_name
	task :set_default_parameters do	
		@workspace						= get_workspace_or_set_it_with_path( '[PATH_TO_WHERE_THE_PROJECT_LIVES]' ) # Full qualified
		
		@build_directory_path 			= @workspace + '/build'
		@reports_directory_path 		= @workspace + '/reports'
		@info_plist_path				= @workspace + '/iOSBuildScriptSystemExample/Info.plist'

		@project_name 					= 'iOSBuildScriptSystemExample'
		@scheme 						= 'iOSBuildScriptSystemExample'
		@configuration 					= 'Debug'

		@bundle_identifier				= 'de.sp.test.bse'

		@source_directories 			= @workspace + '/iOSBuildScriptSystemExample' 			# Separated by single space " "

		@user_defined_arguments 		= 'BLA=1 DV_DISPLAY_NAME="iOS BSE"'						# Separated by single space " "
		@preprocessor_macros 			= 'COLOR_RED=1 OUTLINE=1'								# Separated by single space " "

		@file_name						= 'iOS_BSE'
		@append_version_to_file_name	= true
		@version_prefix					= '-V'
		@app_version					= get_app_version
		@version_suffix					= '-dev-SDK8'
	end


	##
	# Define project specific tasks
	##
	
	desc "Sets up relevant metadata in plist files for Job: " + job_name
	task :setup_metadata do 
		puts "\n\n🔵  Setting up metadata ..."
		puts "-----------------------------------"
		
		if File.file?(@workspace + '/BuildMetadata.plist')
			build_commit = `git log --pretty=format:'%H' -n 1`
			puts "BuildCommit\t\t = #{build_commit}"
			`/usr/libexec/PlistBuddy -c 'Set :BuildCommit #{build_commit}' #{@workspace}/iOSBuildScriptSystemExample/BuildMetadata.plist`

			# Date format must be like "Sun Dec 31 16:00:00 CET 2011"
			`export LANG=en_US.UTF-8`
			build_date = `date +'%a %b %d %H:%M:%S %Z %Y'`
			puts "BuildTime\t\t = #{build_date}"
			`/usr/libexec/PlistBuddy -c 'Set :BuildTime #{build_date}' #{@workspace}/iOSBuildScriptSystemExample/BuildMetadata.plist`
		end
	end
	
	desc "Build app for Job: " + job_name
	task :build do
		Rake::Task[job_name + ":set_default_parameters"].execute
		Rake::Task[job_name + ":setup_metadata"].execute
		Rake::Task["build:ALL"].execute
	end


	desc "Run code metrics for Job: " + job_name
	task :analyze do
		Rake::Task[job_name + ":set_default_parameters"].execute
		Rake::Task["analyze:ALL"].execute
	end
end