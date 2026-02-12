#!/usr/bin/env bash

# Name: extract_lyrics-coverart.sh
# Desc: Extracts all lyrics and cover art (MD5 perfect with SpotiFLAC)
# Usage: ./extract_lyrics-coverart.sh <directory>

DIR="${1:-}"

exiftool -b -Lyrics -w ".lrc" "$DIR/*.flac" && exiftool -b -Picture -w "%d%f_cover.jpg" "$DIR/*.flac"