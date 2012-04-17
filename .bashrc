alias s=sudo
alias ls='gls --color'
alias find=gfind

export TERM=xterm
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export EDITOR="vim"
export LESS="-SRXx3#3"
#export PS1='\u@\h:\w\$ '
export PS1='\[\033]0;\h\007\]\n\[\033[35m\]\[\033[33m\]\u@\h \[\033[36m\]\D{%d %b %T}\[\033[35m\] \[\033[0m\]\w\n\[\033[35m\]\[\033[0m\]\$ '

#eval `dircolors ~/.dir_colors`
export HISTIGNORE="&:ls:[bf]g:exit:[ \t]*"
export HISTSIZE=500000
export HISTFILESIZE=5000000
shopt -s cmdhist
shopt -s lithist
shopt -s histverify
#source "$HOME"/merge_history.bash
