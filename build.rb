#!/usr/bin/ruby

project_name = `echo "$PROJECT_NAME"`
project_name = project_name.strip

if project_name.empty?
	project_name = 'HUND'
end


puts ' ---------------- '

puts project_name.length
puts project_name

puts ' ---------------- '
