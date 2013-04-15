export CLICOLOR=1
export WB_ROOT=~/dev
export WB=$WB_ROOT/weatherbill

. $WB/tools/dotfiles/prompt.bash
. $WB/tools/dotfiles/review

PS1="\$(wb_env)[\[\033[01;34m\]\w\[\033[00m\]]\$(wb_git)$ "

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

alias ipython=/export/disk0/wb/python2.6/bin/ipython
alias pip26=/export/disk0/wb/python2.6/bin/pip
alias pep8=/export/disk0/wb/python2.6/bin/pep8
alias py26=/export/disk0/wb/python2.6/bin/python2.6
alias nosetests=/export/disk0/wb/python2.6/bin/nosetests

export PATH="$WB/tools:$PATH"
export PATH="$WB/python/scripts:$PATH"
export PATH="~/bin/:$PATH"
export PYTHONPATH=$WB/python
