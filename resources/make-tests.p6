#!/usr/bin/env perl6

use lib <../lib>;
use Date::Names;

my @langs = @Date::Names::langs;

if !@*ARGS {
    say qq:to/HERE/;
    Usage: $*PROGRAM go | debug [force]
    
    Writes test files for languages:
    HERE
    print " ";
    print " $_" for @langs;
    say "";
    exit;
}

my $debug = @*ARGS ~~ /d/ ?? 1 !! 0;
my $force = @*ARGS ~~ /f/ ?? 1 !! 0;

my @ofils;
# number prefix for the test series:
my $N = 5;
for @langs -> $L {

    my %parts;
    read-test-template %parts;

    # collect data sets and other info for each language
    my %data;
    get-raw-lang-data :lang($L), :data(%data);

    # output file is hard-wired
    my ($f, $fh);
    if $debug {
        $f  = sprintf "%03d-{$L}-lang-class.t'", $N;
        $fh = open $f, :w;
        @ofils.append: $f;
    }
    else {
        # use the module's test directory
        $f  = sprintf "../t/%03d-{$L}-lang-class.t'", $N;
        $fh = get-file-handle $f, :$force;
        @ofils.append: $f;
    }
    
    if $debug {
        say "DEBUG: dumping parts for lang $L:";
        for 1..3 -> $p {
            say "== part $p ============";
            for @(%parts{$p}) -> $line {
                say "  $line";
            }
            say "======================";
        }
    }
    
    # now write the pieces
    write-test-file $fh, :%data, :$debug;

    if $debug {
        say "DEBUG: early exit";
        last;
    }
}

say "Normal end.";
if @ofils {
    my $n = +@ofils;
    my $s = $n > 1 ?? 's' !! '';
    say "Output file$s:";
    say "  $_" for @ofils;
}
else {
    say "No files were created.";
}

##### SUBROUTINES #####
sub read-test-template(%parts) {
    # input file is hard-wired
    my $f = './lang-class.t';
    die "FATAL: input file '$f' not found'" if !$f.IO.f;

    my $part = 0;
    for $f.IO.lines -> $line {
        # three kinds of directive lines separating the input file
        if $line ~~ / \s+ begin \s+ part \s+ (\d) \s+ / {
            $part = +$0;
            # start adding lines to part $part
            # %parts{$part} SHOULD be empty
            die "FATAL: unexpected non-empty \%parts{$part}" if %parts{$part};
            next;
        } 
        elsif $line ~~ / \s+ end \s+ part \s+ (\d) \s+ / {
            my $p = +$0;
            # stop adding lines to part $part
            # make sure we're in g here
            die "FATAL: unexpected part mismatch" if $p != $part;

            # make sure lines are ignored between parts
            $part = 0;
            next;
        } 
        elsif $line ~~ / \s+ part \s+ (\d) \s+ data \s+ / {
            my $p = +$0;
            # add the data for part $part
            # %parts{$part}; %parts{$part};
            die "FATAL: unexpected non-empty \%parts{$part}" if %parts{$part};
            if %parts{$part} {
                if $debug {
                    say "DEBUG: dumping \%parts{$part}:";
                    say "  $_" for %parts{$part};
                    say "DEBUG: early exit"; exit;
                } 
                die "FATAL: part $part, unexpected non-empty \%parts{$part}" if %parts{$part};
            }

            # so we can skip lines between parts
            $part = 0;
            # do whatever here
            
            next;
        } 
        elsif !$part {
            # ignore line reads beteen parts
            next;
        }
        %parts{$part}.append: $line;
    }

}

sub write-test-part1-data($fh) {
}

sub write-test-part2-data($fh) {
}

sub write-test-part3-data($fh) {
}

sub get-file-handle($f, :$force) {
    my $f-exists = $f.IO.f ?? 1 !! 0;
    note "NOTE: file '$f' exists" if $f-exists;
    if $f-exists && !$force {
        note "      NOT overwriting'...";
        return 0;
    }
    note "      overwriting'..." if $f-exists;
    return open($f, :w);
}

sub get-raw-lang-data(:$lang, :%data) {
    my $base  = "Date::Names";
    my $baseL = "Date::Names::{$lang}";

    my $ds    = "{$base}::dsets";
    my @dsets = @::($ds);
    %data<dsets> = @dsets;
    for @dsets -> $n {
        my $set = "{$baseL}::{$n}";
        #my @arr = @($::($set));
        %data{$n} = @($::($set));
    }

    my $ms    = "{$base}::msets";
    my @msets = @::($ms);
    %data<msets> = @msets;
    for @msets -> $n {
        my $set = "{$baseL}::{$n}";
        #my @arr = @($::($set));
        %data{$n} = @($::($set));
    }
}

sub write-test-file($fh, :%data, :$debug) {
    for %data.keys.sort -> $n {
        next if $n ~~ /^ [d|m] sets/;
        my @arr = @(%data{$n});
        next if !@arr;

        # $n now has the name of non-empty arrays, so
        # we print them in <> form
        $fh.printf: "\@%-4s = <", $n;
        my $ne = $n.comb[0] eq 'd' ?? 7 !! 12;

        for @arr.kv -> $idx, $s {
            $fh.print(" ") if $idx;
            $fh.print: "$s"; 
        }
        $fh.say: ">;"; 
    }
}

