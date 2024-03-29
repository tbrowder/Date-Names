unit class Date::Names;

use Abbreviations;

# Languages currently available:
#
#   de - German
#   en - English
#   es - Spanish
#   fr - French
#   id - Indonesian
#   it - Italian
#   nb - Norwegian (bokmål)
#   nn - Norwegian (nynorsk)
#   nl - Dutch
#   pl - Polish
#   ro - Romanian
#   ru - Russian
#   uk - Ukrainian

# A list of the language two-letter codes currently considered
# in this module:
our @langs = <de en es fr id it nb nn nl pl ro ru uk>;
our %langs =
de => 'German',
en => 'English',
es => 'Spanish',
fr => 'French',
id => 'Indonesian',
it => 'Italian',
nb => 'Norwegian (bokmål)',
nn => 'Norwegian (nynorsk)',
nl => 'Dutch',
pl => 'Polish',
ro => 'Romanian',
ru => 'Russian',
uk => 'Ukrainian',
;

# Start with Google's translation
#   translate "The Year" to lang
#   note some these are suspect
our %the-year is export =
de => 'Das Jahr',        # ok
en => 'The Year',        # ok
es => 'El año',          # ok
fr => "L'année",         # ok
id => 'Tahun',           # ok
it => "L'anno",          # ok
nb => 'Год» да бокмал',  # ok bokmal
nn => 'Год» на нюнорск', # ok nynorsk
nl => 'Het jaar',        # ok
pl => 'Rok',             # ok
ro => 'Anul',            # ok
ru => 'Год',             # ok
uk => 'Рік',             # ok
;

# Lists of the eight standard data set names for each language:
our @msets = <mon mon2 mon3 mona>;
our @dsets = <dow dow2 dow3 dowa>;
our @allsets;
@allsets.push($_) for @msets;
@allsets.push($_) for @dsets;

# the language-specfic data
use Date::Names::de;
use Date::Names::en;
use Date::Names::es;
use Date::Names::fr;
use Date::Names::id;
use Date::Names::it;
use Date::Names::nb;
use Date::Names::nn;
use Date::Names::nl;
use Date::Names::pl;
use Date::Names::ro;
use Date::Names::ru;
use Date::Names::uk;

# the class (beta)
enum Period <yes no keep>;
enum Case <tc uc lc nc>; # 'nc' no change

has Str $.lang  is rw = 'en';  # default: English
has Str $.mset  is rw = 'mon'; # default: full names
has Str $.dset  is rw = 'dow'; # default: full names
has Str $.msetF       = 'mon'; # constant: full names
has Str $.dsetF       = 'dow'; # constant: full names
has Str $.the-year    = 'The Year'; # default

has Period $.period = keep;  # add, remove, or keep a period to end abbreviations
has UInt $.trunc    = 0;     # truncate to N chars if N > 0
has Case $.case     = nc;    # use native case (or choose: tc, lc, uc)
has $.pad           = False; # used with trunc to fill short values with
                             # spaces on the right
has $.debug is rw   = 0;

# these objects take the value of the chosen name of each type of data
# set:
has $.d is rw;
has $.dfull;
has $.m is rw;
has $.mfull;
# this an auto-generated hash of the names of
# all non-empty data sets and values of that array
has %.s is rw;
# this is the string "This Year" translated to the language class
has $.ty is rw;

submethod TWEAK() {
    # This sets the class var to the desired
    # dow and mon name sets (lang and value width)

    # convenience string vars
    my $L = $!lang;
    my $M = $!mset;
    my $D = $!dset;
    my $MF = $!msetF;
    my $DF = $!dsetF;

    $!m  = self!define-attr-mset($L, $M);
    $!d  = self!define-attr-dset($L, $D);
    %!s  = self!define-attr-sets($L);
    $!ty = %the-year{$L};

    $!mfull = self!define-attr-mset($L, $MF);
    $!dfull = self!define-attr-mset($L, $DF);
}

# private methods ================================
method !define-attr-mset($L, $M) {
    my $mm = "Date::Names::{$L}::{$M}";
    my $m  =  $::($mm);
    return $m;
}

method !define-attr-dset($L, $D) {
    my $dd = "Date::Names::{$L}::{$D}";
    my $d  =  $::($dd);
    return $d;
}

method !define-attr-sets($L) {
    my $M = $!mset;
    my $D = $!dset;

    my %h;
    for @allsets -> $n {
        my $nn = "Date::Names::{$L}::{$n}";
        my $s = $::($nn);
        if !$s {
            say "DEBUG: lang $L, empty set '$n'...skipping" if $!debug;
            next;
        }
        if $!debug {
            #say $s.gist if $!debug;;
            say "DEBUG: lang $L, set $n, elems {$s.elems}: '{$s.gist}'";
        }
        next if !$s.elems;
        %h{$n} = $s;
    }
    return %h;
}

method !handle-val-attrs($val is copy, :$is-abbrev!) {
    if !defined $val {
        die "FATAL: undefined \$val '{$val.^name}'";
    }
    # check for any changes that are to be made
    my $has-period = 0;
    my $nchars = $val.chars; # includes an ending period
    if $val ~~ /^(\S+) '.'$/ {
        die "FATAL: found ending period in val $val (not an abbreviation)"
            if !$is-abbrev;

        # remove the period and return it later if required
        $val = ~$0;
        $has-period = 1;
    }
    elsif $val ~~ /'.'/ {
        die "FATAL: found INTERIOR period in val $val";
    }

    if $!trunc && $val.chars > $!trunc {
        $val .= substr(0, self.trunc);
    }
    elsif $!trunc && $.pad && $val.chars < $!trunc {
        $val .= substr(0, $!trunc);
    }

    if $!case !~~ /keep/ {
        # more checks needed
    }

    if $!trunc && $val.chars > self.trunc {
        $val .= substr(0, $!trunc);
    }
    elsif $!trunc && $.pad && $val.chars < $!trunc {
        $val .= substr(0, $!trunc);
    }
    if $.case !~~ /keep/ {
        # more checks needed
    }

    # treat the period carefully, it may or may not
    # have been removed by now
    if $val !~~ /'.'$/ && $has-period {
        $val ~= '.';
    }

    $val;

}

# public methods ================================
=begin comment
# TOTO get this working!!
method clone {
    =begin comment
    my %h = self!define-objects;
    nextwith :s(%h), |%_;
    =end comment

    my $L = $!lang;
    my $M = $!mset;
    my $D = $!dset;

    my $m = self!define-attr-mset($L, $M);
    my $d = self!define-attr-dset($L, $D);
    my %h = self!define-attr-sets($L);
    nextwith :lang($L), :mset($M), :dset($D), :m($m), :d($d), :s(%h), |%_;

}
=end comment

method dow(UInt $n is copy where { 0  < $n < 8 },
           $trunc = 0,
           :$debug
          ) {

    --$n; # <-- CRITICAL for proper array indexing internally in the $!d array
          #     1..7 dow

    my $val = $!d[$n];

    my $is-abbrev = $!dset eq 'dow' ?? False !! True;
    my $nchars    = $!dset.chars;
    my $nc-abbrev = 0;
    if $is-abbrev {
        if $!dset eq 'dow2' {
            $nc-abbrev = 2;
        }
        elsif $!dset eq 'dow3' {
            $nc-abbrev = 3;
        }
        elsif $!dset eq 'dowa' {
            $nc-abbrev = 3;
        }
        else {
            die "FATAL: unrecognized dset = '$!dset'";
        }
    }

    if not $val.defined {
        # auto-truncate to the desired length
        if $debug {
            print qq:to/HERE/;
            DEBUG:
              val is NOT defined
                lang:  $!lang
                dset:  $!dset
                index: $n
            HERE
        }

        # truncate the full-length dow
        my $v = $!dfull[$n];
        $val  = $v.substr(0, $nc-abbrev);

        if $debug {
            print qq:to/HERE/;
                v:    $v
                val:  $val
            HERE
        }
    }

    if $trunc and $trunc < $val.chars {
        # TODO this may have to change if the class $trunc is used
        $val .= substr(0, $trunc);
    }

    $val = self!handle-val-attrs($val, :$is-abbrev);

    $val
}

method mon2num($s, :$debug) {
    # given a leading portion of a full name,
    # return its number (1..12)

    # TODO reword for use of Abbrevs module
    # get a hash of the abbreviations of the list of months (lower-cased)
    # create a new hash keyed by month number
    # invert that hash so each unique abbrev points to the month number
    # if the input is not a key, return zero

    my @w   = @($!m);
    my @ab  = abbrevs @w, :out-type(AL);
    my $ret = 0;
    my $i   = 0;
    ABBREV: for @ab -> $a {
        my $w = @w[$i];
        ++$i;
        note "DEBUG: month abbrev $i ($a) is for month $w" if $debug;;
        if $s ~~ /^:i $a/ {
            $ret = $i;
            note "DEBUG: BINGO month number $i ($a) is for month $w" if $debug;
            last ABBREV;
        }
    }
    $ret
}

method dow2num($s, :$debug) {
    # given a leading portion of a full name,
    # return its number (1..7)

    # TODO reword for use of Abbrevs module
    # get a hash of the abbreviations of the list of months (lower-cased)
    # create a new hash keyed by month number
    # invert that hash so each unique abbrev points to the month number
    # if the input is not a key, return zero

    for 0..6 {
        note "DEBUG: day of the week {$_ + 1} is {$!d[$_]}" if $debug;
    }
    my @w   = @($!d);
    my @ab  = abbrevs @w, :out-type(AL);
    my $ret = 0;
    my $i   = 0;
    ABBREV: for @ab -> $a {
        my $w = @w[$i];
        ++$i;
        note "DEBUG: dow abbrev $i ($a) is for day $w" if $debug;;
        if $s ~~ /^:i $a/ {
            $ret = $i;
            note "DEBUG: BINGO day number $i ($a) is for day $w" if $debug;
            last ABBREV;
        }
    }
    $ret
}

method mon(UInt $n is copy where { 0 < $n < 13 },
           $trunc = 0,
           :$debug
) {

    --$n; # <-- CRITICAL for proper array indexing internally in the $!m array
          #     1..12 mon

    my $val = $!m[$n];
    my $is-abbrev = $!mset eq 'mon' ?? False !! True;
    my $nchars    = $!mset.chars;
    my $nc-abbrev = 0;
    if $is-abbrev {
        if $!mset eq 'mon2' {
            $nc-abbrev = 2;
        }
        elsif $!mset eq 'mon3' {
            $nc-abbrev = 3;
        }
        elsif $!mset eq 'mona' {
            $nc-abbrev = 3;
        }
        else {
            die "FATAL: unrecognized mset = '$!mset'";
        }
    }

    if not $val.defined {
        # auto-truncate to the desired length
        if $debug {
            print qq:to/HERE/;
            DEBUG:
              val is NOT defined
                lang:  $!lang
                dset:  $!mset
                index: $n
            HERE
        }

        # truncate the full-length dow
        my $v = $!mfull[$n];
        $val  = $v.substr(0, $nc-abbrev);

        if $debug {
            print qq:to/HERE/;
                v:    $v
                val:  $val
            HERE
        }
    }

    if $trunc and $trunc < $val.chars {
        # TODO this may have to change if the class $trunc is used
        $val .= substr(0, $trunc);
    }

    $val = self!handle-val-attrs($val, :$is-abbrev);

    $val
}

# utility methods
method sets {
    say "name sets with values:";
    print "  $_" for %.s.keys.sort;
    say();
}

method nsets {
    return %.s.elems;
}

# could make tests!
method show {
    say "  non-empty sets ({%.s.elems} total):";
    for %.s.keys.sort -> $k {
        printf "  %-4s:", $k;
        my $arr = %.s{$k};
        print " '$_'" for @($arr);
        say "";
    }
}

method show-all {
    # loop over all langs and show all available sets:
    say "Available languages and name sets:";
    for @langs -> $L {
        my $lang = %langs{$L};
        my $d = Date::Names.new: :lang($L);
        say "Language: $L - $lang";
        $d.show;
    }
}
