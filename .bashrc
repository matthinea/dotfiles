export HISTTIMEFORMAT="%d/%m/%y %T "
GIT_PROMPT_FETCH_REMOTE_STATUS=0 

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES  # needed to prevent odd errors when testing spark applications

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
complete -C aws_completer aws

. "$HOME/.local/bin/env"
