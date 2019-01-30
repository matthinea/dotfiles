# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/matthew/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="awesomepanda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  rails
  ruby
  colorize
  yarn
  gulp
  zsh_reload
)

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export SHELL=/bin/zsh

# servers & deployment
alias spow='touch tmp/restart.txt'
alias deploy='bundle exec cap production deploy'
alias stage='bundle exec cap staging deploy'
alias resq='QUEUE=* bundle exec rake environment resque:work'
alias seeserv='tail -f log/development.log'

# G I T
# project-specific
alias hgbump='git add . && git ci -m "hg bump"'
alias tdmbump='git add Gemfile* && git commit -m "TD Models version bump"'
alias esbump='git add Gemfile* && git commit -m "elasticsearch-talentdesk version bump"'
alias assbump='bundle update reach-assets && git add . && git ci -m "assets bump"'
# branch
alias gb='git branch'
alias seebranchdiff='subl $(git diff --name-only master head)'
alias gab='git ab | tail -n 20'
alias gba='git ab | tail -n 20'
alias gcor='git checkout --track'
# log
alias glg='git log --graph'
alias gl='git log --color=always --date=short | less -R'
alias mylog='git log | grep hinea -B 2 -A 4 | less'
# push
alias gpb='git branch | grep -e "^*" | cut -d" " -f 2 | xargs git push origin'
alias gps='git push && stage'
# status
alias gs='git status'
alias opendiff='subl $(git status --porcelain | awk '\''{print $2}'\'')'
# diff
alias gd='git diff'
alias gds='git diff --staged'
# commit
alias gcm='git commit -m'
alias gc='git commit'
# stash
alias gsh='git stash'
alias gshp='git stash pop'
# checkout
alias gch='git checkout'
# add
alias gaa='git add -A'
alias ga='git add'
# reset
alias gr='git reset'
# pull
alias gp='git pull --no-edit'
# merge
alias gm='git merge --no-edit'
# see github URL
alias gh="open `git remote -v | grep fetch | awk '{print $2}' | sed 's/git@/http:\/\//' | sed 's/com:/com\//'`| head -n1"

# rails
alias be='bundle exec'
alias testdbreset='rails db:environment:set db:drop db:create db:schema:load RAILS_ENV=test'
alias rc='rails c'
alias rser='rails s'

# mysql
alias tddevdb='mysql -uroot -p talentdesk'
alias mysqld='/usr/local/mysql/bin/mysqld &> /dev/null &'

# elasticsearch
alias curles='curl -H "Authorization: Basic ZWxhc3RpYzoyMHJPSm1LenB5M0tnNmtzSHdnM1ZNTjU="'

# M I S C
export CLICOLOR=1
# set home to work
export START="/Users/matthew/"
if [[ $PWD == $HOME ]]; then
    cd $START
fi

# bash
alias ..='cd ..'
alias ngrep='grep -v grep'
alias clearr="clear && printf '\e[3J'"

eval "$(rbenv init -)"

export EDITOR='subl -w'
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTCONTROL=ignorespace

git-is-merged () {
  merge_destination_branch=$1
  merge_source_branch=$2

  merge_base=$(git merge-base $merge_destination_branch $merge_source_branch)
  merge_source_current_commit=$(git rev-parse $merge_source_branch)
  if [[ $merge_base = $merge_source_current_commit ]]
  then
    echo $merge_source_branch is merged into $merge_destination_branch
    return 0
  else
    echo $merge_source_branch is not merged into $merge_destination_branch
    return 1
  fi
}
