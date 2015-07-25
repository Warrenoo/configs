# Path to your oh-my-zsh installation.

export ZSH=$HOME/.oh-my-zsh
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:/usr/local/sbin
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
alias vim='/usr/local/bin/vim'
#export PATH="$PATH:$HOME/Library/Redis/src"
eval "$(rbenv init -)"

alias @ps="python -m SimpleHTTPServer"
alias @tail="tail -n 50 -f"

alias @vpn="open ~/Library/Mobile\ Documents/com\~apple\~ScriptEditor2/Documents/VPN-RELOAD.app"
alias @rvpn="vpn-disconnect & ps -ef | grep VPN-RELOAD | grep -v grep | cut -c 7-15 | xargs kill -9"

export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/warrenoo/.boot2docker/certs/boot2docker-vm

# toggle iTerm Dock icon
# add this to your .bash_profile or .zshrc
function toggleitem() {
	pb='/usr/libexec/PlistBuddy'
	iTerm='/Applications/iTerm.app/Contents/Info.plist'
	
	echo "Do you wish to hide iTerm in Dock?"
	select ync in "Hide" "Show" "Cancel"; do
	    case $ync in
	        'Hide' )
	        	$pb -c "Add :LSUIElement bool true" $iTerm
	        	echo "relaunch iTerm to take effectives"
	        	break
	        	;;
	        'Show' )
	        	$pb -c "Delete :LSUIElement" $iTerm
	        	echo "run killall 'iTerm' to exit, and then relaunch it"
	        	break
	        	;;
		'Cancel' )
			break
			;;
	    esac
	done
}

# 连接vpn
function vpn-connect {
/usr/bin/env osascript <<-EOF
  tell application "System Events"
    tell current location of network preferences
      set myConnection to the service "VIP-US2 -P"
        if myConnection is not null then
          if current configuration of myConnection is not connected then
            connect myConnection
          end if
        end if
      end tell
    return 30
  end tell
EOF
}

## 断开vpn
function vpn-disconnect {
/usr/bin/env osascript <<-EOF
  tell application "System Events"
    tell current location of network preferences
      set VPN to service "VIP-JP -P"
      if exists VPN then disconnect VPN
    end tell
  end tell
  return
EOF
}

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
