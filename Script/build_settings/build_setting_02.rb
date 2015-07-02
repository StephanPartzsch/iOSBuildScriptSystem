#!/usr/bin/ruby


##
# This file contains all default build parameters
# and defines overall build steps.
##

require_relative '../build_scripts/build_process.rb'



######################################
# SET THIS VALUE to group rake tasks #
######################################
job_name = 'setting_02'



namespace job_name do

	##
	# Define project specific settings
	##
	
	desc "Set the default parameters for Job: " + job_name
	task :set_default_parameters do
		@workspace									= get_workspace_or_set_with_path( '[PATH_TO_WHERE_THE_PROJECT_LIVES]' ) # Full qualified
		
		@build_directory_path 			= @workspace + '/build'
		@reports_directory_path 		= @workspace + '/reports'
		@info_plist_path						= @workspace + '/iOSBuildScriptSystemExample/Info.plist'

		@project_name 							= 'iOSBuildScriptSystemExample'
		@scheme 										= 'iOSBuildScriptSystemExample'
		@configuration 							= 'Debug'

		@bundle_identifier					= 'de.sp.test.bse'

		@source_directories 				= @workspace + '/iOSBuildScriptSystemExample' 			# Separated by single space " "

		@user_defined_arguments 		= 'BLA=1 DV_DISPLAY_NAME="iOS BSE"'						# Separated by single space " "
		@preprocessor_macros 				= 'COLOR_RED=1 OUTLINE=1'								# Separated by single space " "

		@file_name										= 'iOS_BSE'
		@append_version_to_file_name	= false
	end


	##
	# Define project specific tasks
	##
	
	desc "Build app for Job: " + job_name
	task :build do
		Rake::Task[job_name + ":set_default_parameters"].execute
		Rake::Task["build:ALL"].execute
	end

	desc "Run code metrics for Job: " + job_name
	task :analyze do
		Rake::Task[job_name + ":set_default_parameters"].execute
		Rake::Task["analyze:ALL"].execute
	end
end