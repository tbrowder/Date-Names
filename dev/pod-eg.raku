#!/usr/bin/env raku

# stuff from README

use lib <../lib>;
use Date::Names;

# default is to show full names
my $d = Date::Names.new: :lang<de>;
say "Day 3, German: '{$d.dow(3)}'";   # OUTPUT: «Day 3, German: 'Mittwoch'␤»
say "Month 3, German: '{$d.mon(3)}'"; # OUTPUT: «Month 3, German: 'März'␤»
# what abbreviations are available?
$d.sets; # OUTPUT: «name sets with values:␤  dow  dow2  mon  mon3␤»
# choose the desired sets
$d = Date::Names.new: :lang<de>, :mset<mon3>, :dset<dow2>;
say "Day 4, German: '{$d.dow(4)}'";   # OUTPUT: «Day 4, German: 'Do'␤»
say "Month 4, German: '{$d.mon(4)}'"; # OUTPUT: «Month 4, German: 'Apr'␤»
# arbitrarily truncate a word
say "Month 8 (truncate to 2 chars), German: '{$d.mon(8,2)}'"; # OUTPUT: «Month 8, German 'Au'␤»
# given a name, return the number of month of year or day of week
say "Month number, German 'März': {$d.mon2num('März')}";  # OUTPUT: «Month number, German 'März': 3␤»
say "Day of week number, German 'Mittwoch': {$d.dow2num('Mittwoch')}"; # OUTPUT: «Day of week number, German 'Mittwoch': 3␤»

say "===========================================";
# second section
my $dn = Date::Names.new: :lang<nl>;
# how many non-empty data sets?
say $dn.nsets;
# show the sets:
$dn.sets;
# show all sets in all available languages
$dn.show-all;
