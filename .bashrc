# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoreboth:erasedups

export HISTIGNORE="&:ls:[bf]g:exit:history:ps:netstat:htop:cd"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Extended Globbing options
shopt -s extglob

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

red="\033[1;31m";
norm="\033[0;39m";
cyan="\033[1;36m";
if [ "$PS1" ]; then
    if [[ $UID -eq 0 ]]; then
      PS1="\[$red\]\u@\h: \w\[\033[0;39m\]\n# "
    else
      PS1="\[$cyan\][\u@\h]: \w\[\033[0;39m\]\n> "
    fi
    #export PROMPT_COMMAND="echo -n \[\$(date +%H:%M:%S)\] "
    export PS1="$PS1"
fi

# Editor to vim
EDITOR=$(which vim)
export EDITOR

HISTTIMEFORMAT='%F %T '
HISTFILESIZE=-1
HISTSIZE=-1
HISTCONTROL=ignoredups
shopt -s histappend
shopt -s cmdhist
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$"\n"}history -a; history -a; history -c; history -r"
export GPG_TTY=`tty`
