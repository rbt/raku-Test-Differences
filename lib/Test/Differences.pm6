use v6.d;

unit module Test::Differences;

use Test;

use Text::Diff;
use Data::Dump;

sub eq_or_diff ($got-structure, $want-structure, $reason, :$output-style = 'Table', Int :$context-lines = 5, :$dump-overrides = {}) is export {
    my $got-dump = $got-structure;
    $got-dump = dump($got-structure, $dump-overrides) if $got-structure !~~ Str;

    my $want-dump = $want-structure;
    $want-dump = dump($want-structure, $dump-overrides) if $want-structure !~~ Str;

    my $diff = diff $got-dump, $want-dump, :$context-lines, :$output-style,
            filename-a => 'Got', filename-b => 'Expected';

    ok $diff.chars == 0, $reason
            or diag $diff;
}

sub dump($structure, $overrides --> Str) {
    return Dump($structure, :$overrides, :color(False), :no-postfix(True));
}
