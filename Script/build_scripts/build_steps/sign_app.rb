#!/usr/bin/ruby


def sign_app
	puts "\n\n🔵  Signing app ..."
	puts "-----------------------------------"
	
	
	final_file_name = @file_name
	if @append_version_to_file_name
		final_file_name = @file_name + @version_prefix + @app_version + @version_suffix
	end
	puts "📄  Final file name: " + final_file_name + "\n\n"
	
	
	app_file = Dir.glob("#{@build_directory_path}/*.app").first
	
	# Create IPA
	system( "xcrun	-log \
					-sdk iphoneos \
					PackageApplication \
				 	#{app_file} \
					-o #{@build_directory_path}/#{final_file_name}.ipa " )
end
