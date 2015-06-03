#!/usr/bin/ruby

##
# This file contains all standard build parameters.
##


@workspace					= '/Users/jenkins/.jenkins/jobs/JenkinsTestJob/workspace'
@build_directory_path 		= @workspace + '/build'
@reports_directory_path 	= @workspace + '/reports'

@project_name 				= 'JenkinsTest'
@scheme 					= 'JenkinsTest'
@configuration 				= 'Release'

@app_name 					= 'JenkinsTest77'

@source_directories 		= 'JenkinsTest' 						# Separated by single space " "

@user_defined_arguments 	= 'DV_DISPLAY_NAME=DVAG-DEV BLA=test'	# Separated by single space " "
@preprocessor_macros 		= 'COLOR_RED=1 OUTLINE=1'				# Separated by single space " "