#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

PS1='[\u@\h \W]\$ '

##### custom


# setup aliases
alias cdwebsite='cd /media/furdox/linachad/data/codeflows/furdox.github.io'
alias cdlinachad='cd /media/furdox/linachad'

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

alias pacinstall='sudo pacman -S'
alias pacinst='sudo pacman -S'
alias pacdown='sudo pacman -S'
alias pacget='sudo pacman -S'

alias gimp='flatpak run org.gimp.GIMP'

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

function msdos_pwd
{
    local dir="`pwd`"

    echo $dir | tr '/' '\\'
}

export PS1='C:`msdos_pwd`> '

echo 
echo "Microsoft(R) Windows 95"
echo "   (C)Copyright Microsoft Corp 1981-1996."
echo

