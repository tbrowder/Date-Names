use Test;

# Language 'ro' class
plan 100;

my $lang = 'ro';

use Date::Names;

my $dn; # holds the class objects

# these data are auto-generated:
# non-empty data set arrays
my @dow  = <luni marți miercuri joi vineri sâmbătă duminică>;
my @dow2 = <lu ma mi jo vi sâ du>;
my @mon  = <ianuarie februarie martie aprilie mai iunie iulie august septembrie octombrie noiembrie decembrie>;
my @mon3 = <ian feb mar apr mai iun iul aug sep oct nov dec>;
my @mona = <ian febr mart apr mai iun iul aug sept oct nov dec>;
my @sets = <dow dow2 mon mon3 mona>;

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
