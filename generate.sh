#!/bin/zsh
#Canonicalizes the reference output and produces SHA-1 sums


sort_summary() {
    grep -v "^TYPE" "$1" > "$2"
    grep "^TYPE" "$1" | sort >> "$2"
}

rm -r outputs
mkdir outputs

cp references/l-0.05.dmp-p outputs/l-0.05.dmp-p
sort references/l-0.05.dmp-c > outputs/l-0.05.dmp-cc
sort_summary references/l-0.05.dmp-s outputs/l-0.05.dmp-ss

sha1sum outputs/*-{p,cc,ss}


