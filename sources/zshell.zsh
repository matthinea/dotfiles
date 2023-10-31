export CLICOLOR=1
# set home to work
export START="/Users/matthi/axle"
if [[ $PWD == $HOME ]]; then
  cd $START
fi

eval "$(rbenv init -)"

export EDITOR='vim'
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTCONTROL=ignorespace
export NODE_ENV=development

