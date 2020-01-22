export CLICOLOR=1
# set home to work
export START="/Users/matthew/"
if [[ $PWD == $HOME ]]; then
    cd $START
fi

eval "$(rbenv init -)"

export EDITOR='mine -w'
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTCONTROL=ignorespace
export NODE_ENV=development

