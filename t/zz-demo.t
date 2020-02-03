
use Test;
use Test::Differences;

# These tests all fail by design. Don't run them normally.
plan :skip-all<These tests are only for Windows> unless %*ENV<RUN_DEMO>;

{
    my $got = "this is line 1\nthis is line 2\nthis is line 3\n";
    my $want = "this is line 1\nthis is line b\nthis is line 3\n";
    eq_or_diff $got, $want, 'Differences in text';
}

{
    my $got = "\tindented\n\tindented\n\tindented";
    my $want = "\tindented\nindented\n\tindented";
    eq_or_diff $got, $want, 'Differences in whitespace';
}

{
    my $got = {"ITEM" => "Dry humourless message"};
    my $want = ["ITEM", "Dry humourless message"];
    eq_or_diff $got, $want, 'differences in structure';
}

done-testing;