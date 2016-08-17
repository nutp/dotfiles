# shell config
autoload -Uz colors && colors
autoload -Uz compinit && compinit

export EDITOR=vim
bindkey "^?" backward-delete-char # backspace over everything

setopt extendedglob    # enable extended globbing
setopt nocaseglob      # ignore case for some built-in completion items
setopt autocd          # auto `cd` by typing the dir name
setopt autopushd       # auto `pushd` on `cd`
setopt pushd_silent    # silence `pushd`s
setopt prompt_subst    # enables $ blocks in prompts
setopt prompt_percent
setopt nolistambiguous # starts completion without waiting a second TAB

# command history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# completion option - just enable case insensitive matching
zstyle ':completion:*' matcher-list '' '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# load rbenv automatically
eval "$(rbenv init -)"

# prompt
function current_git_branch() {
  git symbolic-ref -q HEAD 2> /dev/null | cut -d/ -f 3,4
}

function git_dirty_flag() {
  local STATUS=''
  STATUS=$(git status --porcelain 2> /dev/null | tail -n1)
  if [[ -n $STATUS ]]; then
    echo "✗"
  fi
}

PS1='
%~ %{$fg[red]%}$(current_git_branch) %{$fg[yellow]%}$(git_dirty_flag)
%{$fg[red]%}%#%{$reset_color%}  '

PS2=' %{$fg[red]%}»%{$reset_color%} '

# aliases
alias ...="cd ../.."
alias clr="clear"
alias cls="clear"
alias g="git"
alias ls="ls -AFG"
alias ll="ls -FGlh"
