#  __  __      ___ ___       __       ___
# /\ \/\ \   /' __` __`\   /'_ `\   /' _ `\
# \ \ \_\ \  /\ \/\ \/\ \ /\ \L\ \  /\ \/\ \
#  \/`____ \ \ \_\ \_\ \_\\ \____ \ \ \_\ \_\
#   `/___/> \ \/_/\/_/\/_/ \/___L\ \ \/_/\/_/
#      /\___/                /\____/
#      \/__/                 \_/__/


# p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit
source "$HOME/.zinit/bin/zinit.zsh"

# auto-complete
autoload -Uz compinit
if [ $(date +'%j') != $(date -r ${ZDOTDIR:-$HOME}/.zcompdump +'%j') ]; then
  compinit;
else
  compinit -C;
fi

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1

# source zsh files
for file in $HOME/.dotfiles/zsh/sources/*.zsh; do
  source $file
done

# zcompile
[[ ! -f ~/.zshrc.zwc || ~/.zshrc -nt ~/.zshrc.zwc ]] && zcompile ~/.zshrc

# p10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh