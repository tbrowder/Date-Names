use v6;
use Test;

plan 417;

use Date::Names;

# Have values
for 1..12 -> $mon {
    ok %Date::Names::mon{$mon};
    for @lang -> $L {
        ok %Date::Names::mon{$L}{$mon};
    }

    ok %Date::Names::mon2<fr>{$mon};

    ok %Date::Names::mon3{$mon};
    ok %Date::Names::mon3<de>{$mon};
    ok %Date::Names::mon3<en>{$mon};
    ok %Date::Names::mon3<es>{$mon};
    ok %Date::Names::mon3<ru>{$mon};

    # the following don't yet have values
    for <fr it nb nl> -> $L {
        nok %Date::Names::mon3{$L}{$mon}, "no value yet";
    }
}

for 1..7 -> $day {
    ok %Date::Names::dow{$day};
    for @lang -> $L {
        ok %Date::Names::dow{$L}{$day};
    }

    ok %Date::Names::dow3{$day};
    ok %Date::Names::dow3<en>{$day};
    ok %Date::Names::dow3<es>{$day};
    ok %Date::Names::dow3<fr>{$day};

    # the following don't yet have values
    for <de it nb nl ru> -> $L {
        nok %Date::Names::dow3{$L}{$day}, "no value yet";
    }

    ok %Date::Names::dow2{$day};
    ok %Date::Names::dow2<de>{$day};
    ok %Date::Names::dow2<en>{$day};
    ok %Date::Names::dow2<es>{$day};
    ok %Date::Names::dow2<ru>{$day};

    # the following don't yet have values
    for <fr it nb nl> -> $L {
        nok %Date::Names::dow2{$L}{$day}, "no value yet";
    }
}
