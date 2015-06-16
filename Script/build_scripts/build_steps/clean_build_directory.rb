#!/usr/bin/ruby


def clean_build_directory
	puts "\n\n🔵  Deleting build directory ..."
	puts "-----------------------------------"

	`rm -rv #{@build_directory_path}`
	was_directory_deleted=$?.success?
		
	if(was_directory_deleted)
		puts "Build directory deleted: " + @build_directory_path
	end
end