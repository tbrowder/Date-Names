#!/usr/bin/env raku

use Proc::Easier;

my @good = <
t/001-load.t
t/003-have-full-names.t
t/004-check-en-values.t
t/005-en-class.t
t/006-check-all-langs.t
t/007-de-lang-class.t
t/007-en-lang-class.t
t/007-it-lang-class.t
t/007-id-lang-class.t
t/007-nl-lang-class.t
t/007-pl-lang-class.t
t/007-ru-lang-class.t
t/1-issues.t
t/007-es-lang-class.t
t/007-fr-lang-class.t
t/007-nb-lang-class.t
t/007-nn-lang-class.t
t/007-ro-lang-class.t
t/007-uk-lang-class.t
>;

my @bad = <
>;

#for @good -> $t {
for @bad -> $t {

    my $res = cmd "raku -I. $t";
    say "== running test '$t'...";
    say $res;
    last
}


