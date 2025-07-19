# =========================================================================== #
# Shadoconfig - Zshrc                                                         #
# =========================================================================== #

# == LS Colors == #
LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.md=38;5;68:*.log=38;5;68:*.c=38;5;169:*.h=38;5;135:*.o=38;5;97:*.y=38;5;99:*.l=38;5;99:*.sh=38;5;104"
EZA_COLORS="*.md=38;5;68:*.log=38;5;68:*.c=38;5;169:*.cpp=38;5;169:*.h=38;5;135:*.o=38;5;97:*.y=38;5;99:*.l=38;5;99:*.sh=38;5;104"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P0403c58
  \e]P1ea6f91
  \e]P29bced7
  \e]P3f1ca93
  \e]P434738e
  \e]P5c3a5e6
  \e]P6eabbb9
  \e]P7faebd7
  \e]P86f6e85
  \e]P9ea6f91
  \e]PA9bced7
  \e]PBf1ca93
  \e]PC34738e
  \e]PDc3a5e6
  \e]PEeabbb9
  \e]PFffffff
  "
  # get rid of artifacts
  clear
fi

# == Sources == #
source ${ZDOTDIR}/.zsh_aliases
source ${ZDOTDIR}/.zsh_zinit
fpath+="$ZDOTDIR/.zfunc"

# == Functions == #
x0 () { cat "$@" | command curl -fsLF "file=@-" 0x0.st | tr -d "\n" | xclip -in -sel clip && notify-send -t 900 -u low "Link copied to clipboard!" }
x1 () { cat "$@" | command curl -fsLF "file=@-" 0x0.st | tr -d "\n" | awk '{print $0}' }


# == History == #
export HISTFILE="$ZDOTDIR/.zsh_history"
# export HISTDUP=erase
# setopt appendhistory
# setopt sharehistory
# setopt hist_ignore_space
# setopt hist_ignore_all_dups
# setopt hist_save_no_dups
# setopt hist_ignore_dups
# setopt hist_find_no_dups

# == Initialize == #
eval $(ssh-agent -s) > /dev/null 2>&1 && ssh-add $HOME/.ssh/github_np > /dev/null 2>&1
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)" # Starship
