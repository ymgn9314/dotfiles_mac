alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# zsh check launch speed
alias check_speed='time ( zsh -i -c exit )'
alias check_speed_10='for i in $(seq 1 10); do time zsh -i -c exit; done'

# use port check
alias check_port_8080='sudo lsof -t -i:8080'
