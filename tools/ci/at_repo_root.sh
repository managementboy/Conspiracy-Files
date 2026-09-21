#!/usr/bin/env bash
# Confirm the working directory is the Conspiracy-Files repository, not the
# workspace it is nested inside.
#
# A run that starts one directory up finds no test/ and no mod/, does nothing,
# and reports nothing wrong - which is the worst possible outcome for a job
# whose whole purpose is to notice.
set -uo pipefail
for needed in AGENTS.md mod/42 test tools/autotest; do
    [ -e "$needed" ] || {
        echo "not the Conspiracy-Files repository root: $needed is missing (cwd $PWD)"
        exit 2
    }
done
echo "repository root confirmed: $PWD"
