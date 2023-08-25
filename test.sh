#!/bin/sh

test_count=0

check() {
  file="$1"
  expected="${2:-0}"
  ./commit-msg examples/"$file" >/dev/null 2>&1
  code=$?

  test_count=$((test_count + 1))

  test $code -eq "$expected" || {
    printf '%s should contain %d errors but got %d\n' "$1" "$expected" $code
    exit 1
  }
}

check good-example.txt
check good-example-emoji.txt
check good-example-long-link.txt
check good-example-technologist-emoji.txt

check bad-example.txt 8

# Title line
check bad-title-empty-line.txt 2
check bad-title-not-capitalized.txt 1
check bad-title-trailing-whitespace.txt 1
check bad-title-tab-characters.txt 1
check bad-title-punctuation-ending.txt 1

# Line between title and body
check bad-no-blank-line-separator.txt 1

# Body lines
check bad-body-long-line.txt 1
check bad-body-trailing-whitespace.txt 1
check bad-body-tab-characters.txt 1

printf 'All (%d) tests passed!\n' "$test_count"
