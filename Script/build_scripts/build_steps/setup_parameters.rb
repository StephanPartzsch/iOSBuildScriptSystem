#!/usr/bin/ruby


##
# Checks if the running system (bash/jenkins) defines variables and
# overrides according default values (defined in the build settings)
##

def setup_parameters
	puts "\n\n🔵  Build parameters and settings ..."
	puts "-----------------------------------"
	
	
	# Print current Xcode verion
	puts "🔹  Xcode version \t\t\t" + `xcodebuild -version`.gsub("\n", "  ")
	puts "🔹  Xcode path \t\t\t\t" + `xcode-select -print-path`
	puts "---\n\n"
	
	
	# Print build parameter
	puts "➔  Overwrite the following parameters (🔸 ) in Jenkins build job. Use the parameter name in [brackets]"
	puts "---"
	
	puts "🔹  Workspace \t\t\t\t" + @workspace

	build_directory_path = `echo "$BUILD_DIRECTORY_PATH"`.strip
	if !build_directory_path.empty?; @build_directory_path = build_directory_path end
	puts "🔸  [BUILD_DIRECTORY_PATH] \t\t" + @build_directory_path + ""
		
	reports_directory_path = `echo "$REPORTS_DIRECTORY_PATH"`.strip
	if !reports_directory_path.empty?; @reports_directory_path = reports_directory_path end
	puts "🔸  [REPORTS_DIRECTORY_PATH] \t\t" + @reports_directory_path

	info_plist_path = `echo "$INFO_PLIST_PATH"`.strip
	if !info_plist_path.empty?; @info_plist_path = info_plist_path end
	puts "🔸  [INFO_PLIST_PATH] \t\t\t" + @info_plist_path + ""
	
	puts ""
	
	project_name = `echo "$PROJECT_NAME"`.strip
	if !project_name.empty?; @project_name = project_name end
	puts "🔸  [PROJECT_NAME] \t\t\t" + @project_name + ""
	
	scheme = `echo "$SCHEME"`.strip
	if !scheme.empty?; @scheme = scheme end
	puts "🔸  [SCHEME] \t\t\t\t" + @scheme + ""
	
	configuration = `echo "$CONFIGURATION"`.strip
	if !configuration.empty?; @configuration = configuration end
	puts "🔸  [CONFIGURATION] \t\t\t" + @configuration + ""
	
	puts ""
	
	file_name = `echo "$FILE_NAME"`.strip
	if !file_name.empty?; @file_name = file_name end
	puts "🔸  [FILE_NAME] \t\t\t\t" + @file_name + ""
	
	append_version_to_file_name = `echo "$APPEND_VERSION_TO_FILE_NAME"`.strip
	if !append_version_to_file_name.empty?; @append_version_to_file_name = append_version_to_file_name end
	puts "🔸  [APPEND_VERSION_TO_FILE_NAME]\t" 	+ @append_version_to_file_name.to_s + ""
	
	if @append_version_to_file_name
		
		version_prefix = `echo "$VERSION_PREFIX"`.strip
		if !version_prefix.empty?; @version_prefix = version_prefix end
		puts "🔸  [VERSION_PREFIX] \t\t\t" + @version_prefix + ""
		
		puts "🔹  App version \t\t\t\t" + @app_version + ""
		
		version_suffix = `echo "$VERSION_SUFFIX"`.strip
		if !version_suffix.empty?; @version_suffix = version_suffix end
		puts "🔸  [VERSION_SUFFIX] \t\t\t" + @version_suffix + ""
	end
	
	puts ""

	if @bundle_identifier
		bundle_identifier = `echo "$BUNDLE_IDENTIFIER"`.strip
		if !bundle_identifier.empty?; @bundle_identifier = bundle_identifier end
		puts "🔸  [BUNDLE_IDENTIFIER] \t\t\t" + @bundle_identifier + ""
		puts ""
	end
	
	source_directories = `echo "$SOURCE_DIRECTORIES"`.strip
	if !source_directories.empty?; @source_directories = source_directories end
	puts "🔸  [SOURCE_DIRECTORIES] \t\t" + @source_directories + ""
	puts ""

	if @user_defined_arguments
		user_defined_arguments = `echo "$USER_DEFINED_ARGUMENTS"`.strip
		if !user_defined_arguments.empty?; @user_defined_arguments = user_defined_arguments end
		puts "🔸  [USER_DEFINED_ARGUMENTS] \t\t" + @user_defined_arguments + ""
	end
	
	if @preprocessor_macros
		preprocessor_macros = `echo "$PREPROCESSOR_MACROS"`.strip
		if !preprocessor_macros.empty?; @preprocessor_macros = preprocessor_macros end
		puts "🔸  [PREPROCESSOR_MACROS] \t\t" + @preprocessor_macros + ""
	end
end