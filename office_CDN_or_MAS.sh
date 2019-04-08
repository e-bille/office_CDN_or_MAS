#!/usr/bin/env bash

# If things break, we stop
set -euo pipefail

# Are the apps even installed?
if [[ $(ls /Applications/Microsoft*) ]]; then
	# Seems like they are. What apps are installed then?
	app=`ls /Applications | grep "Microsoft [EOPRW]\w*" | cut -d ' ' -f 1-2 | head -n 1`

	# Cool, check if first one found is installed via CDN or MAS
	# and let's assume the user installed them from the one place and didn't mix sources
	if [[ -d /Applications/$app/Contents/_MASReceipt ]]; then
		echo "<result>MAS</result>"
	else
		echo "<result>CDN</result>"
	fi
else
	echo "<result>NotInstalled</result>"

fi
