# NOT SURE IF WE NEED THIS ANYMORE... CAME FROM BASH_PROFILE BEFORE OH-MY-SZH
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

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_FETCH_REMOTE_STATUS=0
    GIT_PROMPT_THEME=Default
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
  fi

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