# Aliases
alias ll='ls -halG'
alias l='ls'
alias ls='ls -G'
alias grep='grep --color=auto'

# Networking
alias myip='curl ifconfig.co'
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

# Git commamands simplified
alias gst='git status'
alias gco='git checkout'
alias gci='git commit'
alias grb='git rebase'
alias gbr='git branch'
alias gad='git add -A'
alias gpl='git pull'
alias gpu='git push'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

# Git branch
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Git completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Setup PROXY for work env
PROXY_IP="10.47.2.10:8080"

function setup_proxy() {
  enable=$1
  if [ $enable == "true" ];
  then
    export {http,https,ftp}_proxy=http://${PROXY_IP}
  else
    unset {http,https,ftp}_proxy
  fi
}

function enable_wifi() {
  networksetup -setairportnetwork en0 0000-2 eith/e7AeheiG7die5
}

parse_git_branch

# pyenv
eval "$(pyenv init -)"

# Other settings
export EDITOR=/usr/local/bin/vim

# Customize Terminal style
PS1='
$PWD
==>$(parse_git_branch) '
# PATH
export PATH="/usr/local/sbin:$PATH"
# For crystal: https://github.com/crystal-lang/crystal/issues/4745
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig
# Go env
export GOPATH=$HOME/work/platforms/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# vscode
# Export locale for click lib under pipenv
# Add "python.venvPath": "/Users/mariuss/.local/share/virtualenvs" to vscode User settings
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8

