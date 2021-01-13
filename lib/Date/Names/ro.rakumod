unit module Date::Names::ro;

#********
# Română
# Romanian
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
     ianuarie    februarie  martie     aprilie
     mai         iunie      iulie      august
     septembrie  octombrie  noiembrie  decembrie
>;

# 2
our $dow = <
     luni    marți    miercuri  joi
     vineri  sâmbătă  duminică
>;

#=== THREE-LETTER ABBREVIATIONS ======================================
# 3
our $mon3 = <
     ian  feb  mar  apr
     mai  iun  iul  aug
     sep  oct  nov  dec
>;

# 4
our $dow3 = <
>;

#=== TWO-LETTER ABBREVIATIONS ========================================
# 5
our $mon2 = <
>;

# 6
our $dow2 = <
     lu  ma  mi  jo
     vi  sâ  du
>;

#=== MIXED-LENGTH ABBREVIATIONS ======================================
# 7
our $mona = <
     ian   febr  mart  apr
     mai   iun   iul   aug
     sept  oct   nov   dec
>;

# 8
our $dowa = <
>;
