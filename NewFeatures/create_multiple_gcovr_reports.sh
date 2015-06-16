#!/bin/bash

#cd ~/Desktop/Jenkins_Build/Build/Build/Intermediates

count=1

for mainPath in ~/Desktop/Jenkins_Build/Build/Build/Intermediates/*; do
	for subPath in ${mainPath}/Debug-iphonesimulator/*; do
		
		[[ -d "$subPath" && ("$subPath" =~ "Bundle" || "$subPath" =~ "Test")]]	&& continue

		if [ ! -d "${subPath}/Objects-normal/i386" ]; then
			continue
		fi

		echo "$count. Build path: ${subPath}"
		cd "${subPath}/Objects-normal/i386"
		
		count=$((count+1))
		
		mkdir -p ~/Desktop/test-reports/
		gcovr --object-directory . --exclude '.*Tests.*' --xml > ~/Desktop/test-reports/code-coverage$count.xml
	
	done
		
	echo "----------------------"
	echo ""
done