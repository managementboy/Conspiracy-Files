#!/usr/bin/env bash
# Which offline test belongs to which suite — defined once so the shipped
# runner and the prototype runner can never disagree about a file.
#
# The rule is not a hand-kept list, because a hand-kept list is what lets a new
# prototype test quietly join the shipped suite. A test is a PROTOTYPE test if
# it puts the prototype directory on package.path; that is the same line that
# makes it load unshipped code, so it cannot be true of a test of shipped code
# and cannot be forgotten when a new one is written.
#
# The pattern anchors on package.path deliberately. Matching the bare
# directory name caught test/suite_coverage.lua, which only MENTIONS the
# directory while testing this very classifier - and being misfiled as a
# prototype would have taken it out of the shipped suite it exists to guard.
#
#   cf_is_prototype_test test/first_clue.lua   -> 0 (yes)
#   cf_is_prototype_test test/case_file.lua    -> 1 (no)
cf_is_prototype_test() { grep -q 'package\.path.*dev/next-phase' "$1"; }

# Owned by test/run.lua, not run on their own.
cf_is_spec_test() { case "$1" in *_spec.lua|*/run.lua) return 0 ;; *) return 1 ;; esac; }
