autoload -U colors
colors

setopt PROMPT_SUBST
bindkey -e

stty erase ˆH

REPORTTIME=10
LISTMAX=0

PS1="%n@%m:%~%# "

function machine_name {
    [ -f ~/.machine_name ] && cat ~/.machine_name || hostname -s
}

function number_of_jobs {
    count=$(jobs | wc -l | tr -d ' ') || return
    echo -n "${count}"
}

function git_prompt_unpushed {
    git cherry -v origin/$(git_prompt_branch) 2>/dev/null
}

function git_prompt_branch {
    echo -n $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

function git_prompt_current_ref {
    ref=$(git rev-parse --short HEAD 2> /dev/null) || return
    echo -n "${ref}"
}

function git_prompt_unpushed_changes {
    local_branch=$(git_prompt_branch)
    remote_repo=$(git config branch.$local_branch.remote)
    git cherry -v $remote_repo/$local_branch 2>/dev/null
}

function git_prompt_need_push {
    if [[ $(git_prompt_unpushed_changes) == '' ]]
    then
        echo ""
    else
        echo " with %{$fg[magenta]%}unpushed%{$reset_color%}"
    fi
}

function git_prompt_dirty {
    what=$(git status 2>/dev/null | tail -n 1)
    if [[ $what == '' ]]
    then
        echo ''
    else
        if [[ $what == 'nothing to commit (working directory clean)' ]]
        then
            echo " %{$fg[green]%}$(git_prompt_branch)%{$reset_color%}"
        else
            echo " %{$fg[yellow]%}$(git_prompt_branch)%{$reset_color%}"
        fi
    fi
}

PROMPT=$'($(number_of_jobs))$(git_prompt_dirty)$(git_prompt_need_push)%{$reset_color%} $ '
RPROMPT='%{$fg[cyan]%}%c%{$reset_color%}'
