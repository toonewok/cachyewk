#!/usr/bin/env bash
#this is a chatgpt version cause apparently mint is....i really dont get it, something with how its expanding strings
#idk whatever
set -euo pipefail

convert_alac() {
    for f in *.m4a; do
        [[ -e "$f" ]] || return
        ffmpeg -i "$f" "${f%.m4a}.flac"
        sngcnt=$((sngcnt + 1))
        rm "$f"
    done
}

musicdir="$HOME/ssd/music"

mapfile -t m4adirs < <(
    find "$musicdir" -type f -name '*.m4a' -exec dirname {} + | sort -u
)

sngcnt=0

for dir in "${m4adirs[@]}"; do
    cd "$dir"
    convert_alac
done

echo "done.....number of tracks converted - $sngcnt"

