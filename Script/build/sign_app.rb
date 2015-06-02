#!/usr/bin/ruby

def sign_app
	puts "\n\n🔵  Signing app ..."
	puts "-----------------------------------"
	
	# Create IPA
	system( "xcrun	-sdk iphoneos \
					PackageApplication \
					#{@build_directory_path}/#{@app_name}.app \
					-o #{@build_directory_path}/#{@app_name}.ipa \
					-v" )
end