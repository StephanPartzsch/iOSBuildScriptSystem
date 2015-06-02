#!/usr/bin/ruby

def test_app
	puts "\n\n🔵  Running tests ..."
	puts "-----------------------------------"
	
	# Run unit test
	system("xctool -project #{@workspace}/#{@project_name}.xcodeproj \
			-scheme #{@scheme} \
			-configuration Debug \
			-sdk iphonesimulator \
			-reporter pretty \
			-reporter junit:#{@workspace}/report/test-report.xml \
			test \
			-freshSimulator \
			-freshInstall")
end