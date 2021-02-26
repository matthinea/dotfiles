# branch
alias gb='git branch'
alias gab='git ab | tail -n 20'
alias gba='git ab | tail -n 20'

# log
alias glg='git log --graph'
alias gl='git log --color=always --date=short | less -R'
alias mylog='git log | grep hinea -B 2 -A 4 | less'
myfiles() {
  git log --pretty="%H" --author="Matthew Hinea" | while read commit_hash; do git show --oneline --name-only $commit_hash | tail -n+2; done | sort | uniq
}

# push
alias gpb='git branch | grep -e "^*" | cut -d" " -f 2 | xargs git push origin'
alias gpbf='git branch | grep -e "^*" | cut -d" " -f 2 | xargs -n 1 -I branch_name git push origin branch_name --force-with-lease'
alias gps='git push && stage'

# status
alias gs='git status'
alias opendiff='mine $(vim status --porcelain | awk '\''{print $2}'\'')'

# diff
alias gd='git diff'
alias gds='git diff --staged'
alias gdh='git diff head^'

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
alias gpur='git branch | grep -e "^*" | cut -d" " -f 2 | xargs -I {} git pull origin {} --rebase'

# merge
alias gm='git merge --no-edit'

# TODO: git get next commit on way to master
gnx() {
  git log --reverse --ancestry-path head..master --pretty=format:"%h" | head -1
}
