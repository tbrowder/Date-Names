use v6;
use Test;

plan 84+84+49+49+49;

use Date::Names :ALL;

# Have values
for 1..12 -> $mon {
    ok %mon{$mon};
    for @lang -> $L {
        ok %mon{$L}{$mon};
    }

    ok %mon3{$mon};
    ok %mon3<en>{$mon};

    # the following don't yet have values
    for <de es fr it nl> -> $L {
        nok %mon3{$L}{$mon}, "no value yet";
    }
}

for 1..7 -> $day {
    ok %dow{$day};
    for @lang -> $L {
        ok %dow{$L}{$day};
    }

    ok %dow3{$day};
    ok %dow3<en>{$day};
    # the following don't yet have values
    for <de es fr it nl> -> $L {
        nok %dow3{$L}{$day}, "no value yet";
    }

    ok %dow2{$day};
    ok %dow2<en>{$day};
    ok %dow2<de>{$day};
    # the following don't yet have values
    for <es fr it nl> -> $L {
        nok %dow2{$L}{$day}, "no value yet";
    }
}
