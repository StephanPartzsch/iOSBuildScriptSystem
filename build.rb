#!/usr/bin/ruby

PROJECT_NAME2 = `echo ${PROJECT_NAME}`

unless defined? PROJECT_NAME
	PROJECT_NAME = 'HUND'
end


print ' ---------------- '

print PROJECT_NAME

print ' ---------------- '


exec 'echo "~Parameter: ${JOB_NAME}"'
