# Name: extract_lyrics-coverart.ps1
# Desc: Extracts all lyrics and cover art (MD5 perfect with SpotiFLAC)
# Usage: .\extract_lyrics-coverart.ps1 <directory>

param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$Dir
)

exiftool -b -Lyrics -w ".lrc" "$Dir/*.flac" && exiftool -b -Picture -w "%d%f_cover.jpg" "$Dir/*.flac"