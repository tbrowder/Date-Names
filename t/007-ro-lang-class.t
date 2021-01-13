use Test;

# Language 'ro' class
plan 90;

my $lang = 'ro';

use Date::Names;

my $dn;

# these data are auto-generated:
# non-empty data set arrays
my @mon  = <ianuarie februarie martie aprilie mai iunie iulie august septembrie octombrie noiembrie decembrie>;
my @dow  = <luni marți miercuri joi vineri sâmbătă duminică>;
my @mon3 = <ian feb mar apr mai iun iul aug sep oct nov dec>;
my @dow2 = <lu ma mi jo vi sâ du>;
my @mona = <ian febr mart apr mai iun iul aug sept oct nov dec>;
my @sets = <mon dow mon3 dow2 mona>;

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
    # test class methods (6)
    can-ok $dn, 'nsets';
    can-ok $dn, 'sets';
    can-ok $dn, 'show';
    can-ok $dn, 'show-all';
    can-ok $dn, 'dow';
    can-ok $dn, 'mon';
    # test the data array
    is @v.elems, $ne, $n ~ ' length = ' ~ $ne;

    # test the main methods for return values
    for 1..$ne -> $d {
        my $val = @v[$d-1];
        my $dsc = $n ~ '[' ~ $d ~ ']' ~ ' = ' ~ $val;
        if $is-dow {
            is $dn.dow($d), $val, $dsc;
        }
        else {
            is $dn.mon($d), $val, $dsc;
        }
    }
}
