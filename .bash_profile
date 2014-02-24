export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

export ANDROID_HOME=/usr/local/opt/android-sdk

export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home

export JDK_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home

PATH=$PATH:$HOME/bin

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

alias antinst="ant debug && ant installd"

function generate_fb_keyhash() {
  if [[ "$1" == "" ]]; then
    key_alias="androiddebugkey"
  else
    key_alias=$1
  fi
  keytool -exportcert -alias $key_alias | openssl sha1 -binary | openssl enc -a -e
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
