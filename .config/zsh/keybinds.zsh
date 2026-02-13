WORDCHARS='~!#$%^&*(){}[]<>?+;'
MOTION_WORDCHARS='~!#$%^&*(){}[]<>?+;'

''{back,for}ward-word() WORDCHARS=$MOTION_WORDCHARS zle .$WIDGET
zle -N backward-word
zle -N forward-word

bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[^?' backward-kill-word
