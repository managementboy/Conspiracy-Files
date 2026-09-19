#!/usr/bin/env bash
# Evidence bookkeeping shared by relocation.sh and its shell-only regression.

relocation_evidence_reset() {
    declare -gA RELOC_BASELINE=()
    declare -gA RELOC_MOVED=()
    declare -gA RELOC_BEFORE=()
    declare -gA RELOC_AFTER=()
    RELOC_EVIDENCE_ISSUES=()
}

relocation_evidence_baseline() { RELOC_BASELINE["$1"]=1; }

# Print only the ids from successful move records.  This deliberately accepts
# no generic "relocated" text: the mod's canonical record has this exact form.
relocation_evidence_moved_ids() {
    sed -nE 's/.*\[CF-G2-RELOCATE\][[:space:]]+relocated[[:space:]]+([^[:space:]]+).*/\1/p' | sort -u
}

relocation_evidence_moved() { RELOC_MOVED["$1"]=1; }

relocation_evidence_verdict() {
    awk -F '\t' 'NR == 1 { for (i=1; i<=NF; i++)
        if ($i == "verdict=none" || $i == "verdict=DISCREPANCY") {
            sub(/^verdict=/, "", $i); print $i; exit
        } }' <<<"$1"
}

# A discrepancy is a real comparison too; the caller separately makes it a
# failing result. Everything else is unreadable/incomplete evidence.
relocation_evidence_comparison() {
    local phase="$1" id="$2" line="$3"
    if [ -n "$(relocation_evidence_verdict "$line")" ]; then
        if [ "$phase" = before ]; then RELOC_BEFORE["$id"]=1
        else RELOC_AFTER["$id"]=1
        fi
    fi
}

# Return 0 only when each recorded move was in the captured baseline and was
# actually compared before and after the reload. Return 2 for inconclusive
# evidence and populate RELOC_EVIDENCE_ISSUES with concise reasons.
relocation_evidence_complete() {
    local id
    RELOC_EVIDENCE_ISSUES=()
    if [ "${#RELOC_MOVED[@]}" -eq 0 ]; then
        RELOC_EVIDENCE_ISSUES+=("no CF-G2-RELOCATE move record in this run")
    fi
    for id in "${!RELOC_MOVED[@]}"; do
        [ -n "${RELOC_BASELINE[$id]:-}" ] || RELOC_EVIDENCE_ISSUES+=("$id moved but was absent from the captured baseline")
        [ -n "${RELOC_BEFORE[$id]:-}" ] || RELOC_EVIDENCE_ISSUES+=("$id was not readable in a valid comparison before reload")
        [ -n "${RELOC_AFTER[$id]:-}" ] || RELOC_EVIDENCE_ISSUES+=("$id was not readable in a valid comparison after reload")
    done
    [ "${#RELOC_EVIDENCE_ISSUES[@]}" -eq 0 ] && return 0
    return 2
}
