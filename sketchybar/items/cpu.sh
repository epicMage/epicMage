#!/bin/bash

sketchybar --add item cpu right \
           --set cpu  update_freq=2 \
                      icon=􀧓  \
                      --set '/./' icon.color=0xffa6e3a1 \
                      script="$PLUGIN_DIR/cpu.sh"
