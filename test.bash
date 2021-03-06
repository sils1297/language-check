#!/bin/bash -ex
#
# Test command-line usage.

trap "echo -e '\x1b[01;31mFailed\x1b[0m'" ERR

echo 'This is okay.' | language-check -
! echo 'This is noot okay.' | language-check -

echo 'This is okay.' | python -m language_check -
! echo 'This is noot okay.' | python -m language_check -

echo 'These are “smart” quotes.' | python -m language_check -
! echo 'These are "dumb" quotes.' | python -m language_check -

echo '# These are "dumb".' | python -m language_check --ignore-lines='^#' -

echo -e '\x1b[01;32mOkay\x1b[0m'
