# *

`file -0 (--print0)` terminate filenames with ASCII NUL

## definitions

- A **shell** is simply a macro processor that executes commands. The term _macro processor_ means functionality where text and symbols are expanded to create larger expressions.

- IFS: _input field separator_ (or _internal field separator_)

- POSIX: a family of open system standards based on Unix.

- builtin: a command that is implemented internally by the shell itself.

- token: a sequence of characters considered a single unit by the shell

## basics

If a file is executable, but not an executable (binary) program, and the Shebang is present, the program specified after `#!` is started with the scriptname and all its arguments. The two characters `#` and `!` must be **the first two bytes** in the file! The shebang is for the operating system, not for the shell.

The portable form of the function definition should be used, without the `function` keyword.

It's a good idea to use redirection whenever an application needs file data and is built to read data from stdin.

Pipes are a very attractive means of post-processing application output. You should, however, be careful not to over-use pipes.

## cautions

Bash performs expansions and substitutions in a defined order:

1. Brace expansion
2. Tilde expansion
3. Parameter expansion, Arithmetic expansion, and Command substitution happen at the same time, in a left-to-right fashion on the commandline
4. Word splitting
5. Pathname expansion

- when using a negative offset, u need to separate the negative number from the colon because of the _default value_

- no spaces between the variable name and assigned value; when inside the brace expansion, no spaces allowed unless the spaces are quoted or escaped.

## links

- [gnu bash manual](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#What-is-a-shell_003f)
- alias is a [bash builtin command](http://www.gnu.org/software/bash/manual/html_node/Bash-Builtins.html), so you won't find an alias.exe anywhere in the git distribution.

- [learning center 1](https://wiki.bash-hackers.org)
- [learning center 2](http://mywiki.wooledge.org/BashGuide)

- [](https://github.com/hackjutsu/vim-cheatsheet)

### questions

- [why `/usr/bin/env`](https://stackoverflow.com/questions/10376206/what-is-the-preferred-bash-shebang/10383546#10383546): different `*nixes` put `bash` in different places, and using `/usr/bin/env` is a workaround to run the first bash found on the PATH.

- [in some environments, `sh` is `bash`. Check `sh --version`](https://stackoverflow.com/a/5725297/11844003)

- [](https://stackoverflow.com/questions/19955260/what-is-dev-null-in-bash) using `> /dev/null 2>&1` will redirect all your command output (both `stdout` and `stderr`) to `/dev/null`, meaning no outputs are printed to the terminal.

- [find-grep-&-execute](https://stackoverflow.com/questions/6078837/find-grep-and-execute-all-in-one)

- [lsof windows](https://stackoverflow.com/questions/15708/how-can-i-determine-whether-a-specific-file-is-open-in-windows)

- [say something cat](https://stackoverflow.com/questions/11710552/useless-use-of-cat)
