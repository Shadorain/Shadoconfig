# =========================================================================== #
# Shadoconfig - Zshenv                                                        #
# =========================================================================== #

# == General == #
export EDITOR="nvim"
export VISUAL=$EDITOR
export TERMINAL="ghostty"
export TERM=$TERMINAL
export VIDEO="open"

## -- Configuration -- ##
export XDG_CONFIG_HOME="$HOME/.config"
export HOME_GIT=$HOME
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"

# == Miscellaneous == #
export HOMEBREW_NO_ENV_HINTS=1

# == PATH == #
export PATH=$PATH:~/.local/share/nvim/mason/bin # Neovim Mason

# == Sources == #
source "$HOME/.cargo/env"

## -- Time -- ##
export TIME="$(date +"%A, %I:%M %p")"
export DAY="$(date +"%d")"
export MONTH="$(date +"%m")"
export YEAR="$(date +"%Y")"

## -- Colors -- ##
export LS_COLORS=$LS_COLORS:"*.c=38;5;169:*.h=38;5;135:*.o=38;5;97:*.y=38;5;99:*.l=38;5;99:*.sh=38;5;104"
export EZA_COLORS=$EZA_COLORS:"*.c=38;5;169:*.h=38;5;135:*.o=38;5;97:*.y=38;5;99:*.l=38;5;99:*.sh=38;5;104"
. "$HOME/.cargo/env"
