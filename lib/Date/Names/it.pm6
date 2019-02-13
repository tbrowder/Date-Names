unit module Date::Names::it;

# note all possible hashes and keys exist but they may have missing values
constant $mon = %(
    1, 'Gennaio',    2, 'Febbraio',  3, 'Marzo',     4, 'Aprile',
    5, 'Maggio',     6, 'Giugno',    7, 'Luglio',    8, 'Agosto',
    9, 'Settembre', 10, 'Ottobre',  11, 'Novembre', 12, 'Dicembre'
);

constant $dow = %(
    1, 'lunedì',  2, 'martedì', 3, 'mercoledì', 4, 'giovedì',
    5, 'venerdì', 6, 'sabato',  7, 'domenica'
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
