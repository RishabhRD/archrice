#!/bin/sh
man -k . | rdlmenu | awk '{print $1}' | xargs -r man -Tpdf | zathura -
