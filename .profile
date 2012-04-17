. ~/.bashrc

if [ -z "$STY" ]; then
	BYOBU_NO_TITLE=1 byobu -q -x -R -t base
fi

# Setting PATH for Python 2.7
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

##
# Your previous /Users/kyoder/.profile file was backed up as /Users/kyoder/.profile.macports-saved_2011-10-28_at_23:33:14
##

# MacPorts Installer addition on 2011-10-28_at_23:33:14: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

