# Path to your oh-my-zsh installation.

export ZSH=$HOME/.oh-my-zsh
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/.rbenv/bin:/usr/local/sbi:$GOPATH/bin:/usr/local/nginx/sbin
export LD_LIBRARY_PATH=$HOME/lib
export EDITOR="vim"
export CC=/usr/bin/gcc

eval "$(rbenv init -)"

alias @ps="python -m SimpleHTTPServer"
alias @tail="tail -n 50 -f"

alias @vpn="open ~/Library/Mobile\ Documents/com\~apple\~ScriptEditor2/Documents/VPN-RELOAD.app"
alias @rvpn="vpn-disconnect & ps -ef | grep VPN-RELOAD | grep -v grep | cut -c 7-15 | xargs kill -9"
alias druby="docker run -it --rm hub.caishuo.com/ruby ruby"

eval "$(docker-machine env default)"
#export DOCKER_TLS_VERIFY=1
#export DOCKER_HOST=tcp://192.168.59.103:2376
#export DOCKER_CERT_PATH=/Users/warrenoo/.boot2docker/certs/boot2docker-vm

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

#tmux_init()
#{
  #tmux new-session -s "kumu" -d -n "local"    # 开启一个会话
  #tmux new-window -n "other"          # 开启一个窗口
  #tmux split-window -h                # 开启一个竖屏
  #tmux split-window -v "top"          # 开启一个横屏,并执行top命令
  #tmux -2 attach-session -d           # tmux -2强制启用256color，连接已开启的tmux
#}

## 判断是否已有开启的tmux会话，没有则开启
#if which tmux 2>&1 >/dev/null; then
  #test -z "$TMUX" && (tmux attach || tmux_init)
#fi

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias)
