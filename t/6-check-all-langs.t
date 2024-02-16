use v6;
use Test;


use Date::Names;

my $debug = 0;
my $dn;

# test all langs for the '*2num' methods
# each lang is tested separately

# get list of all langs
my @langs = @Date::Names::langs;

# lower-case min abbrev test for each language
# (must be from a PR from a native language expert)
constant %min-abbrev = [
    en => {
        # 19 tests
        # expected minimum abbreviations
        dow => <m tu w th f sa su>,
        moy => <jan f mar ap may jun jul au s o n d>,
    },
];

my $ntests = @langs.elems * 19 + %min-abbrev.elems * 19;

plan $ntests + @langs.elems;

for @langs -> $L {
    $dn = Date::Names.new: :lang($L);
    my $s = $dn.ty;
    is $s, %the-year{$L};

    if %min-abbrev{$L}:exists {
        # check all months (min-abbrevs)
        for 1..12 -> $n {
            my $idx = $n-1;
            my $mon = %min-abbrev{$L}<moy>[$idx];
            is $dn.mon2num($mon, :$debug), $n, "lang: '$L', mon abbrev: '$mon', idx: $idx, n: $n";
        }
        # check all weekdays (min-abbrevs)
        for 1..7 -> $n {
            my $dow = %min-abbrev{$L}<dow>[$n-1];
            is $dn.dow2num($dow, :$debug), $n;
        }
    }

    # check all months (full names)
    for 1..12 -> $n {
        my $mon = $dn.mon($n);
        is $dn.mon2num($mon, :$debug), $n;
    }

    # check all weekdays (full names)
    for 1..7 -> $n {
        my $dow = $dn.dow($n);
        is $dn.dow2num($dow, :$debug), $n;
    }

}
