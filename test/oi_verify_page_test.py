"""verify_workshop_page.py works offline on a saved page (the fixture is built from the local description; no network)."""
import html, os, re, subprocess, sys, tempfile, unittest

REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
TOOL = os.path.join(REPO, "tools", "ofinterest", "verify_workshop_page.py")
DESC = os.path.join(REPO, "tools", "workshop-ofinterest", "description.txt")


def steam_like_page(bbcode, title="Conspiracy Files: Of Interest"):
    body = html.escape(bbcode, quote=False)
    body = re.sub(r"\[url=([^\]]*)\](.*?)\[/url\]",
                  lambda m: '<a href="https://steamcommunity.com/linkfilter/?u=%s">%s</a>' % (m.group(1).replace(":", "%3A").replace("/", "%2F").replace("?", "%3F").replace("=", "%3D"), m.group(2)), body)
    body = re.sub(r"\[/?(h1|h2|list)\]", "<br>", body).replace("[*]", "<br>").replace("[/*]", "")
    body = re.sub(r"\[/?[a-z0-9]+\]", "", body)
    return ('<html><title>Steam Workshop::%s</title><div class="workshopItemTitle">%s</div>'
            '<div class="workshopItemDescription" id="highlightContent">%s</div><div id="x"></div></html>') % (title, title, body)


def run(path, *extra):
    return subprocess.run([sys.executable, TOOL, "--html", path] + list(extra), capture_output=True, text=True)


class Verify(unittest.TestCase):
    def write(self, text):
        f = tempfile.NamedTemporaryFile("w", suffix=".html", delete=False, encoding="utf8"); f.write(text); f.close()
        self.addCleanup(os.unlink, f.name); return f.name

    def test_matching_page_passes(self):
        r = run(self.write(steam_like_page(open(DESC, encoding="utf8").read())))
        self.assertEqual(r.returncode, 0, r.stdout + r.stderr)
        self.assertIn("title: Conspiracy Files: Of Interest", r.stdout)
        self.assertIn("required 3796373365 (It is of interest to me!): present", r.stdout)
        self.assertIn("required 3619862853 (ZombieBuddy): present", r.stdout)
        self.assertIn("-> match", r.stdout)

    def test_changed_text_is_reported(self):
        r = run(self.write(steam_like_page(open(DESC, encoding="utf8").read() + "\nA new sentence.")))
        self.assertEqual(r.returncode, 1); self.assertIn("DIFFERENT", r.stdout)

    def test_missing_required_item_is_reported(self):
        text = open(DESC, encoding="utf8").read().replace("3619862853", "1")
        r = run(self.write(steam_like_page(text)), "--description", self.write(text.replace("1", "1")))
        self.assertEqual(r.returncode, 1); self.assertIn("required 3619862853 (ZombieBuddy): MISSING", r.stdout)

    def test_unreadable_page_is_exit_2_not_a_crash(self):
        r = subprocess.run([sys.executable, TOOL, "--id", "0"], capture_output=True, text=True)
        self.assertEqual(r.returncode, 2)


if __name__ == "__main__":
    unittest.main()
