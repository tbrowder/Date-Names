use Test;

# Language 'uk' class
plan 139;

my $lang = 'uk';

use Date::Names;

my $dn; # holds the class objects

# these data are auto-generated:
# non-empty data set arrays
my @dow  = <понеділок вівторок середа четвер пʼятниця субота неділя>;
my @dow2 = <пн вт ср чт пт сб нд>;
my @dowa = <пон. вівт. сер. четв. пʼят. суб. нед.>;
my @mon  = <січень лютий березень квітень травень червень липень серпень вересень жовтень листопад грудень>;
my @mon2 = <сч лт бр кв тр чр лп ср вр жв лс гр>;
my @mon3 = <січ лют бер кві тра чер лип сер вер жов лис гру>;
my @mona = <січ. лют. бер. квіт. трав. черв. лип. серп. вер. жовт. лист. груд.>;
my @sets = <dow dow2 dowa mon mon2 mon3 mona>;

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
