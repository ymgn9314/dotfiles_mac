#  __  __      ___ ___       __       ___
# /\ \/\ \   /' __` __`\   /'_ `\   /' _ `\
# \ \ \_\ \  /\ \/\ \/\ \ /\ \L\ \  /\ \/\ \
#  \/`____ \ \ \_\ \_\ \_\\ \____ \ \ \_\ \_\
#   `/___/> \ \/_/\/_/\/_/ \/___L\ \ \/_/\/_/
#      /\___/                /\____/
#      \/__/                 \_/__/

# load .zsh/*zsh
ZSHHOME="${HOME}/.zsh"
if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

# autoload
autoload -U compinit && compinit -u
autoload -Uz colors && colors

# pager
export PAGER=less

# less status line
export LESS='-R -f -X -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
export LESSCHARSET='utf-8'

# language
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# setopt
setopt auto_pushd
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt correct
setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob
setopt magic_equal_subst

# zstyle
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1

# alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# M1 homebrew settings: (https://zenn.dev/ress/articles/069baf1c305523dfca3d)
typeset -U path PATH
path=(
	/opt/homebrew/bin(N-/)
	/usr/local/bin(N-/)
	$path
)

if (( $+commands[sw_vers] )) && (( $+commands[arch] )); then
	[[ -x /usr/local/bin/brew ]] && alias brew="arch -arch x86_64 /usr/local/bin/brew"
	alias x64='exec arch -x86_64 /bin/zsh'
	alias a64='exec arch -arm64e /bin/zsh'
	switch-arch() {
		if  [[ "$(uname -m)" == arm64 ]]; then
			arch=x86_64
		elif [[ "$(uname -m)" == x86_64 ]]; then
			arch=arm64e
		fi
		exec arch -arch $arch /bin/zsh
	}
fi

# zshcompile
if [ ~/.zshrc -nt ~/.zshrc.zwc -o ! -e ~/.zshrc.zwc ]; then
	echo "zcompile exec."
	zcompile ~/.zshrc
fi

# path
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:$HOME/fvm/default/bin"
## openjdk
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"
## anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - --no-rehash)"
## npm
export PATH=$PATH:`npm bin -g`