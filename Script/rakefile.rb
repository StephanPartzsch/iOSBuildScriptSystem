#!/usr/bin/ruby

Rake::TaskManager.record_task_metadata = true



# Imports all ruby files in build_settings
Dir.glob('**/build_settings/*.rb').each { |r| require_relative r}



# Defines which rake tasks should show up when called via default rake task 
task :default do
	Rake::application.options.show_tasks = :tasks
	Rake::application.options.show_task_pattern = /^((?!build:)(?!analyze:).)*$/
	Rake::application.display_tasks_and_comments
end







###
# Show all rake tasks on command line
##
# rake -T
###

###
# Call multiple rake tasks on command line
##
# rake job01:set_default_parameters build:build
###