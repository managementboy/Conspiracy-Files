#!/usr/bin/env python3
"""Best-effort post-upload check of the Of Interest Workshop page (one polite HTTP request, or a saved HTML file).

  tools/ofinterest/verify_workshop_page.py [--id ID | --html FILE] [--description tools/workshop-ofinterest/description.txt]

Prints the title, whether the required items (3796373365, 3619862853) are linked, a visibility hint, and whether the
page description matches the local description.txt (hash of the plain text, BBCode removed on our side, whitespace
collapsed). Exit 0 when everything matches, 1 when something does not, 2 when the page could not be read.
Never prints note text; the page is ours and contains none.
"""
import argparse, hashlib, html, os, re, sys, urllib.request

REQUIRED = {"3796373365": "It is of interest to me!", "3619862853": "ZombieBuddy"}
REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
DEFAULT_ID_FILE = os.path.join(REPO, "tools", "workshop-ofinterest", "published_file_id")
DEFAULT_DESC = os.path.join(REPO, "tools", "workshop-ofinterest", "description.txt")


def plain_from_bbcode(text):
    text = re.sub(r"\[url=[^\]]*\]", "", text)
    text = re.sub(r"\[/?[a-z0-9*]+\]", " ", text)
    text = re.sub(r"\[\*\]", " ", text)
    return re.sub(r"\s+", " ", html.unescape(text)).strip()


def plain_from_html(fragment):
    fragment = re.sub(r"<br\s*/?>", " ", fragment)
    fragment = re.sub(r"<[^>]+>", " ", fragment)
    return re.sub(r"\s+", " ", html.unescape(fragment)).strip()


def squash(text):
    """Compare on letters and digits only, so link rendering and spacing differences do not matter."""
    return re.sub(r"[^0-9A-Za-z]+", "", text).lower()


def analyse(page, local_description):
    title = re.search(r'class="workshopItemTitle">(.*?)<', page, re.S)
    desc = re.search(r'<div class="workshopItemDescription"[^>]*>(.*?)</div>\s*(?:<div class="workshopItemDescriptionTitle|<div id=|</div>)', page, re.S)
    if not desc:
        desc = re.search(r'<div class="workshopItemDescription"[^>]*>(.*?)</div>', page, re.S)
    desc_html = desc.group(1) if desc else ""
    ids_found = {i: (i in desc_html) for i in REQUIRED}
    page_text = plain_from_html(desc_html)
    want = squash(plain_from_bbcode(local_description))
    have = squash(page_text)
    if "unlisted" in page.lower() and "visibility" in page.lower():
        vis = "page mentions unlisted"
    elif "This item is currently unlisted" in page or "Unlisted" in page:
        vis = "unlisted (page says so)"
    elif "private" in page.lower() and "You must be logged in" in page:
        vis = "private or hidden from visitors"
    else:
        vis = "no marker found (a public page shows none; unlisted shows only to the owner when logged in)"
    return {
        "title": plain_from_html(title.group(1)) if title else None,
        "required": ids_found,
        "visibility": vis,
        "description_found": bool(desc),
        "page_hash": hashlib.sha256(have.encode()).hexdigest(),
        "local_hash": hashlib.sha256(want.encode()).hexdigest(),
        "description_matches": bool(desc) and have == want,
    }


def main(argv=None):
    ap = argparse.ArgumentParser()
    ap.add_argument("--id"); ap.add_argument("--html"); ap.add_argument("--description", default=DEFAULT_DESC)
    a = ap.parse_args(argv)
    local = open(a.description, encoding="utf8").read()
    if a.html:
        page = open(a.html, encoding="utf8", errors="ignore").read()
    else:
        item = a.id or (open(DEFAULT_ID_FILE).read().strip() if os.path.exists(DEFAULT_ID_FILE) else "")
        if not item or item == "0":
            print("no published item id (tools/workshop-ofinterest/published_file_id missing)"); return 2
        req = urllib.request.Request("https://steamcommunity.com/sharedfiles/filedetails/?id=" + item,
                                     headers={"User-Agent": "Mozilla/5.0 (X11; Linux x86_64) of-interest-verify"})
        try:
            page = urllib.request.urlopen(req, timeout=30).read().decode("utf8", "ignore")
        except Exception as e:  # best effort
            print("could not fetch the page:", e); return 2
    r = analyse(page, local)
    print("title:", r["title"])
    for i, name in REQUIRED.items():
        print("required %s (%s): %s" % (i, name, "present" if r["required"][i] else "MISSING"))
    print("visibility:", r["visibility"])
    print("description found on page:", r["description_found"])
    print("description hash page/local: %s / %s -> %s" % (r["page_hash"][:16], r["local_hash"][:16],
          "match" if r["description_matches"] else "DIFFERENT"))
    ok = r["title"] and all(r["required"].values()) and r["description_matches"]
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
