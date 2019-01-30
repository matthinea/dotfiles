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


#echo -ne "\x1bP\x1b]4;0;rgb:00/00/00\a\x1b\\"
#echo -ne "\x1bP\x1b]4;1;rgb:7a/00/00\a\x1b\\"
#echo -ne "\x1bP\x1b]4;2;rgb:00/7a/00\a\x1b\\"
#echo -ne "\x1bP\x1b]4;3;rgb:7a/7a/00\a\x1b\\"
#echo -ne "\x1bP\x1b]4;4;rgb:00/00/7a\a\x1b\\"
#echo -ne "\x1bP\x1b]4;5;rgb:7a/00/7a\a\x1b\\"
#echo -ne "\x1bP\x1b]4;6;rgb:00/7a/7a\a\x1b\\"
#echo -ne "\x1bP\x1b]4;7;rgb:c5/c5/c5\a\x1b\\"
#echo -ne "\x1bP\x1b]4;8;rgb:7a/7a/7a\a\x1b\\"
#echo -ne "\x1bP\x1b]4;9;rgb:ff/00/00\a\x1b\\"
#echo -ne "\x1bP\x1b]4;10;rgb:00/ff/00\a\x1b\\"
#echo -ne "\x1bP\x1b]4;11;rgb:ff/ff/00\a\x1b\\"
#echo -ne "\x1bP\x1b]4;12;rgb:00/00/ff\a\x1b\\"
#echo -ne "\x1bP\x1b]4;13;rgb:ff/00/ff\a\x1b\\"
#echo -ne "\x1bP\x1b]4;14;rgb:00/ff/ff\a\x1b\\"
#echo -ne "\x1bP\x1b]4;15;rgb:ff/ff/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;16;rgb:00/00/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;17;rgb:00/00/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;18;rgb:00/00/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;19;rgb:00/00/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;20;rgb:00/00/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;21;rgb:00/00/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;22;rgb:00/57/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;23;rgb:00/57/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;24;rgb:00/57/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;25;rgb:00/57/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;26;rgb:00/57/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;27;rgb:00/57/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;28;rgb:00/81/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;29;rgb:00/81/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;30;rgb:00/81/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;31;rgb:00/81/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;32;rgb:00/81/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;33;rgb:00/81/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;34;rgb:00/b0/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;35;rgb:00/b0/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;36;rgb:00/b0/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;37;rgb:00/b0/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;38;rgb:00/b0/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;39;rgb:00/b0/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;40;rgb:00/e2/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;41;rgb:00/e2/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;42;rgb:00/e2/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;43;rgb:00/e2/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;44;rgb:00/e2/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;45;rgb:00/e2/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;46;rgb:00/ff/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;47;rgb:00/ff/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;48;rgb:00/ff/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;49;rgb:00/ff/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;50;rgb:00/ff/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;51;rgb:00/ff/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;52;rgb:57/00/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;53;rgb:57/00/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;54;rgb:57/00/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;55;rgb:57/00/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;56;rgb:57/00/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;57;rgb:57/00/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;58;rgb:57/57/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;59;rgb:57/57/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;60;rgb:57/57/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;61;rgb:57/57/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;62;rgb:57/57/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;63;rgb:57/57/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;64;rgb:57/81/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;65;rgb:57/81/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;66;rgb:57/81/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;67;rgb:57/81/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;68;rgb:57/81/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;69;rgb:57/81/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;70;rgb:57/b0/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;71;rgb:57/b0/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;72;rgb:57/b0/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;73;rgb:57/b0/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;74;rgb:57/b0/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;75;rgb:57/b0/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;76;rgb:57/e2/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;77;rgb:57/e2/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;78;rgb:57/e2/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;79;rgb:57/e2/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;80;rgb:57/e2/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;81;rgb:57/e2/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;82;rgb:57/ff/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;83;rgb:57/ff/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;84;rgb:57/ff/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;85;rgb:57/ff/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;86;rgb:57/ff/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;87;rgb:57/ff/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;88;rgb:81/00/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;89;rgb:81/00/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;90;rgb:81/00/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;91;rgb:81/00/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;92;rgb:81/00/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;93;rgb:81/00/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;94;rgb:81/57/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;95;rgb:81/57/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;96;rgb:81/57/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;97;rgb:81/57/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;98;rgb:81/57/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;99;rgb:81/57/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;100;rgb:81/81/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;101;rgb:81/81/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;102;rgb:81/81/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;103;rgb:81/81/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;104;rgb:81/81/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;105;rgb:81/81/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;106;rgb:81/b0/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;107;rgb:81/b0/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;108;rgb:81/b0/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;109;rgb:81/b0/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;110;rgb:81/b0/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;111;rgb:81/b0/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;112;rgb:81/e2/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;113;rgb:81/e2/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;114;rgb:81/e2/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;115;rgb:81/e2/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;116;rgb:81/e2/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;117;rgb:81/e2/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;118;rgb:81/ff/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;119;rgb:81/ff/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;120;rgb:81/ff/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;121;rgb:81/ff/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;122;rgb:81/ff/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;123;rgb:81/ff/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;124;rgb:b0/00/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;125;rgb:b0/00/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;126;rgb:b0/00/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;127;rgb:b0/00/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;128;rgb:b0/00/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;129;rgb:b0/00/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;130;rgb:b0/57/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;131;rgb:b0/57/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;132;rgb:b0/57/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;133;rgb:b0/57/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;134;rgb:b0/57/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;135;rgb:b0/57/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;136;rgb:b0/81/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;137;rgb:b0/81/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;138;rgb:b0/81/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;139;rgb:b0/81/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;140;rgb:b0/81/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;141;rgb:b0/81/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;142;rgb:b0/b0/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;143;rgb:b0/b0/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;144;rgb:b0/b0/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;145;rgb:b0/b0/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;146;rgb:b0/b0/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;147;rgb:b0/b0/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;148;rgb:b0/e2/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;149;rgb:b0/e2/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;150;rgb:b0/e2/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;151;rgb:b0/e2/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;152;rgb:b0/e2/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;153;rgb:b0/e2/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;154;rgb:b0/ff/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;155;rgb:b0/ff/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;156;rgb:b0/ff/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;157;rgb:b0/ff/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;158;rgb:b0/ff/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;159;rgb:b0/ff/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;160;rgb:e2/00/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;161;rgb:e2/00/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;162;rgb:e2/00/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;163;rgb:e2/00/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;164;rgb:e2/00/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;165;rgb:e2/00/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;166;rgb:e2/57/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;167;rgb:e2/57/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;168;rgb:e2/57/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;169;rgb:e2/57/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;170;rgb:e2/57/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;171;rgb:e2/57/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;172;rgb:e2/81/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;173;rgb:e2/81/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;174;rgb:e2/81/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;175;rgb:e2/81/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;176;rgb:e2/81/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;177;rgb:e2/81/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;178;rgb:e2/b0/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;179;rgb:e2/b0/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;180;rgb:e2/b0/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;181;rgb:e2/b0/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;182;rgb:e2/b0/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;183;rgb:e2/b0/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;184;rgb:e2/e2/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;185;rgb:e2/e2/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;186;rgb:e2/e2/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;187;rgb:e2/e2/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;188;rgb:e2/e2/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;189;rgb:e2/e2/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;190;rgb:e2/ff/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;191;rgb:e2/ff/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;192;rgb:e2/ff/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;193;rgb:e2/ff/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;194;rgb:e2/ff/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;195;rgb:e2/ff/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;196;rgb:ff/00/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;197;rgb:ff/00/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;198;rgb:ff/00/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;199;rgb:ff/00/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;200;rgb:ff/00/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;201;rgb:ff/00/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;202;rgb:ff/57/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;203;rgb:ff/57/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;204;rgb:ff/57/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;205;rgb:ff/57/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;206;rgb:ff/57/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;207;rgb:ff/57/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;208;rgb:ff/81/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;209;rgb:ff/81/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;210;rgb:ff/81/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;211;rgb:ff/81/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;212;rgb:ff/81/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;213;rgb:ff/81/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;214;rgb:ff/b0/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;215;rgb:ff/b0/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;216;rgb:ff/b0/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;217;rgb:ff/b0/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;218;rgb:ff/b0/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;219;rgb:ff/b0/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;220;rgb:ff/e2/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;221;rgb:ff/e2/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;222;rgb:ff/e2/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;223;rgb:ff/e2/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;224;rgb:ff/e2/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;225;rgb:ff/e2/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;226;rgb:ff/ff/00\a\x1b\\"
echo -ne "\x1bP\x1b]4;227;rgb:ff/ff/57\a\x1b\\"
echo -ne "\x1bP\x1b]4;228;rgb:ff/ff/81\a\x1b\\"
echo -ne "\x1bP\x1b]4;229;rgb:ff/ff/b0\a\x1b\\"
echo -ne "\x1bP\x1b]4;230;rgb:ff/ff/e2\a\x1b\\"
echo -ne "\x1bP\x1b]4;231;rgb:ff/ff/ff\a\x1b\\"
echo -ne "\x1bP\x1b]4;232;rgb:06/06/06\a\x1b\\"
echo -ne "\x1bP\x1b]4;233;rgb:0f/0f/0f\a\x1b\\"
echo -ne "\x1bP\x1b]4;234;rgb:17/17/17\a\x1b\\"
echo -ne "\x1bP\x1b]4;235;rgb:20/20/20\a\x1b\\"
echo -ne "\x1bP\x1b]4;236;rgb:29/29/29\a\x1b\\"
echo -ne "\x1bP\x1b]4;237;rgb:32/32/32\a\x1b\\"
echo -ne "\x1bP\x1b]4;238;rgb:3c/3c/3c\a\x1b\\"
echo -ne "\x1bP\x1b]4;239;rgb:46/46/46\a\x1b\\"
echo -ne "\x1bP\x1b]4;240;rgb:50/50/50\a\x1b\\"
echo -ne "\x1bP\x1b]4;241;rgb:5a/5a/5a\a\x1b\\"
echo -ne "\x1bP\x1b]4;242;rgb:64/64/64\a\x1b\\"
echo -ne "\x1bP\x1b]4;243;rgb:6f/6f/6f\a\x1b\\"
echo -ne "\x1bP\x1b]4;244;rgb:7a/7a/7a\a\x1b\\"
echo -ne "\x1bP\x1b]4;245;rgb:85/85/85\a\x1b\\"
echo -ne "\x1bP\x1b]4;246;rgb:90/90/90\a\x1b\\"
echo -ne "\x1bP\x1b]4;247;rgb:9c/9c/9c\a\x1b\\"
echo -ne "\x1bP\x1b]4;248;rgb:a8/a8/a8\a\x1b\\"
echo -ne "\x1bP\x1b]4;249;rgb:b4/b4/b4\a\x1b\\"
echo -ne "\x1bP\x1b]4;250;rgb:c0/c0/c0\a\x1b\\"
echo -ne "\x1bP\x1b]4;251;rgb:cd/cd/cd\a\x1b\\"
echo -ne "\x1bP\x1b]4;252;rgb:d9/d9/d9\a\x1b\\"
echo -ne "\x1bP\x1b]4;253;rgb:e6/e6/e6\a\x1b\\"
echo -ne "\x1bP\x1b]4;254;rgb:f4/f4/f4\a\x1b\\"
echo -ne "\x1bP\x1b]4;255;rgb:ff/ff/ff\a\x1b\\"