alias s=sudo

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

if [ z`uname` = 'zSunOS' ]; then 
	alias s="pfexec"
	PATH=/usr/sfw/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

	# override Solaris with Gentoo Prefix
	if [ -d /opt/gentoo/bin ]; then
		PATH=/opt/gentoo/bin:/opt/gentoo/usr/bin:/opt/gentoo/sbin:/opt/gentoo/usr/sbin:$PATH
		export MANPATH=/opt/gentoo/usr/share/man:/opt/gentoo/usr/share/binutils-data/x86_64-pc-solaris2.10/2.20.1/man:/opt/gentoo/usr/share/gcc-data/x86_64-pc-solaris2.10/4.2.4/man:/usr/share/man
		#export LESS="-R -M --shift 5"
		alias ls='ls --color'
	fi

elif [ z`uname` = 'zLinux' ]; then 
	#export PATH="$PATH:/var/lib/gems/1.8/bin"
	export PATH="$PATH:/sbin:/usr/sbin"
	alias ls='ls --color'
	alias s="sudo"

elif [ z`uname` = 'zDarwin' ]; then 
	alias ls='gls --color'
	alias find=gfind
	alias s="sudo"
fi
