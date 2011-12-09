# http://www.ibm.com/developerworks/linux/library/l-tip-prompt/
# Modified a bit.  Also: http://beckism.com/2009/02/better_bash_prompt/
#export PS1="\[\e[36;1m\][\u]\[\e[32;1m\][\W]: \[\e[0m\]"
export PATH=$HOME/node/out/Release/:$PATH

alias ll="ls -lah"
alias gs='git status'
alias gd='git diff'
alias gb='git branch -a'
alias gl='git log'
alias gc='git checkout'
alias v='vim'
alias s='cd ~/Sites'
alias o='open ./'
alias t='cd ~/tools'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

source ~/tools/misc/git-completion.bash

# Outputs a version of a file that has no blank lines.
#   noblanklines [filename]
alias noblanklines='grep -v "^[[:space:]]*$"'


# Push the current directory
function pushit () {
  git push origin `git branch | grep \* | sed 's/\* //'`
}

# Pull the current directory
function pullit () {
  git pull origin `git branch | grep \* | sed 's/\* //'`
}

function svnaddall () {
  svn status | grep -v "^.[ \t]*\..*" | grep "^?" | awk '{print $2}' | xargs svn add
}

# makes the connection to jkahn.local:8888 really slow.
function goslow () {
  ipfw pipe 1 config bw 4KByte/s
  ipfw add pipe 1 tcp from any to me 8888
}

# makes the connection to jkahn.local:8888 fast again
function gofast () {
  ipfw flush
}

# For all files in the current directory, convert tabs to 2 spaces.
function tabs_to_spaces_all () {
  for FILE in ./*; do expand -t 2 $FILE > /tmp/spaces && mv /tmp/spaces $FILE ; done;
}

function kill_vim_junk () {
  find ./ -name "*.swp" -exec echo "Deleting: " {} \; -exec rm {} \;
  find ./ -name "*.swo" -exec echo "Deleting: " {} \; -exec rm {} \;
  find ./ -name ".netrwhist" -exec echo "Deleting: " {} \; -exec rm {} \;
}

function clean_dir () {
  echo "Are you really really sure?  The current directory is: "
  pwd
  read -e INPUT

  # This is ugly.  Why is this ugly.
  if [[ $INPUT == "y" || $INPUT == "Y" || $INPUT  == "yes" ]]; then
    echo "Removing .svn, .DS_, and ._* files... "
    find . -iname ".svn*" | xargs rm -Rv
    find . -iname ".DS_*" | xargs rm -Rv
    find . -iname "._*" | xargs rm -Rv
    echo "All done!"
  else
    echo "Cleaning of the directory was canceled."
  fi
}

function new_project () {
  mkdir src/;
  mkdir lib/;
  touch README.md;
  echo -e "*.swp\n.DS_Store" > .gitignore;
  git init;
  git add src/ lib/ .gitignore README.md;
  git commit -am "Initial commit.";
  git status;
}

function resource () {
  source ~/.bash_profile
  source ~/.bashrc
}

#Some craziness...
# Colors for the command prompt
__BLUE="\[\033[0;34m\]"
__GREEN="\[\033[0;32m\]"
__LIGHT_BLUE="\[\033[1;34m\]"
__LIGHT_GRAY="\[\033[0;37m\]"
__LIGHT_GREEN="\[\033[1;32m\]"
__LIGHT_RED="\[\033[1;31m\]"
__PLAIN="\[\033[0;0m\]"
__RED="\[\033[0;31m\]"
__WHITE="\[\033[1;37m\]"

# Return a color that should be used for the git branch
# depending on the current git status
function __git_prompt_color() {
  local STATUS="$(git status --porcelain 2>/dev/null)"
  if [ -n "$STATUS" ]; then
    echo $__LIGHT_RED
  else
    echo $__LIGHT_GREEN
  fi
}

# Build a custom command prompt
function __prompt_cmd() {
  PS1="$__LIGHT_GRAY[\h]$__LIGHT_BLUE[\W]$(__git_prompt_color)$(__git_ps1 "[%s]")$__PLAIN $ "
}

export PROMPT_COMMAND=__prompt_cmd

# Setup some of the git command prompt display stuff
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILE=1
export GIT_PS1_SHOWUPSTREAM="auto"
