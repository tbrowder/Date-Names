#!/usr/bin/env perl6

use lib <../lib>;
use Date::Names;

my @langs = @Date::Names::langs;

if !@*ARGS {
    say qq:to/HERE/;
    Usage: $*PROGRAM go [debug][force]
    
    Writes test files for languages:
    HERE
    print " ";
    print " $_" for @langs;
    say "";
    exit;
}

my $debug = @*ARGS ~~ /d/ ?? 1 !! 0 ;
my $force = @*ARGS ~~ /f/ ?? 1 !! 0 ;
for @langs -> $L {
    my %parts;
    read-test-template %parts;

    # output file is hard-wired
    my ($f, $fh);
    if $debug {
        $f  = sprintf "%03d-{$L}-lang-class.t';
        $fh = open $f, :w;
    }
    else {
        # use the module's test directory
        $f  = sprintf "../t/%03d-{$L}-lang-class.t';
        $fh = get-file-handle $f, :$force;
        =begin comment
        if $f.IO.f {
            note "NOTE: file '$f' exists";
            if $force {
                note "      overwriting'...";
            }
            else {
                note "      NOT overwriting'...";
                return;
            }
        }
        =end comment
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
    
    if $debug {
        say "DEBUG: early exit";
        last;
    }
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
}

