Contributing
============

New language
------------

New languages are always welcome!

To contribute a new language, do the following:

  * Fork this project on Github.

  * Do NOT change Markdown which is auto-generated from Rakudoc files in thr './docs' directory. Make any changes in the Rakudoc source files there.

  * Determine the ISO two- or three-letter code for your language. You will use the lower-case version of it in the rest of the steps. See a list of ISO language codes here: [ISO 639-2 alpha 2 language codes](https://www.loc.gov/standards/iso639-2/php/code_list.php).

  * Copy the template file './resources/xx.rakumod' and rename it to 'lib/Data/Names/xx.rakumod' where xx is your language's lower-case ISO two- or three-letter code.

  * Fill out the new 'x.rakumod' file as completely as you can. Please feel free to document it as required, but DO NOT change the name or number of elements of any of the standard eight arrays.

  * Add your new language code to `@Date::Names::langs` (in its place by alphabetical order).

  * Add your new language as a new line in the META6.json in the "provides" array. Watch comma placement, and ensure the META6.json is valid (requires module App::Mi6: `$ mi6 build`).

  * Submit a pull request with your changes.

