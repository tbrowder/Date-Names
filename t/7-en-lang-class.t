use Test;

# Language 'en' class
plan 95;

my $lang = 'en';

use Date::Names;

my $dn; # holds the class objects

# these data are auto-generated:
# non-empty data set arrays
my @dow  = <Monday Tuesday Wednesday Thursday Friday Saturday Sunday>;
my @dow2 = <Mo Tu We Th Fr Sa Su>;
my @dow3 = <Mon Tue Wed Thu Fri Sat Sun>;
my @mon  = <January February March April May June July August September October November December>;
my @mon3 = <Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec>;
my @sets = <dow dow2 dow3 mon mon3>;

for @sets -> $n {
    my $ne = $n ~~ /^d/ ?? 7 !! 12;
    my @v = @::($n); # <== interpolated from $n

    my $is-dow;
    if $ne == 7 {
        $dn = Date::Names.new: :$lang, :dset($n);
        $is-dow = 1;
    }
    else {
        $dn = Date::Names.new: :$lang, :mset($n);
        $is-dow = 0;
    }

    # test the class construction
    isa-ok $dn, Date::Names;
    # test class methods (8)
    can-ok $dn, 'nsets';
    can-ok $dn, 'sets';
    can-ok $dn, 'show';
    can-ok $dn, 'show-all';
    can-ok $dn, 'dow';
    can-ok $dn, 'mon';
    can-ok $dn, 'dow2num';
    can-ok $dn, 'mon2num';
    # test the data array
    is @v.elems, $ne;

    # test the main methods for return values
    for 1..$ne -> $d {
        my $val = @v[$d-1];
        if $is-dow {
            is $dn.dow($d), $val;
        }
        else {
            is $dn.mon($d), $val;
        }
    }
}
