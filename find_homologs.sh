#!/usr/bin/env bash
query_file="$1"
subject_file="$2"
output_file="$3"

tblastn -query "$query_file" -subject "$subject_file" -outfmt "6 qseqid sseqid pident length qlen" | awk '$3 > 30 && ($4 / $5) * 100 > 90 { print $0 }' > "$output_file" && wc -l < "$output_file"