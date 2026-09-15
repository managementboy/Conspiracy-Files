# B3 offline interpretation updates

`InterpretationUpdates` derives only existing generated document links after both endpoints are explicitly known. It stores a bounded relation ID and in-game timestamp, never duplicate document text. Discovery takes an explicit finite in-game time. Restore takes explicit current time and TTL; a relation is visible from its timestamp until, but excluding, the exact expiry.

The implementation is offline only. Generated bodies, discovery order, and unseen relationships remain unchanged.
