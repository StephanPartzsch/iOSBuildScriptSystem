#!/usr/bin/ruby


def set_plist_values
	if !@bundle_identifier; return end
	
	puts "\n\n🔵  Setting info-plist values ..."
	puts "-----------------------------------"
	
	# Set bundle identifier
	`/usr/libexec/PlistBuddy -c 'Set :CFBundleIdentifier #{@bundle_identifier}' #{@info_plist_path}`
	puts "CFBundleIdentifier\t = #{@bundle_identifier}"

end

