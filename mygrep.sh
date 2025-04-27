#!/bin/bash

usage() {
    echo "Usage: $0 [options] search_string filename"
    echo "Options:"
    echo " -n    Show line numbers"
    echo " -v    Invert match (print lines that do NOT match)"
    echo " --help    Show this help message"
    exit 1
}

if [ $# -lt 1 ]; then
    usage
fi

show_line_numbers=false
invert_match=false


while [[ "$1" == -* ]]; do
    case "$1" in
        -n)
            show_line_numbers=true 
            ;;
        -v)
            invert_match=true
            ;;
        --help)
            usage
            ;;
        -*)
            # Handle combined options like -vn or -nv
            for ((i = 1; i < ${#1}; i++)); do
                opt="${1:i:1}"
                case "$opt" in
                    v) invert_match=true ;;
                    n) show_line_numbers=true ;;
                    *) echo "Unknown option: -$opt"
                       usage
                       ;;
                esac
            done
            ;;
    esac
    shift
done

# Now $1 is search_string, $2 is filename
if [ $# -lt 2 ]; then
    echo "Error: Missing search string or filename."
    usage
fi

search_string="$1"
filename="$2"

if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found!"
    exit 1
fi



line_number=0
while IFS= read -r line; do
    ((line_number++))

    if echo "$line" | grep -i -q -- "$search_string"; then
        match=true
    else
        match=false
    fi

    # Handle invert match (-v)
    if [ "$invert_match" = true ]; then
        if [ "$match" = true ]; then
            match=false
        else
            match=true
        fi
    fi

    # Print if it's a matching line
    if [ "$match" = true ]; then
        if [ "$show_line_numbers" = true ]; then
            echo "${line_number}:$line"
        else
            echo "$line"
        fi
    fi

done < "$filename"