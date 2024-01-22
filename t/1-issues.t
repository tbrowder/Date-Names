use Date::Names;
use Test;

plan 26;

my @langs =  < uk ro ru es pl de en nl it fr nn nb id >;

my $debug = 0;

# automatic truncation for undefined values
for @langs { lives-ok { dow-test :lang($_), :$debug } }
for @langs { lives-ok { mon-test :lang($_), :$debug } }

# shorter test subs
my $dn;
my @mons = 1..12;
my @dows = 1..7;
sub dow-test(:$lang!, :$debug) {
    $dn = Date::Names.new: :$lang, :dset<dow2>;
    for @dows { 
        my $dow = $dn.dow($_, :$debug); 
        die "???" if $dow ~~ /'?'/;
        die "failed length test" if $dow.chars !== 2;
    }
    $dn = Date::Names.new: :$lang, :dset<dow3>;
    for @dows { 
        my $dow = $dn.dow($_, :$debug); 
        die "???" if $dow ~~ /'?'/;
        die "failed length test" if $dow.chars !== 3;
    }
}
sub mon-test(:$lang!, :$debug) {
    $dn = Date::Names.new: :$lang, :mset<mon2>;
    for @mons {
        my $mon = $dn.mon($_, :$debug); 
        die "???" if $mon ~~ /'?'/;
        die "failed length test" if $mon.chars !== 2;
    }
    $dn = Date::Names.new: :$lang, :mset<mon3>;
    for @mons {
        my $mon = $dn.mon($_, :$debug); 
        die "???" if $mon ~~ /'?'/;
        die "failed length test" if $mon.chars !== 3;
    }
}

# subroutine from Calendar/lib/Calendar/Subs.rakumod
my @months = 1..1; #12;
sub caldata(@months? is copy, :$lang is copy, :$year is copy, :$debug) is export {
    # Produces output for all months or the specified
    # months identically to the Linux program 'cal'.
    if not $year {
        $year = DateTime.now.year + 1;
    }
    if not $lang {
        $lang = 'en'
    }

    my $dn = Date::Names.new: :$lang, :dset<dow2>;
    my @p;
    if @months.defined and (0 < @months[*] < 13) {
        @months .= sort({$^a <=> $^b});
        @p = @months;
    }
    else {
        @p = 1..12;
    }
    my $end = @p.end;

    for @p.kv -> $i, $p {
        my $mnum = $p;
        # the standard cal header spans
        # 7x2 + 6 = 20 characters
        # month and year are centered
        my $mname = $dn.mon($mnum);
        my $hdr = "$mname {$year}";
        my $leading = ' ' x ((22 - $hdr.chars) div 2) - 1;
        #note "DEBUG: \$leading = |$leading|";
        say $leading ~ $hdr;
        for <7 1 2 3 4 5 6> {
            my $dow = $dn.dow($_);
            if $_ != 6 {
                print "$dow ";
                next;
            }
            say "$dow";
        }

        # add one line of days of the week: 4, 5, or 6 weeks
        # note our calendars are sun..sat, thus 7, 1..6
        my $Fdim = Date.new: :$year, :month($mnum), :day(1);
        my $dow = $Fdim.day-of-week;
        my $dim = $Fdim.days-in-month; # days in the month

        # TODO refactor the common code if possible:
        if $dow == 7 {
            say " 1  2  3  4  5  6  7";
            my $next = 8;
            my $dremain = $dim - 7;

            # TODO BEGIN common code block
            my $idx = 0;
            while $dremain {
                printf '%2d', $next;
                print " ";
                $next++;
                $dremain--;
                ++$idx;
                next if $idx < 7;
                $idx = 0;
                say();
            }
            say() unless not $idx;
            # TODO END common code block
        }
        elsif $dow == 1 {
            say "    1  2  3  4  5  6";
            my $next = 7;
            my $dremain = $dim - 6;

            my $idx = 0;
            while $dremain {
                printf '%2d', $next;
                print " ";
                $next++;
                $dremain--;
                ++$idx;
                next if $idx < 7;
                $idx = 0;
                say();
            }
            say() unless not $idx;
        }
        elsif $dow == 2 {
            say "       1  2  3  4  5";
            my $next = 6;
            my $dremain = $dim - 5;

            my $idx = 0;
            while $dremain {
                printf '%2d', $next;
                print " ";
                $next++;
                $dremain--;
                ++$idx;
                next if $idx < 7;
                $idx = 0;
                say();
            }
            say() unless not $idx;
        }
        elsif $dow == 3 {
            say "          1  2  3  4";
            my $next = 5;
            my $dremain = $dim - 4;

            my $idx = 0;
            while $dremain {
                printf '%2d', $next;
                print " ";
                $next++;
                $dremain--;
                ++$idx;
                next if $idx < 7;
                $idx = 0;
                say();
            }
            say() unless not $idx;
        }
        elsif $dow == 4 {
            say "             1  2  3";
            my $next = 4;
            my $dremain = $dim - 3;

            my $idx = 0;
            while $dremain {
                printf '%2d', $next;
                print " ";
                $next++;
                $dremain--;
                ++$idx;
                next if $idx < 7;
                $idx = 0;
                say();
            }
            say() unless not $idx;
        }
        elsif $dow == 5 {
            say "                1  2";
            my $next = 3;
            my $dremain = $dim - 2;

            my $idx = 0;
            while $dremain {
                printf '%2d', $next;
                print " ";
                $next++;
                $dremain--;
                ++$idx;
                next if $idx < 7;
                $idx = 0;
                say();
            }
            say() unless not $idx;;
        }
        elsif $dow == 6 {
            say "                   1";
            my $next = 2;
            my $dremain = $dim - 1;

            my $idx = 0;
            while $dremain {
                printf '%2d', $next;
                print " ";
                $next++;
                $dremain--;
                ++$idx;
                next if $idx < 7;
                $idx = 0;
                say();
            }
            say() unless not $idx;
        }

        # add a blank line after each month
        # except the last
        say() unless $i == $end;
    }
}
