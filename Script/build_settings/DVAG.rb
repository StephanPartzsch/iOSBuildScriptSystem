#!/usr/bin/ruby


##
# This file contains all default build parameters
# and defines overall build steps.
##

require_relative '../build_scripts/build_process.rb'



######################################
# SET THIS VALUE to group rake tasks #
######################################
job_name = 'DVAG'



namespace job_name do

	##
	# Define project specific settings
	##
	
	desc "Set the default parameters for Job: " + job_name
	task :set_default_parameters do	
		@workspace						= get_workspace_or_set_it_with_path( '/Users/jenkins/.jenkins/jobs/DVAG-App/workspace' )
		
		@build_directory_path 			= @workspace + '/build/test_script'
		@reports_directory_path 		= @workspace + '/reports'
		@info_plist_path				= @workspace + '/DVAG/DVAG-Info.plist'

		@project_name 					= 'DVAG'
		@scheme 						= 'DVAG'
		@configuration 					= 'Release'

#		@bundle_identifier				= 'de.sp.test.neo2012'

		@source_directories 			= @workspace + '/DVAG ' + @workspace + '/DVAGModules'		# Separated by single space "@workspace + '/DIR01 ' + @workspace + '/DIR02'"

		@user_defined_arguments 		= 'DV_DISPLAY_NAME=DVAG-DEV'								# Separated by single space "VAR01=FOO VAR02=BAR"
		@preprocessor_macros 			= ''														# Separated by single space "FOO=1 BAR=2"

		@file_name						= @project_name
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
			puts "DVAGBuildCommit\t\t = #{build_commit}"
			`/usr/libexec/PlistBuddy -c 'Set :DVAGBuildCommit #{build_commit}' #{@workspace}/BuildMetadata.plist`

			# Date format must be like "Sun Dec 31 16:00:00 CET 2011"
			`export LANG=en_US.UTF-8`
			build_date = `date +'%a %b %d %H:%M:%S %Z %Y'`
			puts "DVAGBuildTime\t\t = #{build_date}"
			`/usr/libexec/PlistBuddy -c 'Set :DVAGBuildTime #{build_date}' #{@workspace}/BuildMetadata.plist`
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