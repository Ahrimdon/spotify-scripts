#!/usr/bin/env pwsh

$URL = "https://open.spotify.com/playlist/3V3wMrBCUubtcmsAKPoWjN"

spotdl --config `
  --yt-dlp-args "--format '(bestaudio[acodec=opus]/bestaudio)/best' --compat-options `"allow-unsafe-ext`" --concurrent-fragments 8 --mtime --write-thumbnail --convert-thumbnail `"png`" --write-description --write-info-json --js-runtimes `"node:C:/Program Files/nodejs/node.exe`" --remote-components ejs:github --cookies `"C:/Users/user/.spotdl/cookies.txt`"" `
  download $URL
