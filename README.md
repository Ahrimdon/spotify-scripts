# ***Updated 2026-02-12T23:46:37Z***

# **IMPORTANT:** ***Just found out about SpotiFLAC. Use that if you have the storage. It will get most of your library. However this guide is still useful as some music videos and verified songs only found on YouTube are available in 771. Use this to fill in the rest of your library***

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

- FFmpeg (*OPTIONAL, BUT RECOMMENDED*)
- mediainfo (*OPTIONAL, BUT RECOMMENDED*)
- Tagging Software (*OPTIONAL, BUT RECOMMENDED*)
    - MP3Tag
    - PuddleTag)

### Optional Advanced Tools (Powerful Tools for Searching/Filtering Text)

(*With my over 5,000 downloaded songs, these tools save me days of time when manipulating my library*)

- diff + Exportify (#1) 
> *This simple kept me from loosing it when curating playlists/adding deluxe album versions/removing clean versions, etc. Ctrl + A doesn't add all songs sometimes, half of the songs I added a decade ago just gone because the artist reuploaded, the same version of both songs in my library but the one I have can't be found, and both are deleted with I remove the old. This is a MASSIVE TIMESAVER!!*

- ripgrep (grep on steroids, extremely fast and refined file searching)
- find (extremely useful for locating and creating taylored file lists) (*controversial Rust version available* - faster I.M.O, YMMV)
- sed (useful in edge cases) (*controversial Rust version available* - faster I.M.O, YMMV)
- rename (this can be done in puddletag, but still useful in some edge cases) (e.g. `rename 's/^[0-9]{4}\s+//' *` results in `1234 Artist - Song.flac --> Artist - Song.flac`
- exiftool (e.g. `exiftool -b -Lyrics -w .lrc *.flac && exiftool -b -Picture -w %d%f_cover.jpg *.flac`)
- oxipng (for storage space) (e.g. `oxipng -o6 -v --strip all *.png`)
- prettier (formatting JSON info files) (e.g. `prettier --write *`
- flac (binary) (test the integrity of your files) (e.g. `flac --test *.flac`)

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
12. Verify a song downloaded in format 771 (256k OPUS): `mediainfo --Full song.opus | rg -ie "bit rate.**`
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
