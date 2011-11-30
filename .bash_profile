export PATH=$HOME/node/out/Release/:$PATH
alias ll="ls -lah"
alias closure='java -jar ~/Tools/compiler-latest/compiler.jar'
alias svnaddall='sh ~/Tools/svnaddall.sh'
alias gofast='sudo sh ~/Tools/gofast.sh'
alias goslow='sudo sh ~/Tools/goslow.sh'
alias noblanklines='grep -v "^[[:space:]]*$"'
alias delds='sudo find . -name ".DS_Store" -depth -exec rm {} \;'
alias cleanme='sh ~/Tools/cleanme.sh'
alias pullall='git pull origin master;git pull origin dev;git pull origin gh-pages'
alias cop='pbcopy&&pbpaste'
alias gs='git status'
alias gd='git diff'
alias gpm='git push origin master'
alias gb='git branch -a'
alias gl='git log'
alias gc='git checkout'
alias v='vim'
alias s='cd ~/Sites'
alias t='cd ~/tools'


# Push the current directory
pushit () {
  git push origin `git branch | grep \* | sed 's/\* //'`
}

# Pull the current directory
pullit () {
  git pull origin `git branch | grep \* | sed 's/\* //'`
}

# For all files in the current directory, convert tabs to 2 spaces.
tabs_to_spaces_all () {
  for FILE in ./*; do expand -t 2 $FILE > /tmp/spaces && mv /tmp/spaces $FILE ; done;
}

kill_swps () {
  find ./ -name "*.swp" -exec echo "Deleting: " {} \; -exec rm {} \;
  find ./ -name "*.swo" -exec echo "Deleting: " {} \; -exec rm {} \;
}

syncandpushpages () {
  git checkout gh-pages
  git merge master
  git push origin gh-pages
}

new_project () {
  mkdir src/;
  mkdir lib/;
  touch README.md;
  echo -e "*.swp\n.DS_Store" > .gitignore;
  git init;
  git add src/ lib/ .gitignore README.md;
  git commit -am "Initial commit.";
  git status;
}

resource () {
  source ~/.bash_profile
  source ~/.bashrc
}
