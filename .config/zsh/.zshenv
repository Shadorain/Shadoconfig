# =========================================================================== #
# Shadoconfig - Zshenv                                                        #
# =========================================================================== #

# == General == #
export EDITOR="nvim"
export VISUAL=$EDITOR
export TERMINAL="kitty"
export TERM=$TERMINAL
export BROWSER="firefox"
export VIDEO="mpv"

## -- Configuration -- ##
export XDG_CONFIG_HOME="$HOME/.config"
export HOME_GIT=$HOME
export HYPRLAND_HEADERS="$HOME/.local/share/hyprload/hyprland/"

## -- Time -- ##
export TIME="$(date +"%A, %I:%M %p")"
export DAY="$(date +"%d")"
export MONTH="$(date +"%m")"
export YEAR="$(date +"%Y")"


# == Miscellaneous == #
## -- ESP32 -- ##
export LIBCLANG_PATH="$HOME/.rustup/toolchains/esp/xtensa-esp32-elf-clang/esp-16.0.0-20230516/esp-clang/lib"
export PATH="$HOME/.rustup/toolchains/esp/xtensa-esp32s3-elf/esp-12.2.0_20230208/xtensa-esp32s3-elf/bin:$PATH"
export PATH="$HOME/.rustup/toolchains/esp/xtensa-esp32s2-elf/esp-12.2.0_20230208/xtensa-esp32s2-elf/bin:$PATH"
export PATH="$HOME/.rustup/toolchains/esp/xtensa-esp32-elf/esp-12.2.0_20230208/xtensa-esp32-elf/bin:$PATH"
export PATH="$HOME/.rustup/toolchains/esp/riscv32-esp-elf/esp-12.2.0_20230208/riscv32-esp-elf/bin:$PATH"

## -- Colors -- ##
export LS_COLORS=$LS_COLORS:"*.c=38;5;169:*.h=38;5;135:*.o=38;5;97:*.y=38;5;99:*.l=38;5;99:*.sh=38;5;104"
export EXA_COLORS=$EXA_COLORS:"*.c=38;5;169:*.h=38;5;135:*.o=38;5;97:*.y=38;5;99:*.l=38;5;99:*.sh=38;5;104"


# == PATH == #
export PATH=$PATH:~/.local/bin
export PATH="$HOME/go/bin:$PATH"
export PATH=$PATH:~/.local/share/nvim/mason/bin # Neovim Mason

# == Sources == #
source "$HOME/.cargo/env"
