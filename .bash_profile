export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

export ANDROID_HOME=/usr/local/opt/android-sdk
export HISTCONTROL=ignorespace

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home

PATH=$PATH:$HOME/bin

export PATH=$PATH:/usr/local/opt/go/libexec/bin

export GEM_HOME=~/.calabash
export GEM_PATH=~/.calabash
export PATH="$PATH:$HOME/.calabash/bin"

GITPS1="\$(__git_ps1 \"(%s)\")"
PS1="${GITPS1}\n[\t][\u@\h:\W] \$ "

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

alias adbres="adb kill-server && adb start-server"

alias la="ls -al"
alias ll="ls -l"
alias up="cd .."

alias adbtype="adb shell input text"

alias java7="/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home/bin/java"
alias java8="/Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk/Contents/Home/bin/java"

alias antinst="ant debug && ant installd"

alias cbs="cat /dev/null > ~/.bash_history && history -c"

alias gdev="git checkout develop"
alias gpush="git push"
alias gpull="git pull"
alias gupdate="git pull origin develop"
alias gcm="git commit -m"
alias gstat="git status"
alias gprune="git remote prune origin"
alias gffs="git flow feature start"
alias gpod="git push origin develop"
alias gpom="git push origin master"

alias reload="source ~/.bash_profile"

alias buildscreen="ssh -X tfg@10.0.10.159"

alias rmdss="find . -name '*.DS_Store' -type f -delete"

# shrinkall: $1=ext; Attempt convert all files in directory to 50% of size
function shrinkall() {
  OLDIFS=$IFS
  IFS=$'\n'
  local extension="*.$1"
  local dirname=$PWD
  local files=$(find ${dirname} -name "${extension}" -type f)

  for f in $files; do
    local filename=$(basename ${f})
    echo "Processing ${f}..."
    convert "${f}" -resize 50% "${dirname}/small-${filename}"
  done
  IFS=$OLDIFS
}

function generate_fb_keyhash() {
  if [[ "$1" == "" ]]; then
    key_alias="androiddebugkey"
  else
    key_alias=$1
  fi
  keytool -exportcert -alias $key_alias | openssl sha1 -binary | openssl enc -a -e
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
