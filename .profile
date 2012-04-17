. ~/.bashrc

if [ z`uname` = 'Darwin' ]; then
	if [ -z "$STY" ]; then
		BYOBU_NO_TITLE=1 byobu -q -x -R -t base
	fi

	# Setting PATH for Python 2.7
	PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
	export PATH

	# adding an appropriate PATH variable for use with MacPorts.
	export PATH=/opt/local/bin:/opt/local/sbin:$PATH
	# Finished adapting your PATH environment variable for use with MacPorts.
fi
