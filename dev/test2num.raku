#!/usr/bin/env raku

use Abbreviations;

my $m = <January February March April may june july august september october november december>;
my $d = <sunday monday tuesday wednesday thursday friday saturday>;

mon2num 1, :debug;

sub mon2num($s, :$debug) {
    # get a hash of the abbreviations of the list of months (lower-cased)
    my %w = abbrevs $m;
    if $debug {
        note %w.lc.raku
    }

    # create a new hash keyed by month number
    # invert that hash so each unique abbrev points to the month number
    # if the input is not a key, return zero

    =begin comment
    for $m.kv -> $i, $v {
        note "DEBUG: month {$i + 1} is {$v}";
    }
    =end comment

}

sub dow2num($s, :$debug) {
}
