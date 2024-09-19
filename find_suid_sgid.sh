#!/bin/bash

if [ $(id -u) -ne 0 ]; then
  echo "Error: The script must be run as root."
  exit 1
fi

if [ -z "$1" ]; then
  read -p "Enter a file name to save the results: " OUTPUT_FILE
else
  OUTPUT_FILE="$1"
fi

echo "$(date)" > "$OUTPUT_FILE"

find / -perm /u+s -o -perm /g+s -type f -exec shasum -a 256 {} \; | while read SHA256 FILE; do
  PERMISSIONS=$(ls -l "$FILE" | cut -d' ' -f1)
  if [[ $PERMISSIONS =~ ^-rws ]]; then
    BITS="u"
  elif [[ $PERMISSIONS =~ ^-[a-zA-Z0-9]{3,}r-s ]]; then
    BITS="d"
  elif [[ $PERMISSIONS =~ ^-rwsr-s ]]; then
    BITS="ud"
  fi

  printf "%-50s %-64s %s\n" "$FILE" "$SHA256" "$BITS" >> "$OUTPUT_FILE"
done

echo "The search is completed. The results are saved in a file $OUTPUT_FILE."
