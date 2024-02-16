use v6;
use Test;

plan 45;

use Date::Names;

# Check correct values
my @m = <January February March April May June July August September October November December>;
my @d = <Monday Tuesday Wednesday Thursday Friday Saturday Sunday>;
my $i;

# direct array access
for 0..^12 -> $mon {
    my $val = @m[$mon];
    my $val2 = $val.substr: 0, 2;
    my $val3 = $val.substr: 0, 3;
    is $Date::Names::en::mon[$mon], $val;
    is $Date::Names::en::mon3[$mon], $val3;
}

for 0..^7 -> $day {
    my $val = @d[$day];
    my $val2 = $val.substr: 0, 2;
    my $val3 = $val.substr: 0, 3;
    is $Date::Names::en::dow[$day], $val;
    is $Date::Names::en::dow2[$day], $val2;
    is $Date::Names::en::dow3[$day], $val3;
}
