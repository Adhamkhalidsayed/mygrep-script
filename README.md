# MyGrep Script

## Overview

This is a mini version of the `grep` command, implemented in a shell script (`mygrep.sh`). It allows users to search for strings within a text file, with options to show line numbers, invert the match, and more.

## Features

- Case-insensitive string search
- Option to show line numbers for each match (`-n`)
- Option to invert the match and print lines that do **not** match (`-v`)
- Handles missing arguments and errors gracefully

## Usage
./mygrep.sh [options] search_string filename

## Options:
1) -n Show line numbers
2) -v Invert match (print lines that do not match)
3) --help Show this help message

## Reflective Section

### Breakdown of How the Script Handles Arguments and Options

The script processes command-line arguments in a structured way, using a while loop to handle options like -n, -v, and --help. It checks for missing arguments, handles file existence checks, and reads the file line by line to match the search string.

### Supporting Regex or -i/-c/-l Options

To support regular expressions, I would modify the search string handling to use grep’s regex features. I would also add flags like -i (case-insensitive), -c (count matches), and -l (print filenames with matches). This would involve adjusting the grep commands and adding corresponding conditions for each new flag.

### What Part of the Script Was Hardest to Implement and Why?

The hardest part of the script was correctly implementing the invert match (-v) logic. It required careful handling of the match variable to ensure that only the correct lines (either matching or non-matching) were printed. Managing combined options like -vn or -nv also required attention to ensure all flags were applied properly.


Support for --help flag: The --help flag has been implemented to display usage information.
Improved option parsing: Future improvements could include using getopts for cleaner option parsing.

