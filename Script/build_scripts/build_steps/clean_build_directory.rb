#!/usr/bin/ruby


def clean_build_directory
	puts "\n\n🔵  Deleting build directory ..."
	puts "-----------------------------------"

	`rm -rv #{@build_directory_path}`
	
	puts "Build directory deleted: " + @build_directory_path
end