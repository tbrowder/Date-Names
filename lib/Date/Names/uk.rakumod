unit module Date::Names::uk;

#********
# Українська
# Ukrainian
#********

# IMPORTANT:
#
# All valid month and weekday name and abbreviation arrays must have
# either twelve (12) or seven (7) elements, respectively.  Arrays
# without month or day values MUST be completely empty as are the ones
# shown below.

# Note the standard eight arrays should exist in the file (see Table 2
# in the README for the correct names). They may be empty, but there
# should be eight (8) total arrays.

# To be an acceptable language for Date::Names, there must be defined completely
# at least one of the standard abbreviation sets for both months and weekdays
# in order to provide a default abbreviation set for the user in the
# event another abbreviation set is desired but not available.

#=== FULL NAMES ======================================================
# 1
our $mon = <
    січень    лютий    березень  квітень
    травень   червень  липень    серпень
    вересень  жовтень  листопад  грудень
>;

# 2
our $dow = <
    понеділок  вівторок  середа  четвер
    пʼятниця   субота    неділя
>;

#=== THREE-LETTER ABBREVIATIONS ======================================
# 3
our $mon3 = <
    січ  лют  бер  кві  тра  чер
    лип  сер  вер  жов  лис  гру
>;

# 4
our $dow3 = <
>;

#=== TWO-LETTER ABBREVIATIONS ========================================
# 5
our $mon2 = <
    сч  лт  бр  кв  тр  чр
    лп  ср  вр  жв  лс  гр
>;

# 6
our $dow2 = <
    пн  вт  ср  чт
    пт  сб  нд
>;

#=== MIXED-LENGTH ABBREVIATIONS ======================================
# 7
our $mona = <
    січ.  лют.   бер.  квіт.  трав.  черв.
    лип.  серп.  вер.  жовт.  лист.  груд.
>;

# 8
our $dowa = <
    пон.   вівт.  сер.  четв.
    пʼят.  суб.   нед.
>;
