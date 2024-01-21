[![Actions Status](https://github.com/tbrowder/Date-Names/workflows/linux/badge.svg)](https://github.com/tbrowder/Date-Names/actions) [![Actions Status](https://github.com/tbrowder/Date-Names/workflows/macos/badge.svg)](https://github.com/tbrowder/Date-Names/actions) [![Actions Status](https://github.com/tbrowder/Date-Names/workflows/win64/badge.svg)](https://github.com/tbrowder/Date-Names/actions)

Date::Names
===========

Module **Date::Names** - Provides month and weekday names for numbers (multilingual)

This is Version 2 with significant differences and more features compared to Version 1:

### Changes:

  * language-specific data set hashes have changed to arrays

  * no symbols are exported; direct access is available, but not recommended—use the new class instead

  * `@lang` renamed to `@langs`

  * added class **Date::Names** for primary data access

SYNOPSIS
========

    use Date::Names;
    # choose the German language (English is the default)
    my $d = Date::Names.new: :lang<de>;

    # default is to show full names
    say $d.dow(3); # OUTPUT: «Mittwoch␤»
    say $d.mon(3); # OUTPUT: «März␤»

    # what abbreviations are available?
    $d.sets; # OUTPUT: «name sets with values:␤  dow  dow2  mon  mon3␤»

    # choose the desired sets
    $d = Date::Names.new: :lang<de>, :mset<mon3>, :dset<dow2>;
    say $d.dow(4); # OUTPUT: «Do␤»
    say $d.mon(4); # OUTPUT: «Apr␤»

    # arbitrarily truncate a word
    say $d.mon(8,2); # OUTPUT: «Au␤»

    # given a name, return the number of month of year or day of week
    say $d.mon2num('März');     # OUTPUT: «3␤»
    say $d.dow2num('Mittwoch'); # OUTPUT: «3␤»

DESCRIPTION
===========

Module **Date::Names** provides the full name of months and days of the week for the numbers 1..12 and 1..7, respectively, primarily for use with **Raku**'s date functions.

Full names of the months and weekdays are currently available in the following thirteen languages:

### Table 1. Language ISO codes (lower-case)

<table class="pod-table">
<thead><tr>
<th>Language</th> <th>ISO code</th>
</tr></thead>
<tbody>
<tr> <td>Dutch</td> <td>nl</td> </tr> <tr> <td>English</td> <td>en</td> </tr> <tr> <td>French</td> <td>fr</td> </tr> <tr> <td>German</td> <td>de</td> </tr> <tr> <td>Indonesian</td> <td>id</td> </tr> <tr> <td>Italian</td> <td>it</td> </tr> <tr> <td>Norwegian (Bokmål)</td> <td>nb</td> </tr> <tr> <td>Norwegian (Nynorsk)</td> <td>nn</td> </tr> <tr> <td>Polish</td> <td>pl</td> </tr> <tr> <td>Romanian</td> <td>ro</td> </tr> <tr> <td>Russian</td> <td>ru</td> </tr> <tr> <td>Spanish</td> <td>es</td> </tr> <tr> <td>Ukranian</td> <td>uk</td> </tr>
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
<tr> <td>Dutch</td> <td>Y</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td>Y</td> <td></td> <td></td> </tr> <tr> <td>English</td> <td>Y</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td>Y</td> <td></td> <td></td> </tr> <tr> <td>French</td> <td>Y</td> <td>Y</td> <td></td> <td>Y</td> <td>Y*</td> <td></td> <td>Y</td> <td>Y</td> </tr> <tr> <td>German</td> <td>Y</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td>Y</td> <td></td> <td></td> </tr> <tr> <td>Indonesian</td> <td>Y</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td></td> <td></td> <td></td> </tr> <tr> <td>Italian</td> <td>Y</td> <td>Y</td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr> <tr> <td>Norwegian (Bokmål)</td> <td>Y</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td></td> <td></td> <td>Y</td> </tr> <tr> <td>Norwegian (Nynorsk)</td> <td>Y</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td></td> <td></td> <td>Y</td> </tr> <tr> <td>Polish</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td></td> <td>Y</td> <td></td> <td></td> </tr> <tr> <td>Romanian</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td></td> <td>Y</td> <td>Y</td> <td></td> </tr> <tr> <td>Russian</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td></td> <td>Y</td> <td></td> <td></td> </tr> <tr> <td>Spanish</td> <td>Y</td> <td>Y</td> <td>Y*</td> <td>Y*</td> <td>Y</td> <td>Y</td> <td></td> <td></td> </tr> <tr> <td>Ukranian</td> <td>Y</td> <td>Y</td> <td>Y</td> <td></td> <td>Y</td> <td>Y</td> <td>P</td> <td></td> </tr>
</tbody>
</table>

### Table 3. Name array for truncated dow2 and dow3 languages

<table class="pod-table">
<thead><tr>
<th>Language</th> <th>ISO</th> <th>dow3</th> <th>dow2</th>
</tr></thead>
<tbody>
<tr> <td>French</td> <td>fr</td> <td>Y</td> <td></td> </tr> <tr> <td>Indonesian</td> <td></td> <td>Y</td> <td></td> </tr> <tr> <td>Italian</td> <td>it</td> <td></td> <td></td> </tr> <tr> <td>Norwegian (Bokmål)</td> <td></td> <td>Y</td> <td></td> </tr> <tr> <td>Norwegian (Nynorsk)</td> <td></td> <td>Y</td> <td></td> </tr>
</tbody>
</table>

### Table 4. Name array cell codes and meaning

<table class="pod-table">
<thead><tr>
<th>Code</th> <th>Meaning</th>
</tr></thead>
<tbody>
<tr> <td>*</td> <td>code rather than an abbreviation</td> </tr> <tr> <td>L</td> <td>array values are lower-case</td> </tr> <tr> <td>M</td> <td>array values are mixed-case</td> </tr> <tr> <td>P</td> <td>array values have a trailing period</td> </tr> <tr> <td>T</td> <td>array values are title-case</td> </tr> <tr> <td>U</td> <td>array values are upper-case</td> </tr> <tr> <td>Y</td> <td>language has this array</td> </tr>
</tbody>
</table>

Note that when the **Date::Names** class is fully implemented in Version 3, the user will be able to specify desired array table attributes for his or her tastes (case, trailing period, truncation or padding);

### Methods to see what is available

(See [All-SETS](ALL-SETS.md) for the complete list for all languages.)

    use Date::Names
    my $dn = Date::Names.new: :lang<nl>;
    # how many non-empty data sets?
    say $dn.nsets; # OUTPUT: «5␤»
    # show the sets:
    $dn.sets; # OUTPUT: «name sets with values:␤  dow  dow2  dow3  mon  mon3␤»
    # show all sets in all available languages
    $dn.show-all; # OUTPUT: see ALL-SETS.md)

New features:
=============

1. English language default

2. Default month and weekday array choices

3. User chooses which month and weekday array to use

4. Methods for entering a valid abbreviation of weekday or month name and returning its number

5. Graceful messages if a desired array is empty [version 2+]

Planned features:
=================

1. User chooses truncation or padding [API complete, needs tests]

2. User chooses case of the output names [API complete, needs tests]

3. User can choose to have a period or not for abbreviations [API complete, needs tests]

4. User can choose raw truncation on a full name, if permitted by the language [API partially complete]

Possible future features
========================

1. Language-specific attributes to affect class behavior (e.g., allow raw truncation or not)

2. Add additional array names and types on a language basis automatically via a separate Common Locale Data Repository (CLDR) date module

3. Features desired by users

The basic class is working (see **New features** and **Planned features** above) and is will be able to control casing, absence or presence of periods on abbreviations, and truncation or padding as desired.

VERSION 3
=========

  * A CLDR module which can produce compatible language data for this module will be available.

  * Additionally, the CLDR date data set names will be mapped to the current names where possible, and some short set names added if necessary.

  * All CLDR data set names will also be available as aliases or native arrays.

  * The **Date::Names** class API will be fixed and all currently planned features will be fully implemented and tested.

PULL REQUESTS
=============

Native language speakers please submit PRs to (1) complete the existing language abbreviations, (2), correct errors, and (3) provide more languages. See the [docs/CONTRIBUTING](./docs/CONTRIBUTING.md) file for details.

CORRECTIONS and SUGGESTIONS
===========================

The goal of this module is to be useful to non-English users as well as English users. The author welcomes suggestions for improvement and increased utility.

ACKNOWLEDGEMENTS
================

The following persons contributed to this project via PRs and comments (@name is an alias on IRC #raku):

+ Moritz Lenz (@moritz, github: moritz) - German and Norwegian Bokmﾃ･l data

+ @sena_kun (github: Altai-man) - Russian data

+ Luc St-Louis (@lucs, github: lucs) - French data

+ Luis F. Uceta (github: uzluisf) - Spanish data

+ Elizabeth Mattijsen (@lizmat, github: lizmat) - Dutch data

+ github: heince - Indonesian data

+ github: tzjan - Polish data

+ Eskild Hustvedt (@Zero_Dogg, github: zerodogg) - Norwegian Nynorsk data

+ github: altblue - Romanian data

+ Andrij Mizyk (github: andmizyk) - Ukranian data 

I am grateful for their help!

REFERENCES
==========

1. [FR] [http://bdl.oqlf.gouv.qc.ca/bdl/gabarit_bdl.asp?id=3617](http://bdl.oqlf.gouv.qc.ca/bdl/gabarit_bdl.asp?id=3617)

2. [ES] [http://www.wikilengua.org/index.php/Abreviaciones_en_fechas](http://www.wikilengua.org/index.php/Abreviaciones_en_fechas)

3. [ES] [http://lema.rae.es/dpd/srv/search?id=fKODyKTfZD6s0mX7bz](http://lema.rae.es/dpd/srv/search?id=fKODyKTfZD6s0mX7bz)

AUTHOR
======

Tom Browder, <tom.browder@acm.org>

COPYRIGHT and LICENSE
=====================

Copyright © 2019-2022 Tom Browder

This program is free software; you may redistribute or modify it under the same terms as Raku itself.

