#!/usr/bin/ruby



##
# Helper methods
##


def get_app_version
	app_version = `/usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' #{@info_plist_path}`.strip
	return app_version
end


def get_workspace_or_set_with_path(workspace_path)
	workspace = `echo "$WORKSPACE"`.strip
	if workspace.empty?; workspace = workspace_path end
	return workspace
end


def get_final_file_name
	final_file_name = @file_name
	
	if @append_version_to_file_name
		final_file_name += @version_prefix + @app_version + @version_suffix
	end
	
	puts "📄  Final file name: " + final_file_name + "\n\n"
	return final_file_name
end