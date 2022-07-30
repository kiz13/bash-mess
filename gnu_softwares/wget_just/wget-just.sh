#!/usr/bin/env sh

# download the title page of example.com to a file named "index.html"
#wget http://www.example.com/

# download .. along with the images and style sheets needed ... and convert the URLs ...
#wget -k -p http://www.example.com/
# .
#wget -r -l 0 http://www.example.com/

# download a mirror of the errata for a book you just purchased, follow all local
# links recursively and make the files suitable for off-line viewing.

# use a random wait of up to 5 seconds between each file download and log the
# access results to myLog.log. When there is a failure, retry for up to 7 times with
# 14 secs between each retry
#wget -t 7 -w 5 --waitretry=14 --random-wait -m -k -K -e robots=off http://www.oreilly.com/catalog/upt3/errata -o ./myLog.log

#wget --cookies=on --keep-session-cookies --save-cookies=cookie.txt

#wget --tries=45 -o log http://fly.srk.fer.hr/jpg/flyweb.jpg &

wget -i less-just.sh

# ... save all the files (server directories ...) under a download/ subdirectory of the current directory
wget -p --convert-links -nH -nd -Pdownload http://www.example.com/dir/page.html

# retrieve the index.html and showing the original server headers
wget -S http://www.lycos.com/

# retrieve the first two levels ... saving them to /tmp
wget -r --level=2 -P/tmp ftp://wuarchieve.wustl.edu/

# make output documents go to stdout instead of to files
wget -O - http://jagor.srce.hr/ http://www.srce.hr/

#- `wget [option]... [URL]...`
#  - `-o (--output-file=FILE)` log messages to FILE
#  - `q`, `v`
#  - `-nd (--no-directories)` don't create directories.
#  - `-nH (--no-host-directories)` ...
#  - `-P (--directory-prefix=PREFIX)` save files to PREFIX/...
#  - `x (--force-directories)` force creation of directories.
#  - `-t (--tries=NUMBER)` set number of retries.
#  - `-w (--wait=SECONDS)` wait SECONDS between retrievals.
#  - `--waitretry=SECONDS` wait 1 to SECONDS between retries of a retrieval.
#  - `--random-wait` wait from 0 to 2*WAIT secs between retrievals.
#  - `-k (--convert-links)` make links in downloaded HTML point to local files.
#  - `-K (--backup-converted)` before converting file X, back up as X.orig.
#  - `-e (--execute=COMMAND)` execute a `.wgetrc`-style command.
#  - `-p (--page-requisites)` get all images, etc. needed to display HTML page.
#  - `-r (--recursive)` specify cursive download.
#  - `-l (--level=NUMBER)` maximum recursive depth (inf or 0 for infinite).
#  - `-N (--timestamping)` don't re-retrieve files unless newer than local.
#  - `-m (--mirror)` shortcut for `-N -r -l inf --no-remove-listing`.
#  - `-i (input-file=FILE)` download URLs found in _FILE_.
#  - `-nc (--no-clobber)` skip downloads that would download to existing files.
#  - `-O (--output-document=FILE)` write documents to _FILE_.