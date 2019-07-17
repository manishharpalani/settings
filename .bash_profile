#  .bash_profile

# http://tldp.org/HOWTO/Bash-Prompt-HOWTO/xterm-title-bar-manipulations.html
TITLEBAR='\[\033]0;\u@\h\007\]'

# http://qugstart.com/blog/git-and-svn/add-colored-git-branch-name-to-your-shell-prompt/
function parse_git_branch_and_add_brackets {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}
PS1prompt="\[\033[0;32m\]\u\$(parse_git_branch_and_add_brackets) \h:\W \[\033[0m\]\$ "

# iTerm Tab and Title Customization and prompt customization
#PS1="\[\e]0;atom:\w\a\]$PS1prompt"

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /'
}
export PS1='\n\033[36m[\[\d \t] \033]0;\h - \W\007\033[35m\]\u\033[34m@\033[31m\h \[\033[32m$(parse_git_branch)\033[33m\w\033[0m\]\012$ '

# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

export PATH=~/mongodb-osx-x86_64-3.2.7/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=~/android-sdk-macosx
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

function ascreen()
{
  ssh "$1" -t screen -D -R -S "$2"
}

function fscr() { ssh "$1" -t screen -D -R -S "$2" ;} 

set -o vi
export PATH="/usr/local/sbin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/manishharpalani/.sdkman"
[[ -s "/Users/manishharpalani/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/manishharpalani/.sdkman/bin/sdkman-init.sh"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

eval "$(pyenv init -)"

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
