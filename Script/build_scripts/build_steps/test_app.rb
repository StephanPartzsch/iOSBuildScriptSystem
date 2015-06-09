#!/usr/bin/ruby


def test_app
	puts "\n\n🔵  Running tests ..."
	puts "-----------------------------------"
	
	# Run unit test
	puts "📄  Saves report to #{@reports_directory_path}/test-report.xml"
	system( "xctool -project #{@workspace}/#{@project_name}.xcodeproj \
					-scheme #{@scheme} \
					-configuration Debug \
					-sdk iphonesimulator \
					-reporter pretty \
					-reporter junit:#{@reports_directory_path}/test-report.xml \
					clean\
					test \
					-freshSimulator \
					-freshInstall" )
end