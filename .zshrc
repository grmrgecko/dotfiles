autoload -Uz compinit
compinit
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

export PATH="/usr/local/ubin:$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:$home/.local/bin:$PATH"
export EDITOR="vim"
export TERMINAL="konsole"
export BROWSER="firefox"
export VIDEO="mpv"
export OPENER="xdg-open"
export GOPATH="$HOME/go"

# Set emacs key binding.
bindkey -e

# Set zsh config directory.
ZSH_CONFIG="$HOME/.config/zsh"

# Import functions.
source "$ZSH_CONFIG/functions"

# Set custom key bindings.
zsh_add_config keybinds.zsh

# Load configs local to the system.
zsh_add_config local.zsh

# Configure pure-prompt.
export PURE_PROMPT_SYMBOL="$"
if [ "$USER" = "root" ]; then
  export PURE_PROMPT_SYMBOL="#"
fi
export PROMPT_PURE_SSH_CONNECTION=YES
zsh_fpath_plugin sindresorhus/pure
autoload -U promptinit; promptinit
zstyle :prompt:pure:user color cyan
zstyle :prompt:pure:host color white
zstyle ':prompt:pure:prompt:*' color white
prompt pure

# Add extra plugins.
zsh_add_plugin zdharma-continuum/fast-syntax-highlighting

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zsh_add_plugin zsh-users/zsh-autosuggestions

# Show off the system.
fastfetch
