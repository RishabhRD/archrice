#!/bin/sh

function add {
    name=`cat $HOME/.local/share/.bookmarks | awk '{print $1}' | dmenu -l 10 -p "Add name "`
    url=`xclip -out clipboard`
    echo "$name $url" >> $HOME/.local/share/.bookmarks
}

function retrieve {
    entry=$(cat $HOME/.local/share/.bookmarks | dmenu -l 10 | awk '{print $2}')
    if [[ ! -z $entry ]]; then
	echo $entry | xsel --clipboard
    fi
}

if [[ "$1" == "add" ]]; then
    add
elif [[ $1 == "get" ]]; then
    retrieve
else
    echo "use add or get"
fi
