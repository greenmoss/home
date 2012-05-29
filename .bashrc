# Reminder:
# this script *should generate no output* or it will break the scp and rcp commands.

# colors for ls, etc.
#eval `dircolors -b /etc/DIR_COLORS`

export TERM=xterm
export EDITOR="vim"
export VISUAL=$EDITOR
# #3 scroll rightwards: 3 chars
# i ignore case
# F quit if one screen
# M long prompt
# R raw control chars
# S chop long lines
# x3 tab stops: 3
# X no termcap init
export LESS="-#3iFMRSx3X"
export PAGER=less
export PS1='\[\033]0;\h\007\]\n\[\033[35m\]\[\033[33m\]\u@\h \[\033[36m\]\D{%d %b %T}\[\033[35m\] \[\033[0m\]\w\n\[\033[35m\]\[\033[0m\]\$ '
export HISTIGNORE="&:ls:[bf]g:exit:[ \t]*"
HISTSIZE=500000
HISTFILESIZE=5000000
export BYOBU_NO_TITLE=1

# ensure multi-line commands stay as a single history command
shopt -s cmdhist
# do not string together multi-line commands with semi-colons in history
shopt -s lithist
shopt -s histverify
# append bash history
shopt -s histappend
# expand aliases for non-login shell
shopt -s expand_aliases

alias vi="vim"
alias sshn="ssh -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null"
alias scpn="scp -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null"

# Linux
if [ z`uname` = 'zLinux' ]; then 
	alias ls='ls --color'
	alias s="sudo"

	# Debian/Ubuntu
	if [ -f /etc/debian_version ]; then
		# http://www.debian.org/doc/manuals/maint-guide/modify.en.html
		alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"

	# RHELish
	elif [ -f /etc/redhat-release ]; then
		# the default path is sparse; 5.* only?
		export PATH="$PATH:/sbin:/usr/sbin"
	fi

# OS X
elif [ z`uname` = 'zDarwin' ]; then 
	# assume macports
	alias ls='gls --color'
	alias find=gfind
	alias s="sudo"

	# Setting PATH for Python 2.7
	export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

	# adding MacPorts to PATH
	export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Solaris
elif [ z`uname` = 'zSunOS' ]; then 
	alias s="pfexec"
	export PATH=/usr/sfw/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

	# override Solaris with Gentoo Prefix
	if [ -d /opt/gentoo/bin ]; then
		export PATH=/opt/gentoo/bin:/opt/gentoo/usr/bin:/opt/gentoo/sbin:/opt/gentoo/usr/sbin:$PATH
		export MANPATH=/opt/gentoo/usr/share/man:/opt/gentoo/usr/share/binutils-data/x86_64-pc-solaris2.10/2.20.1/man:/opt/gentoo/usr/share/gcc-data/x86_64-pc-solaris2.10/4.2.4/man:/usr/share/man
		alias ls='ls --color'
	fi
fi

alias lr='ls -lrt'
