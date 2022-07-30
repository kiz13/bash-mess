# [check](https://wiki.bash-hackers.org/syntax/pattern)

A pattern is used in:

- Pathname expansion (Globbing - matching filenames)
- Pattern matching in conditional expressions
- _Substring removal_ and _search and replace_ in Parameter Expansion
- Pattern-based branching using the case command

## normal glob characters

- `*` matches **any string**, including the null string (empty string).
- `?` matches any **single character**.
- `[...]` Defines a pattern **bracket expression**. Matches any of the enclosed characters at this position.

When a glob is used to match _filenames_, the `*` and `?` cannot match a slash (`/`). So, for instance, the glob `*/bin` might match `foo/bin` but it can't match `/usr/local/bin`. When globs match _patterns_, the `/` restriction is removed.

### bracket expr

- `[xyz]` matching either `x`, `y`, or `z`
- `[x-z]` a range expression: matching all the characters from `x` to `y`
- `[[:class:]]` matches all the characters defined by a POSIX character class:
  - `alnum` all letters and digits
  - `alpha` all letters
  - `ascii`
  - `blank` all horizontal whitespace
  - `cntrl` all control characters
  - `digit` all digits
  - `graph` all printable characters, not including space
  - `lower` all lower case letters
  - `print` all printable characters
  - `punct` all punctuation characters
  - `space` all horizontal or vertical whitespace
  - `upper` all upper case letters
  - `word`
  - `xdigit` all hexadecimal digits
- `[^...]` or `[!...]` a negating expression
- `[]...]` or `[-...]` Used to include the characters `]` and `-` into the set
- `[=C=]` matches any character that is equivalent to the collation weight of `C`
- `[[.SYMBOL.]]` matches the collating symbol `SYMBOL`

`[[.backslash.]]Hell[[.vertical-line.]]no[[.exclamation-mark.]]` matches `\Hello|world!`

## extended

If you set the [shell option](https://wiki.bash-hackers.org/internals/shell_options) `extglob`, Bash understands some powerful patterns. A `<PATTERN-LIST>` is one or more patterns, separated by the pipe-symbol (`PATTERN|PATTERN`)

- `?(<PATTERN-LIST>)` matches **zero or one** occurrence of the given patterns
- `*(<PATTERN-LIST>)` matches **zero or more**
- `+(<PATTERN-LIST>)` matches **one or more**
- `@(<PATTERN-LIST>)` matches **one** of the given patterns
- `!(<PATTERN-LIST>)` matches anything **except** one of the given patterns

`rm -rf !(survivor.txt)` Delete all but one specific file
