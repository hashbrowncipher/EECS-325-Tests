#!/bin/zsh

# Runs the proj2 executable specified on the commandline, canonicalizes the output, and stores it in the output folder
# Example:
# ./test.sh ../proj2


sort_summary() {
    grep -v "^TYPE" "$1" > "$2"
    grep "^TYPE" "$1" | sort >> "$2"
}

rm -r outputs
mkdir outputs

for i in inputs/*; do
    filename="`basename $i`"
    for j in p s c; do
        $1 "-$j" "$i" > "outputs/$filename-$j"
    done

    sort "outputs/$filename-c" > "outputs/$filename-cc"
    sort_summary "outputs/$filename-s" "outputs/$filename-ss"
done

sha1sum -c sums
