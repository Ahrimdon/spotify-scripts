#!/usr/bin/env bash

URL="https://open.spotify.com/playlist/3V3wMrBCUubtcmsAKPoWjN"
TOKEN="PASTE_PO_TOKEN_HERE"

spotdl --config --yt-dlp-args "--format '(bestaudio[acodec=opus]/bestaudio)/best' --compat-options \"allow-unsafe-ext\" --concurrent-fragments 8 --mtime --write-thumbnail --convert-thumbnail \"png\" --write-description --write-info-json --js-runtimes \"node:/usr/bin/node\" --remote-components ejs:github --cookies \"~/.config/spotdl/cookies.txt\" --extractor-args \"youtube:po_token=web_music.gvs+$TOKEN\"" download $URL
