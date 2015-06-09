#!/usr/bin/ruby


def count_lines
	puts "\n\n🔵  Counting lines of code ..."
	puts "-----------------------------------"
	
	# Count lines of code and write file to process later
	puts "📄  Saves report to #{@reports_directory_path}/line-count.xml"
	system( "cloc	#{@source_directories} \
					--by-file \
					--skip-uniqueness \
					--xml \
					--out=#{@reports_directory_path}/line-count.xml" )
end