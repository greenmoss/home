# bashrc confusion
# http://mywiki.wooledge.org/DotFiles
# so I'm going to cheese out here:
source ~/.bashrc

# create/reattach byobu or screen
if [ -z "$STY" ]; then
	
	# do we have byobu?
	have_byobu=0
	hash byobu >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		have_byobu=1
	fi
	
	# do we have screen?
	have_screen=0
	hash screen >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		have_screen=1
	fi

	# prefer byobu
	if [ $have_byobu = 1 ]; then 
		# specifying title hangs screen on Ubuntu Precise
		# So disabling until this bug is fixed
		# https://bugs.launchpad.net/byobu/+bug/1031925
		_byobu_sourced=1 byobu -q -x -R #-t base

	# otherwise, screen
	elif [ $have_screen = 1 ]; then 
		TERM=xterm screen -q -x -R -t base -c ~/.screenrc.no_byobu

	fi

	# nothing left, give up
fi
