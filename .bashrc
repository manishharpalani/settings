#  .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
alias a_reload='source /sts/eng/home/manish/.bashrc'

# ulimit -Su 2048

# http://tldp.org/HOWTO/Bash-Prompt-HOWTO/xterm-title-bar-manipulations.html
# http://tldp.org/HOWTO/Bash-Prompt-HOWTO/c141.html
TITLEBAR='\[\033]0;\u@\h\007\]'

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /'
}

# set the prompt\033
export PS1='\n\033[36m[\[\d \t] \033]0;\h - \W\007\033[35m\]\u\033[34m@\033[31m\h \[\033[32m$(parse_git_branch)\033[33m\w\033[0m\]\012$ '

#mongod --config /usr/local/etc/mongod.conf &

set export EDITOR=vim
CSCOPE_EDITOR='vim';export CSCOPE_EDITOR

#
# Generate ctags and cscope database
#
function a_gentags ()
{
    echo "Generating tags..."
    ctags -R --sort=yes --links=no --totals=yes --c++-kinds=+p --fields=+iaS --extra=+q --exclude=*.js .
    find . -type f -name "*.py" -o -name "*.php" -o -name "*.[ch]" -o -name "*.[ch]pp" -o -name "*.java"  -o -name "*.conf" > cscope.files
    cscope -bq
}
alias cs="cscope -d -p3"

export -f a_gentags

set -o vi

# Make Bash append rather than overwrite the history on disk:
shopt -s histappend
# Whenever displaying the prompt, write the previous line to disk
PROMPT_COMMAND='history -a'

. ~/alias_mvn
. ~/alias_git
. ~/alias_etc
. ~/alias_bld

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

