#!/usr/bin/env bash

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <start_num> <end_num>"
    exit 1
fi

CMD1="sbcl --script lispRecur/collatz.lisp"
CMD2="./fortran/a.out"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "******* Comparing commands (${GREEN}$CMD1${NC}) and (${GREEN}$CMD2${NC}) *******"
echo

echo "Range: $1 to $2"

diff --side-by-side <($CMD1 $1 $2) <($CMD2 $1 $2)

if [ $?  -eq 0 ]; then
    echo -e "${GREEN}****** The outputs are identical for the given range ******${NC}"
else
    echo -e "${RED}****** The outputs differ for for the given range ******${NC}"
fi

echo
