#!/bin/bash

WORK_DIR="$HOME/myfolder"

if [ ! -d "$WORK_DIR" ]; then
  echo "Stop working: Not found $WORK_DIR ."
  exit 1
else
  cd "$WORK_DIR"

  initial_count=$(find . -maxdepth 1 -type f | wc -l)
  echo "Count file in folder: $initial_count"
  
  for file in *; do
	if [ "$(stat -c %a "$file")" = "777" ]; then
	chmod 664 "$file"
	echo "  -> Change chmod to 664"
	fi

	if [ ! -s "$file" ]; then
	rm "$file"
	echo "  -> Delete file"
	continue
	fi

	sed -i '1!d' "$file"
	echo "  -> Delete second string"
  done

fi