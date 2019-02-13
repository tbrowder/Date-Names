unit module Date::Names::de;

# note all possible hashes and keys exist but they may have missing values
constant $mon = %(
    1, 'Januar',     2, 'Februar',   3, 'März',      4, 'April',
    5, 'Mai',        6, 'Juni',      7, 'Juli',      8, 'August',
    9, 'September', 10, 'Oktober',  11, 'November', 12, 'Dezember'
);

constant $dow  = %(
    1, 'Montag',  2, 'Dienstag', 3, 'Mittwoch', 4,  'Donnerstag',
    5, 'Freitag', 6, 'Samstag',  7, 'Sonntag'
);

# three-letter abbreviations
constant $mon3  = %(
    1, 'Jan',  2, 'Feb',  3, 'Mär',  4, 'Apr',
    5, 'Mai',  6, 'Jun',  7, 'Jul',  8, 'Aug',
    9, 'Sep', 10, 'Okt', 11, 'Nov', 12, 'Dez'
);

constant $dow3 = %(
    1, '', 2, '', 3, '', 4, '',
    5, '', 6, '', 7, ''
);

# two-letter abbreviations
constant $mon2  = %(
    1, '',  2, '',  3, '',  4, '',
    5, '',  6, '',  7, '',  8, '',
    9, '', 10, '', 11, '', 12, ''
);
constant $dow2  = %(
    1, 'Mo', 2, 'Di', 3, 'Mi', 4, 'Do',
    5, 'Fr', 6, 'Sa', 7, 'So'
);

# mixed
constant $mona  = %(
    1, '',  2, '',  3, '',  4, '',
    5, '',  6, '',  7, '',  8, '',
    9, '', 10, '', 11, '', 12, ''
);

constant $dowa  = %(
    1, '', 2, '', 3, '', 4, '',
    5, '', 6, '', 7, ''
);
