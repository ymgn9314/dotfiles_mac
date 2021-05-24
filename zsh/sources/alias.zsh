alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# zsh speed check
alias speed_check='time ( zsh -i -c exit )'
alias speed_check_10='for i in $(seq 1 10); do time zsh -i -c exit; done'