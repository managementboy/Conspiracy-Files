-- What goes on the paper, and what does not.
--
-- The owner found a diary in play on 2026-09-09 with forty blank pages while
-- the notebook held its text. An object that contradicts its own record is
-- worse than one that cannot be opened at all.
--
-- A notebook entry is three things: a description of the object, the words
-- written on it, and what the survivor makes of them. Only the middle belongs
-- on the object. A document carrying its own interpretation would be a very
-- strange document.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local M = require("ConspiracyFiles/Generated/DocumentPages")

local body = table.concat({
    "WHAT YOU FOUND",
    "A creased carbon copy, its lower edge stained by a wet cup.",
    "",
    "County Equipment Service",
    "July 2, 1993",
    "Record: R-291",
    "Route copy: 114 S Main St to 303 Perrine St.",
    "",
    "In the margin: 'Driver asked whether the contents were on the manifest.'",
    "",
    "WHAT IT MIGHT MEAN",
    "Someone recorded a transfer without recording what was inside.",
    "",
    "MAP NOTE",
    "Finding location remembered.",
    "",
    "PHYSICAL OBJECT",
    "Carried.",
}, "\n")

local text = M.text(body)
assert(text, 'a document with content must produce text')

-- The document's own words are there.
assert(text:find('County Equipment Service', 1, true), 'the record must be on the paper')
assert(text:find('Route copy: 114 S Main St', 1, true), 'the routing must be on the paper')
assert(text:find('In the margin', 1, true), 'the margin note is part of the document')

-- Ours are not.
assert(not text:find('WHAT YOU FOUND', 1, true), 'the heading must not reach the paper')
assert(not text:find('creased carbon copy', 1, true),
    'the description of the object must not be written on the object')
assert(not text:find('WHAT IT MIGHT MEAN', 1, true), 'our interpretation must not reach the paper')
assert(not text:find('Someone recorded a transfer', 1, true),
    'a document does not contain the reader is conclusions about it')
assert(not text:find('MAP NOTE', 1, true), 'map bookkeeping is not part of the document')
assert(not text:find('PHYSICAL OBJECT', 1, true), 'tracking state is not part of the document')

-- Pages are whole and bounded.
local pages = M.pages(body)
assert(#pages >= 1, 'a document with text must produce at least one page')
assert(#pages <= M.MAX_PAGES, 'page count must be bounded')
for i, page in ipairs(pages) do
    assert(#page <= M.MAX_PAGE_CHARS, 'page ' .. i .. ' exceeds the page limit')
    assert(page:find('%S'), 'page ' .. i .. ' must not be blank')
end

-- A long document splits without cutting a word in half.
local long = "WHAT YOU FOUND\nA thick file.\n\n" .. string.rep("Longwinded clause about the shipment. ", 120)
local many = M.pages(long)
assert(#many > 1, 'a long document must span several pages, got ' .. #many)
-- Reassembling the pages must give back the text. That is the real
-- requirement: a split that loses a word, or cuts one in half, fails here
-- however tidy each page looks on its own.
local function flatten(str) return (str:gsub('%s+', ' '):gsub('^ ', ''):gsub(' $', '')) end
assert(flatten(table.concat(many, ' ')) == flatten(M.text(long)),
    'the pages must reassemble into exactly the document text')

-- Nothing at all: no pages, no crash, no blank page written to an item.
for _, empty in ipairs({ nil, '', 'WHAT YOU FOUND\nJust a description.', 42 }) do
    local ok, result = pcall(M.pages, empty)
    assert(ok, 'malformed input must not throw')
    assert(#result == 0, 'nothing to write means no pages')
end

print('PASS document pages: the document is written on the object, the '
    .. 'description and interpretation are not, and pages are whole and bounded')
