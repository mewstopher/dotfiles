export PATH="$HOME/anaconda/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"
export PATH=$HOME/anaconda/bin:$PATH
# added by Anaconda3 5.0.1 installer


 

# source /usr/local/git/contrib/completion/git-completion.bash

# GIT_PS1_SHOWDIRTYSTATE=true

 

 

## colors taken from Taylor McGann's blog

# light colors

LK=$'\033[0;30m' # Black

LR=$'\033[0;31m' # Red

LG=$'\033[0;32m' # Green

LY=$'\033[0;33m' # Yellow

LB=$'\033[0;34m' # Blue

LP=$'\033[0;35m' # Purple

LC=$'\033[0;36m' # Cyan

LW=$'\033[0;37m' # White

 

# dark colors

DK=$'\033[0;90m' # Black

DR=$'\033[0;91m' # Red

DG=$'\033[0;32m' # Green

DY=$'\033[0;93m' # Yellow

DB=$'\033[0;94m' # Blue

DP=$'\033[0;95m' # Purple

DC=$'\033[0;96m' # Cyan

DW=$'\033[0;97m' # White

 

ENDCOLOR=$'\e[0m'  # End color

 

 

function git_color() {

    local git_status="$(git status 2> /dev/null)"

    if [[ ${#git_status}>0 ]]; then  # we're in a git repo

                local head_symref="$(git symbolic-ref --short -q HEAD)"

                local git_prompt=""

        if [[ ${#head_symref}>0 ]]; then  # so we're not in detached head

                                git_prompt="$head_symref"

                else

                                git_prompt="$(git rev-parse HEAD)"

                                git_prompt=${git_prompt:0:8}

                fi

 

                if [[ $git_status =~ "Your branch is ahead of" ]]; then

                                echo -en "${DY} ($git_prompt)"

        elif [[ $git_status =~ "Your branch is behind" ]]; then

                                echo -en "${DP} ($git_prompt)"

        elif [[ $git_status =~ "nothing to commit" ]]; then

                                echo -en "${DG} ($git_prompt)"

        else

                                echo -en "${DR} ($git_prompt)"

                fi

    fi

}

 

 

function console_swag() {

                local git_status="$(git status 2> /dev/null)"

               

                if [[ ${#git_status}>0 ]]; then

                                echo -e $DB :: 

                fi

}

 

# export PS1='\[$DY\]\u@mbp \w$(git_color)\n\$'

export PS1="\[$DC\]\u\[$DW\]@\[$DG\]\h\[$LC\]: \[$DY\]\w\$(console_swag)\$(git_color)\[$DY\]\n\$\[$ENDCOLOR\] "


# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
