#!/usr/bin/ruby


def build_app
	puts "\n\n🔵  Building app ..."
	puts "-----------------------------------"
	
	
	# Parse user-defined arguments
	user_defaults_string = ''
	@user_defined_arguments.split(" ").each do |argument|
		user_defaults_string += " -" + argument
	end
	

	# Build the app
	system( "xctool -project #{@workspace}/#{@project_name}.xcodeproj \
					-scheme #{@scheme} \
					-sdk iphoneos \
					-configuration #{@configuration} \
					#{user_defaults_string} \
					GCC_PREPROCESSOR_DEFINITIONS='#{@preprocessor_macros}' \
					CONFIGURATION_BUILD_DIR=#{@build_directory_path} \
					PRODUCT_NAME=#{@file_name} \
					clean \
					build ")
end