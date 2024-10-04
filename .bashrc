#
# ~/.bashrc
#

# export $(envsubst < .env)
#[[ $- == *i* ]] && source /usr/share/blesh/ble.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias cd='z'

#PS1='[\u@\h \W]\$ '

##### custom


# setup aliases
#alias cdwebsite='cd /media/furdox/linachad/data/codeflows/furdox.github.io'
alias cdcodeflows='cd /mnt/newchad/@/data/codeflows/website'
alias cdlinachad='cd /media/furdox/linachad'
alias cdnewchad='cd /mnt/newchad/@'
alias cdcodeflows='cd /mnt/newchad/@/data/codeflows'

alias editi3='nano ~/.config/i3/config'
alias editi3config='nano ~/.config/i3/config'
alias i3edit='nano ~/.config/i3/config'
alias editalias='nano ~/.bashrc'
alias editbash='nano ~/.bashrc'
alias editpicom='nano ~/.config/picom/picom.conf'

alias redshiftday='redshift -P -O 6500'
alias redshiftnormal='redshift -P -O 6500'
alias redshiftmidnight='redshift -P -O 2250'
alias redshiftset='redshift -P -O'
alias redshiftnight='redshift -P -O 4000'
alias brightness='xrandr --output DP-0 --brightness'
alias light='xrandr --output DP-0 --brightness'
alias dark='xrandr --output DP-0 --brightness 0.5'

alias start='sudo systemctl start sddm'
alias pacinstall='sudo pacman -S'
alias pacinst='sudo pacman -S'
alias pacdown='sudo pacman -S'
alias pacget='sudo pacman -S'
alias mkdsload='pactl load-module module-loopback latency_msec=5 source="alsa_input.pci-0000_00_1f.3.analog-stereo"'
alias mkdsunload='pactl unload-module module-loopback'
alias mkdsoff='pactl unload-module module-loopback'
alias mkdsoof='pactl unload-module module-loopback'
alias mkdson='pactl load-module module-loopback latency_msec=5 source="alsa_input.pci-0000_00_1f.3.analog-stereo"'
alias backmic='pactl load-module module-loopback latency_msec=5 source="alsa_input.pci-0000_00_1f.3.analog-stereo"'
alias backmicload='pactl load-module module-loopback latency_msec=5 source="alsa_input.pci-0000_00_1f.3.analog-stereo"'
alias backmicon='pactl load-module module-loopback latency_msec=5 source="alsa_input.pci-0000_00_1f.3.analog-stereo"'
alias backmicunload='pactl unload-module module-loopback'
alias backmicoff='pactl unload-module module-loopback'
alias loopbackunload='pactl unload-module module-loopback'
alias listmic='arecord -l'
alias mkgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias makegrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

alias gimp='flatpak run org.gimp.GIMP'
alias java8='/home/furdox/Téléchargements/jre1.8.0_401/bin/java'
alias startvr='~/.local/share/Steam/steamapps/common/SteamVR/bin/vrmonitor.sh'
alias java21='/usr/lib64/jvm/java-21-openjdk/bin/java'

alias sexwithhitler='echo nya~'



PROMPT_COMMAND='meow'

#PS1='\A =\u@\h= \w \$ '
#PS2='> '

################################################
# Emulate an MS-DOS prompt in your Linux shell.
# Laszlo Szathmary (jabba.laci@gmail.com), 2011
# Project home page:
# https://ubuntuincident.wordpress.com/2011/02/08/emulate-the-ms-dos-prompt/
#
#
# Modified by Soldier of Fortran
#
# Add to you ~/.bashrc file with: 'source ~/.themes/95/bashrc'
#
#function msdos_pwd
#{
#    local dir="`pwd`"
#
#    echo $dir | tr '/' '\\'
# }
#
# export PS1='UwU:`msdos_pwd` >w< $ '

echo
echo -e "\x1b[35;1mWelcome to the Terminal UwU!\x1b[0m"
#echo
#echo
# echo "Microsoft(R) Windows 95"
# echo "   (C)Copyright Microsoft Corp 1981-1996."
#echo

#meowfetch
fastfetch

PS1='\[\e[32;40;1m\]-\A-\[\e[31;40;1m\] $? \[\e[0m\e[36;40;1m\]=\[\e[35;40;1m\]\u\[\e[36;40;1m\]@\[\e[35;40;1m\]\h\[\e[36;40;1m\]= \[\e[33;40;1m\]\w \$\[\e[0m\] '











# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd -- "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
__zoxide_oldpwd="$(__zoxide_pwd)"

function __zoxide_hook() {
    \builtin local -r retval="$?"
    \builtin local pwd_tmp
    pwd_tmp="$(__zoxide_pwd)"
    if [[ ${__zoxide_oldpwd} != "${pwd_tmp}" ]]; then
        __zoxide_oldpwd="${pwd_tmp}"
        \command zoxide add -- "${__zoxide_oldpwd}"
    fi
    return "${retval}"
}

# Initialize hook.
if [[ ${PROMPT_COMMAND:=} != *'__zoxide_hook'* ]]; then
    PROMPT_COMMAND="__zoxide_hook;${PROMPT_COMMAND#;}"
fi

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

__zoxide_z_prefix='z#'

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ $# -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ $# -eq 1 && $1 == '-' ]]; then
        __zoxide_cd "${OLDPWD}"
    elif [[ $# -eq 1 && -d $1 ]]; then
        __zoxide_cd "$1"
    elif [[ ${@: -1} == "${__zoxide_z_prefix}"?* ]]; then
        # shellcheck disable=SC2124
        \builtin local result="${@: -1}"
        __zoxide_cd "${result:${#__zoxide_z_prefix}}"
    else
        \builtin local result
        # shellcheck disable=SC2312
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" &&
            __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query --interactive -- "$@")" && __zoxide_cd "${result}"
}

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

\builtin unalias z &>/dev/null || \builtin true
function z() {
    __zoxide_z "$@"
}

\builtin unalias zi &>/dev/null || \builtin true
function zi() {
    __zoxide_zi "$@"
}

# Load completions.
# - Bash 4.4+ is required to use `@Q`.
# - Completions require line editing. Since Bash supports only two modes of
#   line editing (`vim` and `emacs`), we check if either them is enabled.
# - Completions don't work on `dumb` terminals.
if [[ ${BASH_VERSINFO[0]:-0} -eq 4 && ${BASH_VERSINFO[1]:-0} -ge 4 || ${BASH_VERSINFO[0]:-0} -ge 5 ]] &&
    [[ :"${SHELLOPTS}": =~ :(vi|emacs): && ${TERM} != 'dumb' ]]; then
    # Use `printf '\e[5n'` to redraw line after fzf closes.
    \builtin bind '"\e[0n": redraw-current-line' &>/dev/null

    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        [[ ${#COMP_WORDS[@]} -eq $((COMP_CWORD + 1)) ]] || return

        # If there is only one argument, use `cd` completions.
        if [[ ${#COMP_WORDS[@]} -eq 2 ]]; then
            \builtin mapfile -t COMPREPLY < <(
                \builtin compgen -A directory -- "${COMP_WORDS[-1]}" || \builtin true
            )
        # If there is a space after the last word, use interactive selection.
        elif [[ -z ${COMP_WORDS[-1]} ]] && [[ ${COMP_WORDS[-2]} != "${__zoxide_z_prefix}"?* ]]; then
            \builtin local result
            # shellcheck disable=SC2312
            result="$(\command zoxide query --exclude "$(__zoxide_pwd)" --interactive -- "${COMP_WORDS[@]:1:${#COMP_WORDS[@]}-2}")" &&
                COMPREPLY=("${__zoxide_z_prefix}${result}/")
            \builtin printf '\e[5n'
        fi
    }

    \builtin complete -F __zoxide_z_complete -o filenames -- z
    \builtin complete -r zi &>/dev/null || \builtin true
fi

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.bashrc):
#
# eval "$(zoxide init bash)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
