use v6;
use Test;

plan 84+84+49+49+49;

use Date::Names :ALL;

# Have values
for 1..12 -> $mon {
    ok %mon{$mon};
    ok %mon<de>{$mon};
    ok %mon<en>{$mon};
    ok %mon<es>{$mon};
    ok %mon<fr>{$mon};
    ok %mon<it>{$mon};
    ok %mon<nl>{$mon};
}

for 1..12 -> $mon {
    ok %mon3{$mon};
    ok %mon3<en>{$mon};

    # the following don't yet have values
    nok %mon3<de>{$mon}, "no value yet";
    nok %mon3<es>{$mon};
    nok %mon3<fr>{$mon};
    nok %mon3<it>{$mon};
    nok %mon3<nl>{$mon};
}

for 1..7 -> $day {
    ok %dow{$day};
    ok %dow<de>{$day};
    ok %dow<en>{$day};
    ok %dow<es>{$day};
    ok %dow<fr>{$day};
    ok %dow<it>{$day};
    ok %dow<nl>{$day};
}

for 1..7 -> $day {
    ok %dow3{$day};
    ok %dow3<en>{$day};

    # the following don't yet have values
    nok %dow3<de>{$day};
    nok %dow3<es>{$day};
    nok %dow3<fr>{$day};
    nok %dow3<it>{$day};
    nok %dow3<nl>{$day};
}

for 1..7 -> $day {
    ok %dow2{$day};
    ok %dow2<en>{$day};
    ok %dow2<de>{$day};

    # the following don't yet have values
    nok %dow2<es>{$day};
    nok %dow2<fr>{$day};
    nok %dow2<it>{$day};
    nok %dow2<nl>{$day};
}
