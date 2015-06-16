#!/usr/bin/ruby


def distribute_app
	puts "\n\n🔵  Distributing app ..."
	puts "-----------------------------------"
	
	final_file_name = get_final_file_name
	dsym_file = Dir.glob("#{@build_directory_path}/*.dSYM").first
	
	# Zip dsym for distribution
	puts "Creates zipped dSYM file #{@build_directory_path}/#{final_file_name}.dSYM.zip" 
	`zip -r #{@build_directory_path}/#{final_file_name}.dSYM.zip #{dsym_file}`

	# Save artefacts
	`mkdir -p ~/Desktop/Trara`
	puts "Copies zipped dSYM file and ipa to ~/Desktop/Trara/" 
	`cp #{@build_directory_path}/#{final_file_name}.dSYM.zip ~/Desktop/Trara/`
	`cp #{@build_directory_path}/#{final_file_name}.ipa ~/Desktop/Trara/`
end