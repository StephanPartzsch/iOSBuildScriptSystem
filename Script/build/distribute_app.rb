#!/usr/bin/ruby

def distribute_app
	puts "\n\n🔵  Distributing app ..."
	puts "-----------------------------------"
	
	# Zip dsym for distribution
	puts "Creates zipped dSYM file #{@build_directory_path}/#{@file_name}.dSYM.zip" 
	`zip -r #{@build_directory_path}/#{@file_name}.dSYM.zip #{@build_directory_path}/#{@file_name}.app.dSYM`

	# Save artefacts
	`mkdir -p ~/Desktop/Trara`
	puts "Copies zipped dSYM file and ipa to ~/Desktop/Trara/" 
	`cp #{@build_directory_path}/#{@file_name}.dSYM.zip ~/Desktop/Trara/`
	`cp #{@build_directory_path}/#{@file_name}.ipa ~/Desktop/Trara/`
end