# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

export PATH=$PATH:/usr/local/mysql/bin
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/mysql/lib/"
export PATH="/usr/local/mongodb/bin:$PATH"

alias @ps="python -m SimpleHTTPServer"
alias @ssh244="ssh wangyang.shen@172.20.2.244"
alias @tail="tail -n 50 -f"
alias @gems="vi ~/.rvm/gems/ruby-1.9.3-p547@global/gems/"
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
plugins=(rails3 rails git textmate ruby rvm gem git github brew bundler textmate pow)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/swy/.rvm/gems/ruby-1.9.3-p547/bin:/Users/swy/.rvm/gems/ruby-1.9.3-p547@global/bin:/Users/swy/.rvm/rubies/ruby-1.9.3-p547/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/mysql/bin:/Users/swy/.rvm/bin"
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