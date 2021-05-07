[![Actions Status](https://github.com/tbrowder/Date-Names/workflows/test/badge.svg)](https://github.com/tbrowder/Date-Names/actions)

Date::Names
===========

Module **Date::Names** - Provides month and weekday names for numbers (multilingual)

This is Version 2 with significant differences and more features compared to Version 1:

### Changes:

  * language-specific data set hashes have changed to arrays

  * no symbols are exported; direct access is available, but not recommended--use the new class instead

  * @lang renamed to @langs

  * added class **Date::Names** for primary data access

SYNOPSIS
========

    use Date::Names;

    my $d = Date::Names.new: :lang<nl>;
    say "Month 3, Dutch: '{$d.mon(3)}'"; # OUTPUT: «Month 3, Dutch: 'maart'␤»
    $d = Date::Names.new: :lang<it>;
    say "Weekday 3, Italian: '{$d.dow(3)}'"; # OUTPUT: «Weekday 3, Italian: 'mercoledì'␤»
    $d = Date::Names.new: :lang<de>;
    say "Two-letter abbrev., weekday 3, German is '{$d.dow2(3)}'";
    $d.clone: :lang<en>;
    say "Three-letter abbrev., weekday 3, English is '{$d.dow2(3)}'";

DESCRIPTION
===========

Module **Date::Names** provides the full name of months and days of the week for the numbers 1..12 and 1..7, respectively, primarily for use with **Raku**'s date functions.

Full names of the months and weekdays are currently available in the following twelve languages:

### Table 1. Language ISO codes (lower-case)

<table class="pod-table">
<thead><tr>
<th>Language</th> <th>ISO code</th>
</tr></thead>
<tbody>
<tr> <td>Dutch</td> <td>nl</td> </tr> <tr> <td>English</td> <td>en</td> </tr> <tr> <td>French</td> <td>fr</td> </tr> <tr> <td>German</td> <td>de</td> </tr> <tr> <td>Indonesian</td> <td>id</td> </tr> <tr> <td>Italian</td> <td>it</td> </tr> <tr> <td>Norwegian (Bokmål)</td> <td>nb</td> </tr> <tr> <td>Norwegian (Nynorsk)</td> <td>nn</td> </tr> <tr> <td>Polish</td> <td>pl</td> </tr> <tr> <td>Romanian</td> <td>ro</td> </tr> <tr> <td>Russian</td> <td>ru</td> </tr> <tr> <td>Spanish</td> <td>es</td> </tr>
</tbody>
</table>

CAPITALIZATION and PUNCTUATION
==============================

All English month and weekday names are always capitalized. Other languages vary in capitalization depending on where the word or abbreviation is used or other factors. The names and abbreviations herein are in the most common form, but the user can always explicitly set the case by applying the Raku routines **tclc**, **uc**, or **lc** to the name or abbreviation.

Some of the abbreviations include an ending period since that is customary use in some languages (e.g., French).

LIMITATIONS
===========

Not all languages have a complete set of two- and three-letter abbreviations, and some require up to four letters for the official abbreviations.

Table 2 shows the array names for the full names and abbreviations currently available. Array names with a 2 or 3 appended are complete abbreviation sets of that length only. Array names with an 'a' appended are sets of abbreviations of mixed length. A 'Y' in a cell indicates a language has a complete set of that type of abbreviation.

Note that in some countries the term "abbreviation" is distinctly different than "code" as it applies to date names. An asterisk in a cell marks those which are technically codes rather than abbreviations. Table 3 shows the meaning of other codes used in the Table 2 cells.

The array names in Table 2 (without a sigil) are the ones to be used for the day and month array names for the **Date::Names** class constructor.

### Table 2. Name array availability by language

<table class="pod-table">
<thead><tr>
<th>Language / Array</th> <th>mon</th> <th>dow</th> <th>mon3</th> <th>dow3</th> <th>mon2</th> <th>dow2</th> <th>mona</th> <th>dowa</th>
</tr></thead>
<tbody>
<tr> <td>Dutch</td> <td>Y</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td>Y</td> <td></td> <td></td> </tr> <tr> <td>English</td> <td>Y</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td>Y</td> <td></td> <td></td> </tr> <tr> <td>French</td> <td>Y</td> <td>Y</td> <td></td> <td>Y</td> <td>Y*</td> <td></td> <td>Y</td> <td>Y</td> </tr> <tr> <td>German</td> <td>Y</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td>Y</td> <td></td> <td></td> </tr> <tr> <td>Indonesian</td> <td>Y</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td></td> <td></td> <td></td> </tr> <tr> <td>Italian</td> <td>Y</td> <td>Y</td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr> <tr> <td>Norwegian Bokmål</td> <td>Y</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td></td> <td></td> <td>Y</td> </tr> <tr> <td>Norwegian Nynorsk</td> <td>Y</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td></td> <td></td> <td>Y</td> </tr> <tr> <td>Polish</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td></td> <td>Y</td> <td></td> <td></td> </tr> <tr> <td>Romanian</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td></td> <td>Y</td> <td>Y</td> <td></td> </tr> <tr> <td>Russian</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td></td> <td>Y</td> <td></td> <td></td> </tr> <tr> <td>Spanish</td> <td>Y</td> <td>Y</td> <td>Y*</td> <td>Y*</td> <td>Y</td> <td>Y</td> <td></td> <td></td> </tr>
</tbody>
</table>

### Table 3. Name array cell codes and meaning

<table class="pod-table">
<thead><tr>
<th>Code</th> <th>Meaning</th>
</tr></thead>
<tbody>
<tr> <td>*</td> <td>code rather than an abbreviation</td> </tr> <tr> <td>L</td> <td>array values are lower-case</td> </tr> <tr> <td>M</td> <td>array values are mixed-case</td> </tr> <tr> <td>P</td> <td>array values have a trailing period</td> </tr> <tr> <td>T</td> <td>array values are title-case</td> </tr> <tr> <td>U</td> <td>array values are upper-case</td> </tr> <tr> <td>Y</td> <td>language has this array</td> </tr>
</tbody>
</table>

Note that when the **Date::Names** class is fully implemented in Version 3, the user will be able to specify desired array table attributes for his or her tastes (case, trailing period, truncation or padding);

PULL REQUESTS
=============

Native language speakers please submit PRs to (1) complete the existing language abbreviations, (2), correct errors, and (3) provide more languages. See the [docs/CONTRIBUTING](./docs/CONTRIBUTING.md) file for details.

CORRECTIONS and SUGGESTIONS
===========================

The goal of this module is to be useful to non-English users as well as English users. The author welcomes suggestions for improvement and increased utility.

Class Date::Names
=================

Now available is class **Date::Names** to ease use of the module:

    use Date::Names;
    my $dn = Date::Names.new; # default: English, full names
    is $dn.dow(1), "Monday";  # ok
    is $dn.mon(1), "January"; # ok
    is $dn.dow(1, 3), "Mon";  # ok, raw truncation on full names only
    is $dn.mon(1, 3), "Jan";  # ok, raw truncation on full named only

The full API for the class constructor looks like this:

    enum Period <yes no keep-p>;
    enum Case <uc lc tc p keep-c>;
    my $dn = Date::Names.new(
        lang     => 'nl',   # default: 'en'
        dset     => 'dow3', # default: 'dow'
        mset     => 'mon',  # default: 'mon'
        period   => yes,    # default: keep-p (use native)
        case     => uc,     # default: keep-c (use native)
        truncate => 0,      # default
        pad      => 0,      # default
    ):

Some helper methods:

    my $dn = Date::Names.new;
    # how many non-empty data sets?
    $dn.nsets;
    # show the sets:
    $dn.sets
    # show all sets in all available languages
    $dn.show-all

Planned features:
=================

1. English language default [complete]

2. Default month and weekday array choices [complete]

3. User chooses truncation or padding [API complete, needs tests]

4. User chooses which month and weekday array to use [complete]

5. User chooses case of the output names [API complete, needs tests]

6. User can choose raw truncation on a full name, if permitted by the language [API partially complete]

7. User can choose to have a period or not for abbreviations [API complete, needs tests]

8. Functions for entering three-char abbreviation of weekday or month name and returning its number

Future features:
================

1. Language-specific attributes to affect class behavior (e.g., allow raw truncation or not)

2. Add additional array names and types on a language basis (automatically via a separate CLDR date module)

3. Graceful messages if a desired array is empty [version 2+]

4. Features desired by users

The basic class is working (see **Planned features** above) and is tested briefly. More is to be done, but eventually it will be able to proved a unified handling of full names and abbreviations. The user will be able to control casing, absence or presence of periods on abbreviations, and truncation or padding as desired.

VERSION 3
=========

  * A CLDR module which can produce compatible language data for this module will be available.

  * Additionally, the CLDR date data set names will be mapped to the current names where possible, and some short set names added if necessary.

  * All CLDR data set names will also be available as aliases or native arrays.

  * The **Date::Names** class API will be fixed and all currently planned features will be fully implemented and tested.

ACKNOWLEDGEMENTS
================

The following persons contributed to this project via PRs and comments (@name is an alias on IRC #raku):

+ Moritz Lenz (@moritz, github: moritz) - German and Norwegian Bokmål data

+ @sena_kun (github: Altai-man) - Russian data

+ Luc St-Louis (@lucs, github: lucs) - French data

+ Luis F. Uceta (github: uzluisf) - Spanish data

+ Elizabeth Mattijsen (@lizmat, github: lizmat) - Dutch data

+ github: heince - Indonesian data

+ github: tzjan - Polish data

+ Eskild Hustvedt (@Zero_Dogg, github: zerodogg) - Norwegian Nynorsk data

+ github: altblue - Romanian data

I am grateful for their help!

REFERENCES
==========

1. [FR] [http://bdl.oqlf.gouv.qc.ca/bdl/gabarit_bdl.asp?id=3617](http://bdl.oqlf.gouv.qc.ca/bdl/gabarit_bdl.asp?id=3617)

2. [ES] [http://www.wikilengua.org/index.php/Abreviaciones_en_fechas](http://www.wikilengua.org/index.php/Abreviaciones_en_fechas)

3. [ES] [http://lema.rae.es/dpd/srv/search?id=fKODyKTfZD6s0mX7bz](http://lema.rae.es/dpd/srv/search?id=fKODyKTfZD6s0mX7bz)

AUTHOR
======

Tom Browder, <tom.browder@cpan.org>

COPYRIGHT and LICENSE
=====================

Copyright © 2019-2021 Tom Browder

This program is free software; you may redistribute or modify it under the same terms as Raku itself.

