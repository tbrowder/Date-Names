use v6;
use Test;

plan 5;

use Date::Names;

# Check correct values
my $mon = 1;
is $Date::Names::en::mon{$mon}, "January";
is $Date::Names::en::mon3{$mon}, "Jan";

my $day = 1;
is $Date::Names::en::dow{$day}, "Monday";
is $Date::Names::en::dow3{$day}, "Mon";
is $Date::Names::en::dow2{$day}, "Mo";
