"""Of Interest owner approval gate in tools/publish_workshop.sh (never uploads: every case refuses or is a dry run)."""
import hashlib, os, subprocess, tempfile, unittest

REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
SCRIPT = os.path.join(REPO, "tools", "publish_workshop.sh")
DESC = os.path.join(REPO, "tools", "workshop-ofinterest", "description.txt")
REAL_APPROVAL = os.path.join(REPO, "tools", "workshop-ofinterest", "APPROVED_BY_OWNER")


def run(args, approval_file):
    env = dict(os.environ, CF_OI_APPROVAL_FILE=approval_file, STEAMCMD="/nonexistent/steamcmd")
    return subprocess.run(["bash", SCRIPT, "--mod", "ofinterest"] + args, cwd=REPO, env=env,
                          capture_output=True, text=True, timeout=300)


class Gate(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.mkdtemp()
        self.f = os.path.join(self.tmp, "APPROVED_BY_OWNER")
        self.h = hashlib.sha256(open(DESC, "rb").read()).hexdigest()

    def test_owner_file_if_present_is_for_the_current_text(self):
        # The owner creates this file (2026-10-08); we never write it. If the page text changes it goes stale.
        if os.path.exists(REAL_APPROVAL):
            self.assertIn(self.h, open(REAL_APPROVAL).read().split("\n")[0], "page text changed: the owner must approve again")

    def test_dry_run_reports_missing_stale_ok_and_the_hash(self):
        r = run(["--dry-run"], self.f); self.assertEqual(r.returncode, 0, r.stderr)
        self.assertIn("approval: missing", r.stdout); self.assertIn(self.h, r.stdout)
        open(self.f, "w").write("0" * 64 + "\n")
        self.assertIn("approval: stale", run(["--dry-run"], self.f).stdout)
        open(self.f, "w").write("approved " + self.h + " by the owner\nlater lines\n")
        self.assertIn("approval: ok", run(["--dry-run"], self.f).stdout)
        open(self.f, "w").write("nothing here\n" + self.h + "\n")  # the hash must be on the FIRST line
        self.assertIn("approval: stale", run(["--dry-run"], self.f).stdout)

    def test_real_upload_refused_without_current_approval(self):
        for content in (None, "0" * 64 + "\n"):
            if content is not None: open(self.f, "w").write(content)
            r = run(["--owner-override-boot-check", "test"], self.f)
            self.assertEqual(r.returncode, 1, r.stdout + r.stderr)
            self.assertIn("upload refused", r.stderr)
            self.assertNotIn("uploading as", r.stdout)


if __name__ == "__main__":
    unittest.main()
