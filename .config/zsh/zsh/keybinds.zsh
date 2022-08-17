WORDCHARS='~!#$%^&*(){}[]<>?.+;-'
MOTION_WORDCHARS='~!#$%^&*(){}[]<>?.+;-/'

''{back,for}ward-word() WORDCHARS=$MOTION_WORDCHARS zle .$WIDGET

bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word
bindkey '^[^?' backward-kill-word
