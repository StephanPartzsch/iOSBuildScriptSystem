#!/usr/bin/ruby


##
# This file contains all standard build parameters
# and defines overall build steps.
##

require_relative '../build_scripts/build_process.rb'



#######################
# SET THIS VALUE
#######################
job_name = 'setting_02'



namespace job_name do

	##
	# Define project specific settings
	##
	
	desc "Set the default parameters for Job: " + job_name
	task :set_default_parameters do
		@workspace						= '/Users/jenkins/.jenkins/jobs/JenkinsTestJob/workspace'
		@build_directory_path 			= @workspace + '/build'
		@reports_directory_path 		= @workspace + '/reports'
		@info_plist_path				= @workspace + '/JenkinsTest/Info.plist'

		@project_name 					= 'JenkinsTest'
		@scheme 						= 'JenkinsTest'
		@configuration 					= 'Release'

		@bundle_identifier				= 'de.sp.test.222'

		@source_directories 			= @workspace + '/JenkinsTest' 			# Separated by single space " "

		@user_defined_arguments 		= 'DV_DISPLAY_NAME=DVAG-DEV BLA=test'	# Separated by single space " "
		@preprocessor_macros 			= 'COLOR_RED=1 OUTLINE=1'				# Separated by single space " "

		@file_name						= 'Hund'
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