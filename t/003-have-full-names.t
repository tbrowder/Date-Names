use v6;
use Test;


use Date::Names;

# all langs must have mon and dow values
my @langs = @Date::Names::langs;

# 19 tests per language
my $ntests = @langs.elems * 19;
plan $ntests;

for 1..12 -> $mon {
    for @langs -> $L {
        my $val = $::("Date::Names::{$L}::mon")[$mon-1];
        ok $::("Date::Names::{$L}::mon")[$mon-1], "lang $L; array mon, month $mon, val $val";
    }
}

for 1..7 -> $day {
    for @langs -> $L {
        my $val = $::("Date::Names::{$L}::dow")[$day-1];
        ok $::("Date::Names::{$L}::dow")[$day-1], "lang $L; array dow, day $day, val $val";
    }
}
