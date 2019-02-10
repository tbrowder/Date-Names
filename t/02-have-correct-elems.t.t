use v6;
use Test;

plan 30;

use Date::Names :ALL;

is %(%mon<en>).elems, 12;
is %(%mon<fr>).elems, 12;
is %(%mon<de>).elems, 12;
is %(%mon<es>).elems, 12;
is %(%mon<it>).elems, 12;
is %(%mon<nl>).elems, 12;

is %(%mon3<en>).elems, 12;
is %(%mon3<fr>).elems, 12;
is %(%mon3<de>).elems, 12;
is %(%mon3<es>).elems, 12;
is %(%mon3<it>).elems, 12;
is %(%mon3<nl>).elems, 12;

is %(%dow<en>).elems, 7;
is %(%dow<fr>).elems, 7;
is %(%dow<de>).elems, 7;
is %(%dow<es>).elems, 7;
is %(%dow<it>).elems, 7;
is %(%dow<nl>).elems, 7;

is %(%dow3<en>).elems, 7;
is %(%dow3<fr>).elems, 7;
is %(%dow3<de>).elems, 7;
is %(%dow3<es>).elems, 7;
is %(%dow3<it>).elems, 7;
is %(%dow3<nl>).elems, 7;

is %(%dow2<en>).elems, 7;
is %(%dow2<fr>).elems, 7;
is %(%dow2<de>).elems, 7;
is %(%dow2<es>).elems, 7;
is %(%dow2<it>).elems, 7;
is %(%dow2<nl>).elems, 7;
