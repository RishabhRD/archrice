#!/bin/bash

wmctrl -r $(wmctrl -lx | grep ffplay | grep -oE "[0-9a-z\._-]{20,25}$") -b toggle,above
