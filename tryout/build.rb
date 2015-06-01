#!/usr/bin/ruby

project_name = `echo "$PROJECT_NAME"`.strip
if project_name.empty?; project_name = 'HUND' end


puts ' ---------------- '

puts project_name.length
puts project_name

puts ' ---------------- '
