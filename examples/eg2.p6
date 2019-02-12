#!/usr/bin/env perl6

use lib <../lib>;
use Date::Names;

say "VERSION 1 ==================";
my %dow = %Date::Names::dow<de>;
my %mon = %Date::Names::mon<ru>;
say "German weekday names:";
for 1..7 -> $n {
    my $v = %dow{$n};
    say "  day $n: $v";
}
say "";
say "Russian month names:";
for 1..12  -> $n {
    my $v = %mon{$n};
    say "  month $n: $v";
}

say "";
say "VERSION 2 ==================";
# notice two different ways to read the hsshes:
my %dow = %($Date::Names::de::dow);
my $mon = $Date::Names::ru::mon;
say "German weekday names:";
for 1..7 -> $n {
    my $v = %dow{$n};
    say "  day $n: $v";
}
say "";
say "Russian month names:";
for 1..12  -> $n {
    my $v = $mon{$n};
    say "  month $n: $v";
}
