use v6;
use Test;

plan 2;

use Date::Names;

my $dn = Date::Names.new: :lang<en>, :dow<dow2>, :mon<mon3>;

is $dn.dow(1), "Mo";
is $dn.mon(1), "Jan";
