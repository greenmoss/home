# Reminder:
# this script is for bash interactive/login shell sessions only
# everything from ~/.bashrc is automatically included

# activate bash-completion, if we have it:
[ -f /etc/bash_completion ] && source /etc/bash_completion

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
		_byobu_sourced=1 BYOBU_NO_TITLE=1 byobu -q -x -R -t base

	# otherwise, screen
	elif [ $have_screen = 1 ]; then 
		TERM=xterm screen -q -x -R -t base

	fi

	# nothing left, give up
fi
