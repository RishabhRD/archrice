#!/bin/sh
kitty +kitten icat --clear  --transfer-mode file --silent
icat="kitty +kitten icat --place 30x30@40x0 --transfer-mode file --silent"
case "$1" in
    *.jpg) $icat "$1";;
    *.png) $icat "$1";;
    *.gif) $icat "$1";;
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.7z) 7z l "$1";;
    *.pdf) pdftotext "$1" -;;
    *) highlight -O ansi "$1" || cat "$1";;
esac
