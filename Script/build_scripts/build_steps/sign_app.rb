#!/usr/bin/ruby


def sign_app
	puts "\n\n🔵  Signing app ..."
	puts "-----------------------------------"
	
	final_file_name = get_final_file_name
	app_file = Dir.glob("#{@build_directory_path}/*.app").first
	
	# Create IPA
	system( "xcrun	-log \
					-sdk iphoneos \
					PackageApplication \
				 	#{app_file} \
					-o #{@build_directory_path}/#{final_file_name}.ipa " )
end
