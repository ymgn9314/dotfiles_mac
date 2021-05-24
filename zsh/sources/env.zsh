# pager
export PAGER=less

# language
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# history
HISTFILE=~/.zsh_history
HISTSIZE=100
SAVEHIST=100

# setopt
setopt menu_complete
setopt magic_equal_subst
setopt no_beep
setopt nolistbeep