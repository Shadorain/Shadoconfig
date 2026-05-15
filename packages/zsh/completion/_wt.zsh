#compdef wt

autoload -U is-at-least

_wt() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_wt_commands" \
"*::: :->wt" \
&& ret=0
    case $state in
    (wt)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:wt-command-$line[1]:"
        case $line[1] in
            (timer)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
":: :_wt__timer_commands" \
"*::: :->timer" \
&& ret=0

    case $state in
    (timer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:wt-timer-command-$line[1]:"
        case $line[1] in
            (start)
_arguments "${_arguments_options[@]}" : \
'-m+[Description of work]:DESCRIPTION:_default' \
'--description=[Description of work]:DESCRIPTION:_default' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(stop)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(cancel)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(status)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_wt__timer__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:wt-timer-help-command-$line[1]:"
        case $line[1] in
            (start)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(stop)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(cancel)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(status)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(log)
_arguments "${_arguments_options[@]}" : \
'-d+[Date (YYYY-MM-DD format, defaults to today)]:DATE:_default' \
'--date=[Date (YYYY-MM-DD format, defaults to today)]:DATE:_default' \
'-m+[Description of work done]:DESCRIPTION:_default' \
'--description=[Description of work done]:DESCRIPTION:_default' \
'-h[Print help]' \
'--help[Print help]' \
':hours -- Hours worked (e.g., 1.5, 2, 0.5):_default' \
&& ret=0
;;
(l)
_arguments "${_arguments_options[@]}" : \
'-d+[Date (YYYY-MM-DD format, defaults to today)]:DATE:_default' \
'--date=[Date (YYYY-MM-DD format, defaults to today)]:DATE:_default' \
'-m+[Description of work done]:DESCRIPTION:_default' \
'--description=[Description of work done]:DESCRIPTION:_default' \
'-h[Print help]' \
'--help[Print help]' \
':hours -- Hours worked (e.g., 1.5, 2, 0.5):_default' \
&& ret=0
;;
(report)
_arguments "${_arguments_options[@]}" : \
'--from=[Custom start date (YYYY-MM-DD)]:FROM:_default' \
'--to=[Custom end date (YYYY-MM-DD)]:TO:_default' \
'-h[Print help]' \
'--help[Print help]' \
'::period -- Report period:(today yesterday week month year all)' \
&& ret=0
;;
(r)
_arguments "${_arguments_options[@]}" : \
'--from=[Custom start date (YYYY-MM-DD)]:FROM:_default' \
'--to=[Custom end date (YYYY-MM-DD)]:TO:_default' \
'-h[Print help]' \
'--help[Print help]' \
'::period -- Report period:(today yesterday week month year all)' \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':id -- Entry ID to delete:_default' \
&& ret=0
;;
(d)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':id -- Entry ID to delete:_default' \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':id -- Entry ID to edit:_default' \
&& ret=0
;;
(e)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':id -- Entry ID to edit:_default' \
&& ret=0
;;
(interactive)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(i)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(c)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_wt__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:wt-help-command-$line[1]:"
        case $line[1] in
            (timer)
_arguments "${_arguments_options[@]}" : \
":: :_wt__help__timer_commands" \
"*::: :->timer" \
&& ret=0

    case $state in
    (timer)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:wt-help-timer-command-$line[1]:"
        case $line[1] in
            (start)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(stop)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(cancel)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(status)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
(log)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(report)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(interactive)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_wt_commands] )) ||
_wt_commands() {
    local commands; commands=(
'timer:Start or stop the timer' \
'log:Log hours manually' \
'l:Log hours manually' \
'report:View time reports' \
'r:View time reports' \
'delete:Delete a time entry' \
'd:Delete a time entry' \
'edit:Edit a time entry' \
'e:Edit a time entry' \
'interactive:Interactive mode for logging time' \
'i:Interactive mode for logging time' \
'completions:Add Shell completions support' \
'c:Add Shell completions support' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'wt commands' commands "$@"
}
(( $+functions[_wt__completions_commands] )) ||
_wt__completions_commands() {
    local commands; commands=()
    _describe -t commands 'wt completions commands' commands "$@"
}
(( $+functions[_wt__delete_commands] )) ||
_wt__delete_commands() {
    local commands; commands=()
    _describe -t commands 'wt delete commands' commands "$@"
}
(( $+functions[_wt__edit_commands] )) ||
_wt__edit_commands() {
    local commands; commands=()
    _describe -t commands 'wt edit commands' commands "$@"
}
(( $+functions[_wt__help_commands] )) ||
_wt__help_commands() {
    local commands; commands=(
'timer:Start or stop the timer' \
'log:Log hours manually' \
'report:View time reports' \
'delete:Delete a time entry' \
'edit:Edit a time entry' \
'interactive:Interactive mode for logging time' \
'completions:Add Shell completions support' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'wt help commands' commands "$@"
}
(( $+functions[_wt__help__completions_commands] )) ||
_wt__help__completions_commands() {
    local commands; commands=()
    _describe -t commands 'wt help completions commands' commands "$@"
}
(( $+functions[_wt__help__delete_commands] )) ||
_wt__help__delete_commands() {
    local commands; commands=()
    _describe -t commands 'wt help delete commands' commands "$@"
}
(( $+functions[_wt__help__edit_commands] )) ||
_wt__help__edit_commands() {
    local commands; commands=()
    _describe -t commands 'wt help edit commands' commands "$@"
}
(( $+functions[_wt__help__help_commands] )) ||
_wt__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'wt help help commands' commands "$@"
}
(( $+functions[_wt__help__interactive_commands] )) ||
_wt__help__interactive_commands() {
    local commands; commands=()
    _describe -t commands 'wt help interactive commands' commands "$@"
}
(( $+functions[_wt__help__log_commands] )) ||
_wt__help__log_commands() {
    local commands; commands=()
    _describe -t commands 'wt help log commands' commands "$@"
}
(( $+functions[_wt__help__report_commands] )) ||
_wt__help__report_commands() {
    local commands; commands=()
    _describe -t commands 'wt help report commands' commands "$@"
}
(( $+functions[_wt__help__timer_commands] )) ||
_wt__help__timer_commands() {
    local commands; commands=(
'start:Start the timer' \
'stop:Stop the timer' \
'cancel:Cancel the current timer without logging' \
'status:Check timer status' \
    )
    _describe -t commands 'wt help timer commands' commands "$@"
}
(( $+functions[_wt__help__timer__cancel_commands] )) ||
_wt__help__timer__cancel_commands() {
    local commands; commands=()
    _describe -t commands 'wt help timer cancel commands' commands "$@"
}
(( $+functions[_wt__help__timer__start_commands] )) ||
_wt__help__timer__start_commands() {
    local commands; commands=()
    _describe -t commands 'wt help timer start commands' commands "$@"
}
(( $+functions[_wt__help__timer__status_commands] )) ||
_wt__help__timer__status_commands() {
    local commands; commands=()
    _describe -t commands 'wt help timer status commands' commands "$@"
}
(( $+functions[_wt__help__timer__stop_commands] )) ||
_wt__help__timer__stop_commands() {
    local commands; commands=()
    _describe -t commands 'wt help timer stop commands' commands "$@"
}
(( $+functions[_wt__interactive_commands] )) ||
_wt__interactive_commands() {
    local commands; commands=()
    _describe -t commands 'wt interactive commands' commands "$@"
}
(( $+functions[_wt__log_commands] )) ||
_wt__log_commands() {
    local commands; commands=()
    _describe -t commands 'wt log commands' commands "$@"
}
(( $+functions[_wt__report_commands] )) ||
_wt__report_commands() {
    local commands; commands=()
    _describe -t commands 'wt report commands' commands "$@"
}
(( $+functions[_wt__timer_commands] )) ||
_wt__timer_commands() {
    local commands; commands=(
'start:Start the timer' \
'stop:Stop the timer' \
'cancel:Cancel the current timer without logging' \
'status:Check timer status' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'wt timer commands' commands "$@"
}
(( $+functions[_wt__timer__cancel_commands] )) ||
_wt__timer__cancel_commands() {
    local commands; commands=()
    _describe -t commands 'wt timer cancel commands' commands "$@"
}
(( $+functions[_wt__timer__help_commands] )) ||
_wt__timer__help_commands() {
    local commands; commands=(
'start:Start the timer' \
'stop:Stop the timer' \
'cancel:Cancel the current timer without logging' \
'status:Check timer status' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'wt timer help commands' commands "$@"
}
(( $+functions[_wt__timer__help__cancel_commands] )) ||
_wt__timer__help__cancel_commands() {
    local commands; commands=()
    _describe -t commands 'wt timer help cancel commands' commands "$@"
}
(( $+functions[_wt__timer__help__help_commands] )) ||
_wt__timer__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'wt timer help help commands' commands "$@"
}
(( $+functions[_wt__timer__help__start_commands] )) ||
_wt__timer__help__start_commands() {
    local commands; commands=()
    _describe -t commands 'wt timer help start commands' commands "$@"
}
(( $+functions[_wt__timer__help__status_commands] )) ||
_wt__timer__help__status_commands() {
    local commands; commands=()
    _describe -t commands 'wt timer help status commands' commands "$@"
}
(( $+functions[_wt__timer__help__stop_commands] )) ||
_wt__timer__help__stop_commands() {
    local commands; commands=()
    _describe -t commands 'wt timer help stop commands' commands "$@"
}
(( $+functions[_wt__timer__start_commands] )) ||
_wt__timer__start_commands() {
    local commands; commands=()
    _describe -t commands 'wt timer start commands' commands "$@"
}
(( $+functions[_wt__timer__status_commands] )) ||
_wt__timer__status_commands() {
    local commands; commands=()
    _describe -t commands 'wt timer status commands' commands "$@"
}
(( $+functions[_wt__timer__stop_commands] )) ||
_wt__timer__stop_commands() {
    local commands; commands=()
    _describe -t commands 'wt timer stop commands' commands "$@"
}

if [ "$funcstack[1]" = "_wt" ]; then
    _wt "$@"
else
    compdef _wt wt
fi
