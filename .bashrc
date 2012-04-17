# /etc/skel/.bashrc:
# This file is sourced by all *interactive* bash shells on startup.  This
# file *should generate no output* or it will break the scp and rcp commands.

# colors for ls, etc.
#eval `dircolors -b /etc/DIR_COLORS`
#alias d="ls --color"
#alias ls="ls --color=auto"
#alias ll="ls --color -l"

# Change the window title of X terminals 
# INCOMPATIBLE with merge_history.bash
#case $TERM in
#	xterm*|rxvt|Eterm|eterm)
#		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
#		;;
#	screen)
#		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
#		;;
#esac

# activate bash-completion, if we have it:
[ -f /etc/bash_completion ] && source /etc/bash_completion

export TERM=xterm
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export EDITOR="vim"
export LESS="-SRXx3#3"
#export PS1='\u@\h:\w\$ '
export PAGER=less
export LESS="-SRX"
export PS1='\[\033]0;\h\007\]\n\[\033[35m\]\[\033[33m\]\u@\h \[\033[36m\]\D{%d %b %T}\[\033[35m\] \[\033[0m\]\w\n\[\033[35m\]\[\033[0m\]\$ '
export HISTIGNORE="&:ls:[bf]g:exit:[ \t]*"
export HISTSIZE=500000
export HISTFILESIZE=5000000

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

# Solaris
if [ z`uname` = 'zSunOS' ]; then 
	alias s="pfexec"
	export PATH=/usr/sfw/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

	# override Solaris with Gentoo Prefix
	if [ -d /opt/gentoo/bin ]; then
		PATH=/opt/gentoo/bin:/opt/gentoo/usr/bin:/opt/gentoo/sbin:/opt/gentoo/usr/sbin:$PATH
		export MANPATH=/opt/gentoo/usr/share/man:/opt/gentoo/usr/share/binutils-data/x86_64-pc-solaris2.10/2.20.1/man:/opt/gentoo/usr/share/gcc-data/x86_64-pc-solaris2.10/4.2.4/man:/usr/share/man
		#export LESS="-R -M --shift 5"
		alias ls='ls --color'
	fi

# Linux
elif [ z`uname` = 'zLinux' ]; then 
	alias ls='ls --color'
	alias s="sudo"

	#export PATH="$PATH:/var/lib/gems/1.8/bin"
	# RHEL needs this; the default path is sparse
	export PATH="$PATH:/sbin:/usr/sbin"

# OS X
elif [ z`uname` = 'zDarwin' ]; then 
	alias ls='gls --color'
	alias find=gfind
	alias s="sudo"

	# Setting PATH for Python 2.7
	export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

	# adding MacPorts to PATH
	export PATH=/opt/local/bin:/opt/local/sbin:$PATH
fi
