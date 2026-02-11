# How to Bulk Download Your Spotify Playlists for FREE in Ultra HQ (2026 Beginner's Guide)

This guide will explain to you how to bulk download your Spotify playlists in 256kbps OPUS for the highest quality, properly tagged files! I have attached my GitHub repository containing my spotDL configuration file and scripts. I will first go over how to download your songs both **WITH** and **WITHOUT** a YouTube Premium subscription. Unfortunately, the highest quality non-premium format is currently 251, which is ~128kbps OPUS. Following these same steps, I have successfully downloaded over 5,000 songs from YouTube Music, tagged with Spotify's metadata. It's the most beautiful thing to come out of modern day indie development.

Take back control of your music and consolidate it all in one place with files you OWN. I encourage people to call out any mistakes made in this guide, as well as contribute their knowdlege, if desired. No streaming services, no paid subscriptions, no fake "offline" play, just your music and your ears. This is as close to lossless quality as you'll get besides ripping/torrenting the actual CD FLAC's. All with the ease and automation of typing a single command!

I have left quite a bit out of this guide and its rudementary at best, but it should provide a sufficient starting point for most people. I will update when I have more time.

## Prerequisites

### Requirements

- Spotify Developer App *REQUIRED as of a few weeks ago*
- spotify-downloader
- yt-dlp
- Python 3.11 (*tested with Python 3.11.7*)
- Browser extension that exports cookies in Netscape format
- Config file and scripts from [my Github repo](https://github.com/Ahrimdon/spotify-scripts)
- Patience

### Recommended

- FFmpeg *OPTIONAL BUT RECOMMENDED*
- mediainfo *OPTIONAL BUT RECOMMENDED*
- Tagging Software (MP3Tag, PuddleTag) *OPTIONAL BUT RECOMMENDED*

### Optional Advanced Tools (Powerful Tools for Searching/Filtering Text)

(*With my over 5,000 downloaded songs, these tools save me days of time when manipulating my library*)

- ripgrep
- find
- sed

#### Configuring Your Spotify Developer App

1. Login to developer.spotify.com
2. Create a developer application (create app functionality has been disabled due to the Anna's Archive indcident, this only works if you previously had created one)
3. Ensure the app is in development mode
4. Paste the values below into their respective fields:
5. Write down your Client ID and Client Secret, you will need them for the next step

``` plaintext
App Name: SpotDL
App Description: Spotify Downloader
Redirect URI(s): http://127.0.0.1:9900/
```

## Download Standard Quality With a *FREE* Account

1. Create a Spotify playlist with all of the songs you want to download
   - [Note]: I found it easiest to create a Windows virtual machine and install the Spotify app on there to use to `Shift + Click` functionality. This way, you can add all of the songs you want to download to a playlist in a single click.

2. Install Python 3.11 and ensure 'Add to PATH' is checked
3. Open a PowerShell or Bash terminal and `cd` into the directory you wish to download the songs to
4. Create a Python virtual environment and activate it
    - Linux: `python3 -m venv .venv && source .venv/bin/activate`
    - Windows: `python -m venv .venv && .venv\Scripts\Activate.ps1`
5. Install 'spotify-downloader' and 'yt-dlp' `pip install spotdl yt-dlp`
6. Download the `config.json` file below and place it in the following directory:
    - Linux: `~/.config/spotdl`
    - Windows: `C:\Users\<YourUsername>\.spotdl`
7. Change the paths in `config.json` to reflect your environment and username
8. Paste your ClientID and Client Secret into the values for the `client_id` and `client_secret` keys, respectively
9. Login to YouTube Music and export your browser cookies to the following directory:
    - Linux: `~/.config/spotdl/cookies.txt`
    - Windows: `C:\Users\<YourUsername>\.spotdl\cookies.txt`
10. Paste the playlist URL into the quotes for the `URL` inside of `download-spotify-free.sh` and remove the tracking URL parameters (e.g. `URL="https://open.spotify.com/playlist/playlist_id"`)
11. Run the script
    - Linux: `chmod +x download-spotify-free.sh && ./download-spotify-free.sh`
    - Windows: `.\download-spotify-free.ps1`
12. Wait for everything to download :)

## Download High Quality Audio With a *PREMIUM* Account

#### Requirements

- YT Premium (Free Trial Works)

1. Perform steps 1-8 above
2. Paste the playlist URL into the quotes for the `URL` inside of `download-spotify-premium.sh` and remove the tracking URL parameters (e.g. `URL="https://open.spotify.com/playlist/playlist_id"`)
3. Open up your browser and go to music.youtube.com
4. Press `F12` to open up the developer console and go to the *Network* tab
5. Refresh the page and you should see the network tab become flooded with requests
6. Find the request starting with *videoplayback* --> right click & copy value --> paste value into a text editor
7. Look for a parameter labeled `pot=`
8. Copy the value starting from after the `=` sign and up until the first `&`.
9. It should look like `MlkGDKAH5gulXgZOLYwWr-f50R5ppJVtAIOZ-B85-okRBghbmJDh9lJsOUxeGJGynnjcJ6Sf5lM-1IRmQ1qpcKii3BUI5OQALZZ961NhGue1QC-xos_EwfKvxK==`
10. Paste that PO Token into the quotes for the `TOKEN` variable inside of `download-spotify-premium.sh`
11. Run the script
    - Linux: `chmod +x download-spotify-premium.sh && ./download-spotify-premium.sh`
    - Windows: `.\download-spotify-premium.ps1`
12. Verify a song downloaded in format 771 (256k OPUS): `mediainfo --Full song.opus | rg -ie "bit rate.*|bitrate.*`
13. If done correctly, you should get an output similar to this:

``` bash
Overall bit rate                         : 293997
Overall bit rate                         : 294 kb/s
```

## Download SoundCloud Songs

TODO

## Download SoundCloud Songs w/ Spotify Metadata

TODO

## Tagging

TODO

## Reencoding for Apple Music/MP3 Player Compatability

TODO

## Best Audio Codecs & Containers to Use

TODO

## Transferring to VLC on Android/Apple Devices

TODO

## Resources

### Windows / Linux / Mac

[Python 3.11](https://www.python.org/downloads/)

[Spotify Developer Dashboard](https://developer.spotify.com/)

[Spotify Downloader](https://github.com/spotDL/spotify-downloader)

Basically a front end for yt-dlp. Downloads Spotify equivalents from YouTube music and embeds the resulting files with their respective Spotify metadata.

[yt-dlp](https://github.com/yt-dlp/yt-dlp)

EXTREMELY powerful and customizable YouTube downloader

[FFmpeg](https://github.com/BtbN/FFmpeg-Builds/releases/latest)

One of, if not the most powerful media manipulation tools in the modern age.

[MediaInfo](https://mediaarea.net/en/MediaInfo/Download)

GUI/CLI tool that prints a detailed synopsis of all media properties

[LosslessCut](https://github.com/mifi/lossless-cut/releases/latest)

GUI wrapper for ffmpeg - lossless media manipulation, remuxing, etc.

[VLC Media Player](https://www.videolan.org/vlc/#download)

Open-source, cross-platform media player that support virtually any media you throw at it. Most popular player in the media enthusiast space.

[MPV](https://mpv.io/installation/) *My Personal Favorite*

Extremely lightweight, open-source, cross-platform scriptable media player. Most popular among advanced users who want total control over every aspect of playback.

### Windows ONLY

[Mp3tag](https://www.mp3tag.de/en/download.html)

Tag editor for Windows. Pales in comparison to PuddleTag.

### Linux ONLY

[PuddleTag](https://github.com/puddletag/puddletag/releases/latest)

Extremely powerful tag editor for Linux

PuddleTag is FAR superior and does everything Mp3Tag does, but better, and with far more features. Did I mention it's also open source? I will never use Mp3Tag again after being converted to the Church of the Puddle. With that being said, for those who are used to Windows and don't want anything to do with Linux, Mp3Tag is a viable alternative.

Guides

[Obtaining YouTube PO Token for 256k audio](https://github.com/yt-dlp/yt-dlp/wiki/PO-Token-Guide)

Welcome to the club my friend. You trade modern day "convenience" for autonomy and privacy. It will be worth it in the end. No more selling your soul and being told what you can and can't do or listen to by corporate overlords. I am reminded constantly how "worth it" putting in the effort is whenever I go to download more music and half of my favorite songs have disappeared off the face of the earth for a multitude of reasons — DMCA, Artist, Platform Licensing revocation, you name it.

====================
First of all if you're going to add your songs to Apple Music, they need to be in the encoded in MP3 in an MP3 container, or AAC/ALAC in an M4A container. I personally would use anything BUT MP3 as it's quite outdated and inferior on nearly every way (quality, compression, etc.) when compared to any contemporary audio codec. The only exception would be compatibility for early 2000's MP3 players.

NOTE: When reencoding OPUS/MP3 to AAC, there will be a negligable decrease in quality, which is, imperceptible to the non-audiophile if done correctly, but still a decrease nonetheless. You would be going from 1 lossy codec to another lossy codec for compatibility with Apple. See my notes on ALAC below if you want to retain 100% quality when reencoding from MP3.

You can download Music from YouTube Music using yt-dlp. You can also download all of your Spotify songs with SpotDL, which downloads the songs from YouTube Music, but embeds all of the respective lyrics and metadata into the file so it's essentially 1:1 with Spotify. Then you can use MP3Tag or PuddleTag (links below), to bulk tag your songs and create a M3U8 playlist. From there you can directly import the playlist into iTunes and then drag it onto your phone, which will transfer all of the music and the playlist.

If you REALLY don't want to download the songs in better quality and are determined to stick with your MP3's, then you will most likely have to reencode to AAC. This can be done simply using FFmpeg.

The command to reencode into 320kbps AAC in the M4A container while preserving metadata, album covers, dates, etc. would be:

ffmpeg -i song.mp3 -map 0 -map_metadata 0 -c:a aac -b:a 320k output.m4a

If you want to reencode losslessly, then remove -b:a 320k and change -c:a aac to -c:a alac (note the file size for each song will be about 3-4x larger than AAC)
====================