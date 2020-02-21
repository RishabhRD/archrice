#!/bin/sh

arg="$1"
mod=$(echo $arg | grep -o -- "[+-]" | wc -w)
if [ "$mod" -gt 1 ]; then
    arg=$(echo $arg | cut -b 1)
elif [ "$mod" -lt 1 ]; then
    mod=1
fi

set_opacity(){
    [ -n "$opacity" ] || opacity=$max
    case "$arg" in
        +|=) opacity=$(($opacity + ($change * $mod)))
            ;;
        -|_) opacity=$(($opacity - ($change * $mod)))
            ;;
        *) { echo "Usage: $(basename $0) [+|-]"; exit 1; }
            ;;
    esac
    # sanity check
    [ "$opacity" -lt "$max" ] || opacity=$max
    [ "$opacity" -gt "$min" ] || opacity=$min
}

# any term as long as compsite manager is running
# this version can be mapped to a key via xbindkeys
x_prop(){
    windowid=$(xdotool getwindowfocus)
    # 0xffffffff (4294967295) - completely opaque
    # 0x00000000 (0) - invisible
    change=268435456
    min=1073741824
    max=4294967295

    opacity=$(xprop -id $windowid | grep _NET_WM_WINDOW_OPACITY \
        | cut -d= -f2 | tr -d ' ')
    set_opacity

    xprop -f _NET_WM_WINDOW_OPACITY 32c \
        -set _NET_WM_WINDOW_OPACITY $opacity \
        -id $windowid
}

# urxvt argb support
# like this better as it only sets alpha on background, not text
argb(){
    change=10
    min=10
    max=100

    opacity=$(xprop -id $WINDOWID | grep _TERM_BG_OPACITY \
        | cut -d= -f2 | tr -d ' ')
    set_opacity

    # store current opacity as x-win property
    xprop -f _TERM_BG_OPACITY 8i -set _TERM_BG_OPACITY $opacity -id $WINDOWID
    # match up with BG macro in ~/.Xresources
    xtermset -bg "[$opacity]#303030"
}

if [ -t 0 ]; then
    argb
else
    x_prop
fi
