# [test and conditional](http://mywiki.wooledge.org/BashGuide/TestsAndConditionals)

The `!` in front of a command causes Bash to _negate_ the command's exit status.

command grouping can be used for more things than just _conditional operators_. We can redirect input to a group of statements:

```bash
{
  read firstLine
  read secondLine
  while read otherLine; do
    something
  done
} < file
```

One of the features of `[[` is pattern matching.

## ops

- Tests supported by [ (also known as test) and [[:

  - `-f` FILE: True if file exists.
  - `-d` FILE: True if file is a directory.
  - `-h` FILE: True if file is a symbolic link.
  - `-p` PIPE: True if pipe exists.
  - `-r` FILE: True if file is readable by you.
  - `-s` FILE: True if file exists and is not empty.
  - `-t` FD : True if FD is opened on a terminal.
  - `-w` FILE: True if the file is writable by you.
  - `-x` FILE: True if the file is executable by you.
  - `-O` FILE: True if the file is effectively owned by you.
  - `-G` FILE: True if the file is effectively owned by your group.
  - FILE `-nt` FILE: True if the first file is newer than the second.
  - FILE `-ot` FILE: True if the first file is older than the second.
  - `-z` STRING: True if the string is empty (it's length is zero).
  - `-n` STRING: True if the string is not empty (it's length is not zero).
  - String operators:
    - STRING `=` STRING: True if the first string is identical to the second.
    - STRING `!=` STRING: True if the first string is not identical to the second.
    - STRING `<` STRING: True if the first string sorts before the second.
    - STRING `>` STRING: True if the first string sorts after the second.
    - `!` EXPR: Inverts the result of the expression (logical NOT).
  -Numeric operators:
    - INT `-eq` INT: True if both integers are identical.
    - INT `-ne` INT: True if the integers are not identical.
    - INT `-lt` INT: True if the first integer is less than the second.
    - INT `-gt` INT: True if the first integer is greater than the second.
    - INT `-le` INT: True if the first integer is less than or equal to the second.
    - INT `-ge` INT: True if the first integer is greater than or equal to the second.
  - Additional tests supported only by [[:
    - STRING `=` (or `==`) PATTERN: Not string comparison like with [ (or test), but pattern matching is performed. True if the string matches the glob pattern.
    - STRING `!=` PATTERN: Not string comparison like with [ (or test), but pattern matching is performed. True if the string does not match the glob pattern.
    - STRING `=~` REGEX: True if the string matches the regex pattern.
    - ( EXPR ): Parentheses can be used to change the evaluation precedence.
    - EXPR `&&` EXPR: Much like the '-a' operator of test, but does not evaluate the second expression if the first already turns out to be false.
    - EXPR `||` EXPR: Much like the '-o' operator of test, but does not evaluate the second expression if the first already turns out to be true.
  - Tests exclusive to [ (and test):
    - EXPR `-a` EXPR: True if both expressions are true (logical AND).
    - EXPR `-o` EXPR: True if either expression is true (logical OR).
