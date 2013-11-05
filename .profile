export CLICOLOR=1
export DATA=~/data

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export PATH="~/bin/:$PATH"
export PATH="/usr/lib/include":$PATH
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PYTHONPATH="/usr/local/lib"
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib