use Test;

# Language 'nb' class
plan 95;

my $lang = 'nb';

use Date::Names;

my $dn; # holds the class objects

# these data are auto-generated:
# non-empty data set arrays
my @dow  = <mandag tirsdag onsdag torsdag fredag lørdag søndag>;
my @dow3 = <man tir ons tor fre lør søn>;
my @dowa = <man tir ons tors fre lør søn>;
my @mon  = <januar februar mars april mai juni juli august september oktober november desember>;
my @mon3 = <jan feb mar apr mai jun jul aug sep okt nov des>;
my @sets = <dow dow3 dowa mon mon3>;

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
