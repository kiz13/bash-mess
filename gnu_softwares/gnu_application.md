# *

## table of contents

- [overview](#misc)
  - [fundamental](#fundamental)
  - [intermediate](#intermediate)
  - [permission](#permission)
- [detail](#details)
- [built-in function](#built-in-function)

## [misc](https://dev.to/awwsmm/101-bash-commands-and-tips-for-beginners-to-experts-30je)

### fundamental

`clip`

`file * --mime-encoding` get the encoding for the files under current directory

`cd -` go back to the most recent directory (check also tilde expansion)

Normally, when u execute a long-running command, the CI will wait for that
command to finish before it allows u to enter another one. Putting `&` after a
command prevents this from happening, and lets u execute a new command while an
older one is still running: `cd where/Parser/ && mvn package & cd` ...

`head -n 3 cat.txt` outputs the first three lines (default to 10) of the file.

`touch` was created to modify file timestamp, but it can also be used to quickly
create an empty file.

When use `rm` to remove file (non-recoverable), u can add an "_are you sure_"
prompt with the `-i` flag, e.g., `rm -i it.txt`; use `-f (--force)` flat to
ignore non-existent files and arguments, never prompt.

`rmdir` removes only empty directory; remove a dir and all of its contents
with `rm -rf` (recursive and force)

copies a file: `cp it it2 && ls`

type `man` before any command to bring up a manual for that command.(**not
installed on my pc**)

By default, `mkdir` only makes a single directory, but
with `-p (--parents) A/B/C` ...

`tree` can help u better visualize a directory's structure (**not installed on my pc**) [so how to get this function](https://superuser.com/questions/531592/how-do-i-add-the-tree-command-to-git-bash-on-windows/762629#762629)

`du -h (--human-readable)` shows files space usage for a particular dir and its
sub-dir; with `-d (--max-depth=N)` print the total for a directory (or file,
with `-a / --all`)

`7z x filename.tar.gz` produces a tar file called `filename.tar` then `7z x filename.tar`

### intermediate

`printenv` shows all currently-defined env vars

To set a new environment variable, use an `=` sign (**not put any space before
or after the =**), e.g. `myvar=shit`

`echo $myvar` prints a specific env var.

variables which contain spaces or other whitespace should be surrounded by
double quotes. __N.b.__ reassigning a value to an env var overwrites it without
warning.

`unset myvar` unset an env var

**Aliases** are a way to replace long commands with shorter ones:
`ls -l -a -h -t(sorted by modification time, newest first)`

`alias lc="ls -l -a -h -t"`
remove an alias: `unalias lc`

`whereis`(**not installed on my pc**) searches for "possibly useful" files
related to a particular command. It'll attempt to return the location of the
binary (executable machine code), source (code source files) and `man` page for
that command, e.g. `whereis ls`

`which` will only return the location of the binary, e.g. `which ls`
gives `/usr/bin/ls`

`locate` finds a file anywhere on the system by referring to a
semi-regularly-updated cached list of files: **not showing anything**

`ping` attempts to open a line of communication with a network host. Mainly,
it's used to check whether or not ur Internet connection is
down: `ping google.com`

`printf` is an improved `echo`, allowing formatting and escape
sequences: `printf "1\n2\n3"`

### permission

Files may be able to be read(r), written to(w), and/or executed(x) by different
users or groups of users, or not at all. File permissions are presented by 10
characters.

take this for example:

```bash
drwxr-xr-x 1 kiz 1.3K Sep  7 9:31 cats
```

The first character represents the type of file: `d` for directory, `l` for
link, `-` for regular file

Then there are three groups of three characters which represent the permissions
held by

1. user(u) who owns the file
2. group(g) which owns the file
3. any other(o) users

The number followed is the numbers of links the file system to that file. (1
above)

The three permissions are often represented with a single three-digit number,
where:

- if `x` is enabled, the number is incremented by 1
- if `w` is enabled, the number is incremented by 2
- if `r` is enabled, the number is incremented by 4

N.b. there are equivalent to binary digits (`r-x -> 101 -> 5`), so the above
file have permission of 755.

File permission can be modified by setting the access bits:
`chmod 744 cats`; or by adding(+), removing(-) r, w, and x with flags.

## details

1. `ps [-aefls] [-u UID] [-p PID]` shows all of the user's currently-running
   processes (aka. jobs)
  - `-a (--all)` or `-e (--everyone)` show processes of all users
  - `-f (--full)` show process uids, ppids
  - `-l (--long)` show process uids, ppids, pgids, winpids
  - `-s (--summary)` show process summary
  - `-p (--process)` show information for specified PID
  - `-u (--user)` list processes owned by UID

2. `xargs [OPTION]... COMMAND [INITIAL-ARGS]...` run COMMAND with arguments
   INITIAL-ARGS and more arguments read from input.

3. `tar [OPTION...] [FILE]...`
  - `tar -cf archive.tar foo bar`  create the archive.tar from files
  - `tar -tvf archive.tar` list all files verbosely
  - `tar -xf archive.tar` extract all files

  - `-t (--list)` list the contents of an archive
  - `-x (--extract, --get)` extract files from an archive
  - `-v (--verbose)` verbosely list files processed

4. `read [-ers] [-a array] [-d delim] [-i text] [-n nchars] [-N nchars] [-p prompt] [-t timeout] [-u fd] [name ...]`
  - `-d delim` continue until the first character of DELIM is read, rather than
    newline
  - `-p prompt` output the string PROMPT without a trailing newline before
    attempting to read
  - `-N nchars` return only after reading exactly NCHARS characters, unless EOF
    is encountered or read times out, ignoring any delimiter
  - `-r` do not allow backslashes to escape any characters

5. `cut OPTION... [FILE]...` print selected parts of lines from each FILE to
   standard output. With no FILE, or when FILE is -, read standard input.
   Mandatory arguments to long options are mandatory for short options too.
  - `-d` (--delimiter=DELIM) use DELIM instead of TAB for field delimiter
  - `-f` (--fields=LIST) select only these fields; it takes 1-based indices

6. `ls`
  - `-a (-all)` show hidden ("dot") files, it also shows a reference to the
    current directory as `.` and a reference to its parent directory as `..`
  - `--color[=WHEN]` colorize the output; WHEN can be 'always' (default if
    omitted, 'auto', or 'never'

7. `mv [option]... source... directory`
  - `mv [option]... [-T] source dest`: `-T` stands for 'no target directory',
    treat _dest_ as a normal file
  - `mv [option]... -t dir source...`: `-t` means 'target-directory=dir', move
    all source args into dir
  - move a file to a "new file" (rename it) `mv a a2 && ls`
  - `--backup[=CONTROL]`

8. `wc` (word count) returns the number of lines, words, bytes in a
   file. `-l(lines)`, `-m (--chars)`, `-w (--words)`, `-c (--bytes)`

9. `sed`

  - `-n (--quite, --silent)` suppress automatic printing of pattern
    space [check what it really means](https://superuser.com/questions/852404/what-does-n-option-in-sed-do)
  - `-E (-r, --regexp-extended)` enable Extended Regular Expression syntax. With
    basic (BRE) syntax, these<sup>?</sup> characters do not have special meaning
    unless prefixed with a backslash (``\ ``); While with extended (ERE) syntax
    it is reversed: these characters are special unless they are prefixed with
    backslash (`` \ ``)(https://www.wikiwand.com/en/Auk).

### built-in function

- `gensub(regexp, replacement, how [, target])`

  Search the target string _target_ for matches of the regular expression _
  regexp_. If _how_ is a string beginning with ‘`g`’ or ‘`G`’ (short for
  “global”), then replace all matches of regexp with replacement. Otherwise,
  treat _how_ as a number indicating which match of regexp to replace. Treat
  numeric values less than one as if they were one. If no target is supplied,
  use `$0`. Return the modified string as the result of the function. The
  original target string is not changed.

- [AWK](https://www.wikiwand.com/en/AWK) is a _DSL_ designed for text processing
  and typically used as a data extraction and reporting tool.

  The AWK language is a _data-driven scripting language_ consisting of a set of
  actions to be taken against streams of textual data

  AWK was created at [Bell Labs](https://www.wikiwand.com/en/Bell_Labs) in the
  1970s, and its name is derived from the surnames (family name or last name) of
  its authors: Alfred Aho, Peter Weinberger, and Brian Kernighan. The acronym is
  pronounced the same as the bird [auk]

- **less** is a [terminal pager](https://www.wikiwand.com/en/Terminal_pager)
  program on Unix, Windows, and Unix-like systems used to view (but not change)
  the contents of a text file one screen at a time. It is similar
  to [`more`](https://www.wikiwand.com/en/More_(command)), but has the extended
  capability of allowing both forward and backward navigation through the file.
  Unlike most Unix text editors/viewers, `less` does not need to read the entire
  file before starting, resulting in faster load times with large files.

  The name came from the joke of doing "backwards more."

- GNU [Wget](https://www.wikiwand.com/en/Wget) is a computer program that
  retrieves content from web servers. Its name derives from _World Wide Web_
  and _get_. It supports downloading via _HTTP_, _HTTPS_, and _FTP_.

- `grep` comes from the [ed](https://www.wikiwand.com/en/Ed_(text_editor))
  command `g/re/p` (_globally search for a regular expression and print matching
  lines_)

- `cat` is an application that reads the contents of all the files you pass it
  as arguments. It then writes each file one after another on `stdout`. In
  essence, it concatenates the contents of all the files you pass it as
  arguments.

  When using `cat` without passing any arguments, `cat` will just read
  from `stdin`. You can press _Ctrl+D_ to send your terminal the _End of File_
  character. That'll cause `cat` to think `stdin` has closed.

  Useless use of `cat` will result in an extra process to create, and using a
  pipe instead of a redirection takes away an application's ability to skip back
  and forth inside the input file.
