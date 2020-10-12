#!/usr/bin/env raku

use lib <../lib>;
use Date::Names;

say "VERSION 2 ==================";

my $d = Date::Names.new;
$d.show;
$d.dump;

Date::Names.show;
