#!/usr/bin/env raku

# stuff from README

use lib <../lib>;
use Date::Names;

# choose the German language (English is the default)
my $d = Date::Names.new: :lang<de>;
# default is to show full names
say $d.dow(3); # OUTPUT: «Mittwoch␤»
say $d.mon(3); # OUTPUT: «März␤»
# what abbreviations are available?
$d.sets; # OUTPUT: «name sets with values:␤  dow  dow2  mon  mon3␤»
# choose the desired sets
$d = Date::Names.new: :lang<de>, :mset<mon3>, :dset<dow2>;
say $d.dow(4); # OUTPUT: «Do␤»
say $d.mon(4); # OUTPUT: «Apr␤»
# arbitrarily truncate a word
say $d.mon(8,2); # OUTPUT: «Au␤»
# given a name, return the number of month of year or day of week
say $d.mon2num('März');     # OUTPUT: «3␤»
say $d.dow2num('Mittwoch'); # OUTPUT: «3␤»

=finish

say "===========================================";
# second section
my $dn = Date::Names.new: :lang<nl>;
# how many non-empty data sets?
say $dn.nsets;
# show the sets:
$dn.sets;
# show all sets in all available languages
$dn.show-all;
