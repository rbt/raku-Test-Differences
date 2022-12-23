# Test::Differences
Test complex data structures and output the differences between them in
diagnostics. This is helpful for spotting minor changes over a large dataset.

## SYNOPSIS

```raku
   use Test;
   use Test::Differences;

   eq_or_diff $got,  "a\nb\nc\n",   "testing strings";
   eq_or_diff @got, [{foo => <a b c>}, 1, Nil], "testing complex structure";
```

## DESCRIPTION

When the code you're testing returns multiple lines, records or data
structures and they're just plain wrong, an equivalent to the Unix
C<diff> utility may be just what's needed.  Here's output from an
example test script that checks two text documents and then two
(trivial) data structures:

```
# Failed test 'Differences in text'
# +---+----------------+----------------+
# | Ln|Got             |Expected        |
# +---+----------------+----------------+
# |  0|this is line 1  |this is line 1  |
# *  1|this is line 2  |this is line b  *
# |  2|this is line 3  |this is line 3  |
# +---+----------------+----------------+
not ok 1 - Differences in text
# 
# Failed test 'Differences in whitespace'
# +---+--------------+--------------+
# | Ln|Got           |Expected      |
# +---+--------------+--------------+
# |  0|    indented  |    indented  |
# *  1|indented      |indented      *
# |  2|    indented  |    indented  |
# +---+--------------+--------------+
not ok 2 - Differences in whitespace
# 
# Failed test 'Differences in structure'
# +---+-----------------------------------+---+---------------------------+
# | Ln|Got                                | Ln|Expected                   |
# +---+-----------------------------------+---+---------------------------+
# *  0|{                                  *  0|[                          *
# *  1|ITEM => "Dry humourless message",  *  1|"ITEM",                    *
# *  2|}                                  *  2|"Dry humourless message",  *
# |   |                                   *  3|]                          *
# +---+-----------------------------------+---+---------------------------+
not ok 3 - Differences in structure
# 
# You failed 3 tests of 3
```

eq_or_diff() compares two strings or (limited) data structures and
either emits an ok indication or a side-by-side diff.  Test::Differences
is designed to be used with Test.

### eq-or-diff

```raku
eq_or_diff $got, $want, $test-title, OutputStyle :output-style = Table, :context-lines = 5, :dump-overrides => {};
```

 * `output-style` may be any OutputStyle supported by [Text::Diff](https://github.com/rbt/raku-Text-Diff).
 * `context-lines` is the number of lines above/below within the formatted output around
   the change to present.
 * `dump-overrides` is a set of overrides to default [Data::Dump](https://github.com/tony-o/perl6-data-dump)
   styling.

## COPYRIGHT
Copyright Barrie Slaymaker, Curtis "Ovid" Poe, and David Cantrell.

Ported, with non-trivial restructuring, to Raku by Rod Taylor.

## LICENSE

You can use and distribute this module under the terms of the The Artistic License 2.0. See the LICENSE file included in this distribution for complete details.
