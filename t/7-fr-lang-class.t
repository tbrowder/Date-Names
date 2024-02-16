use Test;

# Language 'fr' class
plan 117;

my $lang = 'fr';

use Date::Names;

my $dn; # holds the class objects

# these data are auto-generated:
# non-empty data set arrays
my @dow  = <lundi mardi mercredi jeudi vendredi samedi dimanche>;
my @dow3 = <lun mar mer jeu ver sam dim>;
my @dowa = <lundi mardi mercr jeudi vendr sam dim>;
my @mon  = <janvier février mars avril mai juin juillet août septembre octobre novembre décembre>;
my @mon2 = <JR FR MS AL MI JN JT AT SE OE NE DE>;
my @mona = <janv févr mars avr mai juin juill août sept oct nov déc>;
my @sets = <dow dow3 dowa mon mon2 mona>;

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
