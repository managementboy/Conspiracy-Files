-- THE STANDALONE BATCH (Of Interest phase 6): numbers and switches only. target = scenes in all (story parts +
-- standalone), minTown = least scenes per town (a town with fewer usable buildings gets what it has),
-- hosts = which kinds of host besides buildings may carry a standalone note. A host kind that proves unreliable
-- in the real game stays false here and nothing else changes.
return {target=250,minTown=5,hosts={vehicle=true,body=false}}
