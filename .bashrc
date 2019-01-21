PATH=$PATH:~/scripts:/usr/local/bin/:/Users/gmorgan/Library/Python/2.7/bin/
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home


#Text Applications
alias tw='open -a /Applications/TextWrangler.app'
alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

alias q='exit'
alias c='clear'
alias h='history'

# DIRECTORY LISTING
alias cs='clear;lsl'
alias ll='ls -al'
alias lsa='ls -a'
alias lsl='ls -l'

alias pd='pwd'
alias t='time'

alias x='chmod +x'
alias null='/dev/null'
alias loadbash='source ~/.bashrc'
alias o=open

#FILE SYSTEM SHORTCUTS
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias home='cd ~'
alias root='cd /'
alias dtop='cd ~/Desktop'
alias down='cd ~/Downloads'
alias devops='cd ~/projects/github/devops'
alias prj='cd ~/projects'

alias ip='ipconfig getifaddr en0'
alias eip='curl -s http://checkip.dyndns.org/ | grep -o '[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*.[0-9]*''
alias ieip='echo "Internal: "; ip; echo "External:"; eip'

alias findn='find . -name '"${1}"''

#DEVELOPER ALIAS
alias g='git'
alias mk='minikube'
alias k='kubectl'

# DOCKER ALIAS
alias dockersa='docker stop $(docker ps -q)'
alias dockertl='docker container logs -f'

source ~/.git-prompt.sh 

#
# Prompt Twiddling
#
function prompt_left() {
  #echo -e "\033[0;34;40m\u\033[0;33;40m@$HOSTCOLOR\h\033[0;33;40m:\033[0;35;40m$PWD\033[0m"
  #echo -e "\u@\h:\W"
  echo -e "$USER@`hostname -s`:${PWD##*/} $(__git_ps1)"
}

function prompt_right() {
  #echo -e "$HOSTCOLOR\\\t\033[0m"
  echo -e "`date "+%H:%M:%S"`"
}

function prompt() {
    echo -ne "\033]0;"$TITLE"\007"
    compensate=0
    #PS1=$(printf "\n%*s\r%s\n>" "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
    PS1=$(printf "%s%$(($COLUMNS-${#PS1L}))s" "$PS1L" "$PS1R")

    printf "%s%$(($COLUMNS-${#PS1L}))s" "$PS1L" "$PS1R"
}

function print_pre_prompt ()
{
    PS1L=$(printf "%s" "$(prompt_left)")
    if [[ $PS1L/ = "$HOME"/* ]]; then PS1L=\~${PS1L#$HOME}; fi
    PS1R=$(printf "%s" "$(prompt_right)")
    PS1=$(printf "\n%s%$(($COLUMNS-${#PS1L}-3))s\n> " "$PS1L" "$PS1R")
}

export PROMPT_COMMAND="print_pre_prompt"


function hs() {
	history | grep -i $*
}

function k8 () {
	echo "kubectl -n $USER $*"
	kubectl -n $USER $*
}

