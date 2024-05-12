#!/usr/bin/env bash

version="${1#v}"

awk -v version="[$version]" '
BEGIN {
    in_version = 0
    found_version = 0
}

{
    if ($1 == "##") {
        if ($2 == version) {
            in_version = 1
            found_version = 1
            print "## What\047s Changed in " substr(version, 2, length(version) - 2) ""
        } else {
            if (found_version) {
                exit
            }
            in_version = 0
        }
    }

    if (in_version && $1 != "##" && $2 != version) {
        print $0
    }
}' .github/CHANGELOG.md >.github/RELEASE_NOTES.md
