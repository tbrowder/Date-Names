[![Build Status](https://travis-ci.org/tbrowder/Date-Names-Perl6.svg?branch=master)](https://travis-ci.org/tbrowder/Date-Names-Perl6)

Date::Names
===========

Module **Date::Names** - Provides month and day-of-the-week names for numbers (multilingual)

SYNOPSIS
========

    use Date::Names;

    say "The name of month 3 in Dutch is {%mon<nl><3>}";
    say "The name of month 3 in English is {%mon<3>} or {%mon<en><3>}";
    say "The name of month 3 in French is {%mon<fr><3>}";
    say "The name of weekday 3 in Italian is {%dow<it><3>}";
    say "The name of weekday 3 in Spanish is {%dow<es><3>}";
    say "The two-letter abbreviation of weekday 3 in German is {%dow2<de><3>}";
    say "The three-letter abbreviation of weekday 3 in English is {%dow3<3>}";


DESCRIPTION
===========

Module **Date::Names** provides the full name of months and days of the week for
the numbers 1..12 and 1..7, respectively, primarily for use with
**Perl 6**'s date functions.

Full names of the months and week days are currently available in the
following languages:

  Name | ISO two-letter code | Notes
  ---  | :---:                 | ---
  Dutch   | nl | Lower-case
  English | en | Capitalized
  French  | fr | Lower-case
  German  | de | Capitalized
  Italian | it | Months capitalized, week days in lower-case
  Norwegian (Bokmål) | nb | Lower-case
  Russian | ru | Lower-case 
  Spanish | es | Lower-case

LIMITATIONS
===========

Not all languages have a complete set of two- and three-letter
abbreviations, and some require up to four letters for the
official abbreviations.

The following table shows the hash names for the abbreviations
currently available. Hash names with a 2, 3, or 4 appended are
complete abbreviation sets of that length only. 
Hash names with an 'a' appended are sets of abbreviations of mixed length.

Various two-, three-, and mixed-abbreviation hashes are also
available. See the table below for a complete, current list.

Language | %mon2 | %mon3 | %mon4 | %mona | %dow2 | %dow3 | %dow4 | %dowa
---      | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---:  
Dutch    |      |       |       |       |      |       |       |        
English  |      |       |       |       |      |       |       |        
French   |      |       |       |       |      |       |       |        
Germen   |      |       |       |       |      |       |       |        
Italian  |      |       |       |       |      |       |       |        
Norwegian|      |       |       |       |      |       |       |        
Russian  |      |       |       |       |      |       |       |        
Spanish  |      |       |       |       |      |       |       |        

PULL REQUESTS
=============

Native language speakers please submit PRs to (1) complete the
existing language abbreviations, (2), correct errors, and (3) provide
more languages.

ACKNOWLEDGEMENTS
================

The following persons (shown are their #perl6 IRC handles)
contributed to this project via PRs and comments:

+ @moritz - German and Norwegian data
+ @sena_kun - Russian data
+ @luc - French data

I am grateful for their help!

AUTHOR
======

Tom Browder, `<tom.browder@gmail.com> `

COPYRIGHT & LICENSE
===================

Copyright (c) 2019 Tom Browder, all rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl 6 itself.
