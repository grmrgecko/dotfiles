# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install

export PATH="/usr/local/ubin:$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:$HOME/anaconda3/bin:$PATH:/usr/local/cuda/bin"
export EDITOR="vim"

ZSH_CONFIG="$HOME/.config/zsh"
source "$ZSH_CONFIG/functions"

zsh_add_config keybinds.zsh

PURE_PROMPT_SYMBOL="$"
if [ "$USER" = "root" ]; then
  PURE_PROMPT_SYMBOL="#"
fi
PROMPT_PURE_SSH_CONNECTION=YES
zsh_fpath_plugin sindresorhus/pure
autoload -U promptinit; promptinit
zstyle :prompt:pure:user color cyan
zstyle :prompt:pure:host color white
zstyle ':prompt:pure:prompt:*' color white
prompt pure

zsh_add_plugin zsh-users/zsh-syntax-highlighting

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zsh_add_plugin zsh-users/zsh-autosuggestions

fastfetch
