#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
alias ls="exa -FG --color-scale --color=always --group-directories-first"
alias ll="exa -laFG --color-scale --color=always --group-directories-first"
alias cat='bat --theme=GitHub --color=always'

PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"

alias pbcopy="xclip -sel clip"

alias cargogen="cargo generate --git https://github.com/rrybarczyk/template-rs.git"


alias qc="$HOME/development/quick-calc/target/release/qcal"
