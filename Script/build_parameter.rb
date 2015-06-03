#!/usr/bin/ruby

##
# This file contains all standard build parameters.
##



def get_app_version

app_version = `/usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' #{@info_plist_path}`.strip
return app_version

end



@workspace					= '/Users/jenkins/.jenkins/jobs/JenkinsTestJob/workspace'
@build_directory_path 		= @workspace + '/build'
@reports_directory_path 	= @workspace + '/reports'
@info_plist_path			= @workspace + '/JenkinsTest/Info.plist'

@project_name 				= 'JenkinsTest'
@scheme 					= 'JenkinsTest'
@configuration 				= 'Release'

@file_name_base				= @project_name
@file_name_suffix			= '-V'
@app_version				= get_app_version
@file_name 					= @file_name_base + @file_name_suffix + @app_version

@bundle_identifier			= 'de.sp.test.neo2015'

@source_directories 		= 'JenkinsTest' 						# Separated by single space " "

@user_defined_arguments 	= 'DV_DISPLAY_NAME=DVAG-DEV BLA=test'	# Separated by single space " "
@preprocessor_macros 		= 'COLOR_RED=1 OUTLINE=1'				# Separated by single space " "