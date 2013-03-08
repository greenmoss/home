# Reminder:
# this script *should generate no output* or it will break the scp and rcp commands.

# colors for ls, etc.
#eval `dircolors -b /etc/DIR_COLORS`

# activate bash-completion, if we have it:
[ -f /etc/bash_completion ] && source /etc/bash_completion
if [ -d ~/.bash_completion.d/ ]; then
	for c in ~/.bash_completion.d/*; do
		. "$c"
	done
fi


__has_parent_dir () {
	# Utility function so we can test for things like .git/.hg without firing
	# up a separate process
	test -d "$1" && return 0;

	current="."
	while [ ! "$current" -ef "$current/.." ]; do 
		if [ -d "$current/$1" ]; then
			return 0;
		fi
		current="$current/..";
	done

	return 1;
}

__vcs_name() {
	if [ -d .svn ]; then 
		echo " svn"; 
	elif [ -d RCS ]; 	then 
		echo " RCS";  
	elif __has_parent_dir ".git"; then
		echo "$(__git_ps1 " g %s")";
	elif __has_parent_dir ".hg"; then
		echo " h $(hg branch)"
	fi
}

# prompt code
# handy docs: http://blog.sanctum.geek.nz/bash-prompts/

# colors
color_green='\[\e[0;32m\]'
color_maroon='\[\e[0;1;35m\]'
color_teal='\[\e[0;36m\]'
color_white='\[\e[0;37m\]'
color_yellow='\[\e[0;33m\]'

color_reset='\[\e[0m\]'

# variable color, depending on whether we are root, sudo'd as a user, or simply us
set_user_color() {
	# \[, \e, and \] would need extra escaping, so for clarity we return only the color code
	white_on_red='[0;41m'
	yellow_on_blue='[0;33;44m'
	color_reset='[0m'
	if [[ $EUID -eq 0 ]]; then
		echo $white_on_red
	elif [[ -n $SUDO_USER ]]; then
		echo $yellow_on_blue
	else
		printf $color_reset
	fi
}
user_color='\[\e$(set_user_color)\]'

# invisible/control components
set_terminal_title='\[\e]0;\h\007\]' # set terminal title to host name

# colored components
user_and_host=${color_yellow}'\u@\h' # user@host
date_and_time=${color_teal}'\D{%d %b %T}' # day month HH:MM:SS
working_dir=${color_maroon}'\w' # current working directory
repo=${color_green}'$(__vcs_name)' # vcs info, from $__vcs_name custom function
got_root=${user_color}'\$' # do we have root? $ or #

# gather the pieces together to set the bash prompt:
visible_prompt="
${user_and_host} ${date_and_time} ${working_dir}${repo}
${got_root}${color_reset} "
export PS1="${set_terminal_title}${visible_prompt}"

# end of bash prompt config

export TERM=xterm
export EDITOR=vim
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
export HISTIGNORE="&:ls:[bf]g:exit:[ \t]*"
HISTSIZE=500000
HISTFILESIZE=5000000
export BYOBU_NO_TITLE=1
# for my own python development, usually don't want bytecode file clutter
export PYTHONDONTWRITEBYTECODE=x

# ensure multi-line commands stay as a single history command
shopt -s cmdhist
# do not string together multi-line commands with semi-colons in history
shopt -s lithist
shopt -s histverify
# append bash history
shopt -s histappend
# expand aliases for non-login shell
shopt -s expand_aliases
# include dot-files in glob expansion
shopt -s dotglob
# vi mode
set -o vi

alias vi="vim"
alias sshn="ssh -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null"
alias scpn="scp -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null"
alias trunz="truncate -s 0"

# only pull things from previous history matching line typed so far
bind '"\e[A":history-search-backward'
# only pull things from following history matching line typed so far
bind '"\e[B":history-search-backward'

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
	# Homebrew executables
	export PATH=/usr/local/bin:/usr/local/sbin:$PATH
	# gnu coreutils
	export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
	export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

	alias ls='ls --color'
	command -v gfind >/dev/null && alias find=gfind
	alias s="sudo"

	VIRTUALENVWRAPPER_VIRTUALENV='/usr/local/share/python/virtualenv'
	VIRTUALENVWRAPPER='/usr/local/share/python/virtualenvwrapper.sh'
	if [ ! -f $VIRTUALENVWRAPPER_VIRTUALENV -o ! -f $VIRTUALENVWRAPPER ]; then
		unset VIRTUALENVWRAPPER_VIRTUALENV
		unset VIRTUALENVWRAPPER
	fi

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

# also use my own personal executables
PATH=$PATH:~/bin:~/.cabal/bin

alias lr='ls -lrt'

# virtualenvwrapper and virtualenv
if [ -n "$VIRTUALENVWRAPPER" -a -n "$VIRTUALENVWRAPPER_VIRTUALENV" ]; then
	export VIRTUALENVWRAPPER_VIRTUALENV
	export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
	source $VIRTUALENVWRAPPER
fi

# rbenv
if which rbenv > /dev/null 2>&1; then eval "$(rbenv init -)"; fi

# push/pop shortcuts
alias u='pushd'
alias o='popd'
alias d='dirs'
