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