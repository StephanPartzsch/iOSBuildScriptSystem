#!/usr/bin/ruby

def build_app
	puts "\n\n🔵  Building app ..."
	puts "-----------------------------------"
		
	# Build the app
	system( "xctool -project #{@workspace}/#{@project_name}.xcodeproj \
					-scheme #{@scheme} \
					-sdk iphoneos \
					-configuration #{@workspace}/#{@configuration} \
					CONFIGURATION_BUILD_DIR=#{@build_directory} \
					PRODUCT_NAME=#{@app_name} \
					clean \
					build" )
end