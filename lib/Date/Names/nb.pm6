unit module Date::Names::nb;

# note all possible hashes and keys exist but they may have missing values
constant $mon = %(
    1, 'januar',      2, 'februar',   3, 'mars',      4, 'april',
    5, 'mai',         6, 'juni',      7, 'juli',      8, 'august',
    9, 'september',  10, 'oktober',  11, 'november', 12, 'desember',
);

constant $dow = %(
    1, 'mandag', 2, 'tirsdag', 3, 'onsdag', 4, 'torsdag',
    5, 'fredag', 6, 'lørdag',  7, 'søndag',
);

# three-letter abbreviations
constant $mon3 = %(
    1, '',  2, '',  3, '',  4, '',
    5, '',  6, '',  7, '',  8, '',
    9, '', 10, '', 11, '', 12, ''
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

constant $dow2 = %(
    1, '', 2, '', 3, '', 4, '',
    5, '', 6, '', 7, ''
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
