unit module Date::Names::en;

# note all possible hashes and keys exist but they may have missing values
constant $mon = %(
    1, 'January',    2, 'February',  3, 'March',     4, 'April',
    5, 'May',        6, 'June',      7, 'July',      8, 'August',
    9, 'September', 10, 'October',  11, 'November', 12, 'December'
);

constant $dow = %(
    1, 'Monday', 2, 'Tuesday',  3, 'Wednesday', 4, 'Thursday',
    5, 'Friday', 6, 'Saturday', 7, 'Sunday'
);

# three-letter abbreviations
constant $mon3 = %(
    1, 'Jan', 2, 'Feb', 3, 'Mar',  4, 'Apr',  5, 'May',  6, 'Jun',
    7, 'Jul', 8, 'Aug', 9, 'Sep', 10, 'Oct', 11, 'Nov', 12, 'Dec'

);

constant $dow3 = %(
    1, 'Mon', 2, 'Tue', 3, 'Wed', 4, 'Thu',
    5, 'Fri', 6, 'Sat', 7, 'Sun'
);

# two-letter abbreviations
constant $mon2 = %(
    1, '',  2, '',  3, '',  4, '',
    5, '',  6, '',  7, '',  8, '',
    9, '', 10, '', 11, '', 12, ''
);

constant $dow2 = %(
    1, 'Mo', 2, 'Tu', 3, 'We', 4, 'Th',
    5, 'Fr', 6, 'Sa', 7, 'Su'
);

# mixed
constant $mona = %(
    1, '',  2, '',  3, '',  4, '',
    5, '',  6, '',  7, '',  8, '',
    9, '', 10, '', 11, '', 12, ''
);

constant $dowa  = %(
    1, '', 2, '', 3, '', 4, '',
    5, '', 6, '', 7, ''
);
