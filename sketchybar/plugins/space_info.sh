#!/bin/bash

ACTIVE_SPACE=$(echo $INFO | jq -r '.["display-1"]')
ALL_SPACES=$(/opt/homebrew/bin/yabai -m query --spaces | jq -r '.[] | .index' | tr '\n' ' ')
ALL_SPACES=($ALL_SPACES)

if [ "${#ALL_SPACES[@]}" -eq 1 ]; then
  exit
fi

if [[ "$ACTIVE_SPACE" == "" ]]; then
  ACTIVE_SPACE=$(/opt/homebrew/bin/yabai -m query --spaces --space | jq '.index')
fi

LABEL=()

for i in "${ALL_SPACES[@]}"
do
  if [ "$i" = "$ACTIVE_SPACE" ]; then
    LABEL+=(">$i<")
  else
    LABEL+=("$i")
  fi
done

LABEL=$(echo "${LABEL[*]}")

sketchybar -m --set space_info label="$LABEL"
