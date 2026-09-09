#!/usr/bin/env bash
# Check every engine method this mod depends on against the INSTALLED jar.
#
#   tools/verify_api.sh          check them all
#   tools/verify_api.sh -v       also print each method's real signature
#
# "Verify an API against the installed game, never from memory" is lesson 4 in
# PM_HANDOFF.md, and it has repeatedly been the difference between ten minutes
# and several hours. This makes it a command rather than a good intention.
#
# It walks superclasses. A naive javap -public on IsoDeadBody reports
# getModData missing, because it is declared on IsoObject three levels up -
# a false alarm that would send someone hunting a defect that does not exist.
set -euo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
. "$REPO/tools/env.sh"

verbose=0
[ "${1:-}" = "-v" ] && verbose=1

JAR="$PZ_HOME/projectzomboid.jar"
[ -f "$JAR" ] || { echo "projectzomboid.jar not found under $PZ_HOME (set PZ_HOME)" >&2; exit 2; }
[ -x "$JAVA_HOME/bin/javap" ] || { echo "javap not found under $JAVA_HOME (set JAVA_HOME to a JDK 25+)" >&2; exit 2; }

# class:method:why. The "why" is the point: a bare list rots into noise, but a
# reason tells the next person whether a missing method matters.
CHECKS=(
  "zombie.iso.objects.IsoDeadBody:getOutfitName:the corpse outfit lead; vanilla calls this on this type (SpawnRateChecker.lua:260)"
  "zombie.iso.objects.IsoDeadBody:getModData:corpse provenance stamp cfObservedSource"
  "zombie.iso.objects.IsoDeadBody:getSquare:where a body was observed"
  "zombie.inventory.InventoryItem:getKeyId:matching a key against a door's building"
  "zombie.inventory.InventoryItem:getModData:item provenance and generated-case stamps"
  "zombie.inventory.InventoryItem:getContainer:resolving each row's own container in a merged pane"
  "zombie.inventory.InventoryItem:getDisplayName:the label a notebook entry quotes"
  "zombie.inventory.InventoryItem:getFullType:deciding whether an item is a watched identity document"
  "zombie.inventory.InventoryItem:getID:the per-item key for seen/queued bookkeeping"
  "zombie.inventory.ItemContainer:getContainingItem:a wallet is the carrier of the ID inside it"
  "zombie.inventory.ItemContainer:getParent:telling a corpse container from a bag"
  "zombie.inventory.ItemContainer:getItems:reading rows without taking anything"
  "zombie.iso.BuildingDef:getKeyId:proving a door belongs to the key that opened it"
  "zombie.iso.BuildingDef:getIDString:the stable building identity recorded as a lead"
  "zombie.iso.IsoGridSquare:getBuilding:the building a door or body sits in"
  "zombie.iso.IsoGridSquare:getRoom:room labels for placement constraints"
  "zombie.iso.RoomDef:getName:the room label T3 extracts"
  # Vehicles as places (2026-09-09). A car is a container that moves, which is
  # why these are checked rather than assumed: everything the mod places today
  # is addressed by a grid square that cannot walk away.
  "zombie.iso.IsoCell:getVehicles:finding the vehicles near a site at all"
  "zombie.vehicles.BaseVehicle:getParts:reaching a vehicle's trunk, seats and glovebox"
  "zombie.vehicles.BaseVehicle:getId:the only stable handle on a vehicle that has moved"
  "zombie.vehicles.BaseVehicle:getSquare:where the vehicle is NOW, which is not where it was"
  "zombie.vehicles.BaseVehicle:isTrunkLocked:a locked boot is a lead, not an obstacle"
  "zombie.vehicles.VehiclePart:getItemContainer:the container a clue would actually go in"
  "zombie.vehicles.VehiclePart:getId:which part it is - TruckBed, GloveBox, SeatFrontLeft"
  "zombie.vehicles.VehiclePart:getContainerCapacity:whether a 20-weight body fits in this boot"
  "zombie.inventory.ItemContainer:getVehiclePart:telling a car boot from a kitchen cupboard"
  # O1: whether vanilla already dressed this room. Present on the installed
  # class; NOT yet proven callable from vanilla Lua - that needs a live probe,
  # and presence in the jar is not capability (T9).
  "zombie.iso.RoomDef:getProceduralSpawnedContainer:O1, which containers vanilla already filled"
  "zombie.characters.IsoPlayer:getInventory:distinguishing the player's own pane"
  "zombie.characters.IsoGameCharacter:getDescriptor:the survivor forename in the notebook title"
  "zombie.characters.SurvivorDesc:getForename:the survivor forename in the notebook title"
  "zombie.characters.SurvivorDesc:getSurname:identity observation on bodies"
)

# Look for the method on the class, then on each superclass in turn.
find_method() {
    local cls="$1" meth="$2" seen=0 sig=""
    while [ -n "$cls" ] && [ "$seen" -lt 12 ]; do
        local decl
        decl="$("$JAVA_HOME/bin/javap" -cp "$JAR" -public "$cls" 2>/dev/null || true)"
        [ -n "$decl" ] || return 1
        sig="$(printf '%s\n' "$decl" | grep -E "[ .]$meth\(" | head -1 | sed 's/^ *//;s/;$//')"
        if [ -n "$sig" ]; then printf '%s\t%s\n' "$cls" "$sig"; return 0; fi
        cls="$(printf '%s\n' "$decl" | head -2 | grep -oE 'extends [A-Za-z0-9_.]+' | head -1 | sed 's/extends //')"
        seen=$((seen + 1))
    done
    return 1
}

missing=0
for entry in "${CHECKS[@]}"; do
    cls="${entry%%:*}"; rest="${entry#*:}"; meth="${rest%%:*}"; why="${rest#*:}"
    if found="$(find_method "$cls" "$meth")"; then
        owner="${found%%$'\t'*}"; sig="${found#*$'\t'}"
        if [ "$owner" = "$cls" ]; then
            printf 'OK       %s.%s\n' "${cls##*.}" "$meth"
        else
            printf 'OK       %s.%s  (inherited from %s)\n' "${cls##*.}" "$meth" "${owner##*.}"
        fi
        [ "$verbose" -eq 1 ] && printf '           %s\n' "$sig"
    else
        printf 'MISSING  %s.%s\n' "${cls##*.}" "$meth"
        printf '           needed for: %s\n' "$why"
        missing=$((missing + 1))
    fi
done

echo
if [ "$missing" -eq 0 ]; then
    echo "all ${#CHECKS[@]} engine methods present in $(basename "$JAR")"
else
    echo "$missing of ${#CHECKS[@]} engine methods NOT FOUND. Anything relying on them"
    echo "fails silently in play: read() swallows the error and returns nil." >&2
    exit 1
fi
