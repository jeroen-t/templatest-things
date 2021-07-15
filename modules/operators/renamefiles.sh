#!/bin/bash

// rename files recursively
function renamefiles () {
    SEARCH_PATH="$1"
    SEARCH="$2"
    REPLACE="$3"

    # echo $#
    if test $# -lt 3; then
        echo "usage: `basename $0` <working_directory> <to_replace> <replace_value>"
    fi

    for file in `find ${SEARCH_PATH} -name "*${SEARCH}*" -type f`; do
        mv "$file" "${file/${SEARCH}/${REPLACE}}"
    done
}

renamefiles $1 $2 $3