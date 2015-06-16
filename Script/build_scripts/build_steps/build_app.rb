#!/usr/bin/ruby


def build_app
	puts "\n\n🔵  Building app ..."
	puts "-----------------------------------"
	
	# Build the app
	system( "xctool -project #{@workspace}/#{@project_name}.xcodeproj \
					-scheme #{@scheme} \
					-sdk iphoneos \
					-configuration #{@configuration} \
					#{@user_defined_arguments} \
					GCC_PREPROCESSOR_DEFINITIONS='#{@preprocessor_macros}' \
					CONFIGURATION_BUILD_DIR=#{@build_directory_path} \
					clean \
					build ")
end