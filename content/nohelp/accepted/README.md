# accepted/

Written by `tools/nohelp_content/convert.lua`; do not edit by hand.
`<ticket-id>.json` holds the accepted rows' game fields (id, kind, pieces,
where, person, title, body, anchor); `sidecar/<ticket-id>.json` holds their
authoring fields keyed by row id. The derived clue file is rebuilt from here
(`convert.lua --rebuild`). Delivering a ticket again replaces its accepted
rows only when some of the new rows are accepted.
