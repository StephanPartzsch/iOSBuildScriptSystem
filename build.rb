#!/usr/bin/ruby


unless defined? PROJECT_NAME
	PROJECT_NAME = 'HUND'
end

print PROJECT_NAME

print ' ---------------- '

exec 'echo "~Parameter: ${JOB_NAME}"'
