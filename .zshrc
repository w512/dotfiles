# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export CLICOLOR=1

export HISTFILE=~/.zsh_history          # History filepath
export HISTSIZE=100000                   # Maximum events for internal history
export SAVEHIST=100000                   # Maximum events in history file

setopt INC_APPEND_HISTORY     # save history entries as soon as they are entered
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS   # remove older duplicate entries from history
setopt HIST_REDUCE_BLANKS     # remove superfluous blanks from history items
setopt SHARE_HISTORY          # share history between different instances of the shell
# setopt auto_cd # cd by typing directory name if it's not a command
# setopt correct_all # autocorrect commands
# setopt auto_list # automatically list choices on ambiguous completion
# setopt auto_menu # automatically use menu completion
# setopt always_to_end # move cursor to end if word had one match


export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

export PATH="$PATH:/Users/nikolay/projects/flutter/bin"

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search

# [[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
# [[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search


alias ..="cd .."
alias c='clear'
alias p='python3'
alias ll='ls -lah'
alias myip="curl http://ipecho.net/plain; echo"
alias lvim="/Users/nick/.local/bin/lvim"



prompt_git_branch() {
    autoload -Uz vcs_info
    precmd_vcs_info() { vcs_info }
    precmd_functions+=( precmd_vcs_info )
    setopt prompt_subst
    zstyle ':vcs_info:git:*' formats '%b'
}
prompt_git_info() {
    [ ! -z "$vcs_info_msg_0_" ] && echo "$ZSH_THEME_GIT_PROMPT_PREFIX$vcs_info_msg_0_$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
prompt_purity_precmd() {
    # Pass a line before each prompt
    print -P ''
}
prompt_purification_setup() {
    # Display git branch
    autoload -Uz add-zsh-hook
    # add-zsh-hook precmd prompt_purity_precmd
    # ZSH_THEME_GIT_PROMPT_PREFIX=" %F{yellow}λ:%f%F{blue}"
    ZSH_THEME_GIT_PROMPT_PREFIX=" %F{yellow}git:%f%F{cyan}"
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""
    ZSH_THEME_GIT_PROMPT_ADDED="%F{green}+%f "
    ZSH_THEME_GIT_PROMPT_MODIFIED="%F{blue}%f "
    ZSH_THEME_GIT_PROMPT_DELETED="%F{red}x%f "
    ZSH_THEME_GIT_PROMPT_RENAMED="%F{magenta}➜%f "
    ZSH_THEME_GIT_PROMPT_UNMERGED="%F{yellow}═%f "
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{white}%f "
    ZSH_THEME_GIT_PROMPT_STASHED="%B%F{red}%f%b "
    ZSH_THEME_GIT_PROMPT_BEHIND="%B%F{red}%f%b "
    ZSH_THEME_GIT_PROMPT_AHEAD="%B%F{green}%f%b "
    prompt_git_branch
    # RPROMPT='$(prompt_git_info) $(git_prompt_status)'
    PROMPT=$'\n[%F{red}%D{%H:%M:%S}%f] %F{green}%n@%m%f $(prompt_git_info) \n%F{blue}%~ %B%F{blue}>%f%b'
}
prompt_purification_setup


# If a new command line being added to the history list duplicates an older one,
# the older command is removed from the list (even if it is not the previous event).
setopt hist_ignore_all_dups


bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# https://github.com/zsh-users/zsh-history-substring-search
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=''  # do not highlight founded substring



# https://github.com/romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.p10k.zsh
# source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
source /usr/local/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme


# bun
export BUN_INSTALL=~/.bun
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s ~/.bun/_bun ] && source ~/.bun/_bun



export BAT_THEME="ansi"


# EZA
# https://github.com/eza-community/eza
alias ll='eza -l --time-style=long-iso --all --sort modified'


# fzf shell integration
source <(fzf --zsh)
