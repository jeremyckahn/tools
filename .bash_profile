export PATH=$HOME/local/node/bin:$PATH
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

syncandpushpages () {
  git checkout gh-pages
  git merge master
  git push origin gh-pages
}

new_project () {
  mkdir src/;
  mkdir lib/;
  touch README.md;
  echo -e ".swp\n.DS_Store" > .gitignore;
  git init;
  git add src/ lib/ .gitignore README.md;
  git commit -am "Initial commit.";
  git status;
}

resource () {
  source ~/.bash_profile
}
