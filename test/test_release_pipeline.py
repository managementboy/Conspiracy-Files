#!/usr/bin/env python3
"""Release-pipeline regression tests; requires a clean Git source tree."""

from __future__ import annotations

import importlib.util
from pathlib import Path
import subprocess
import tempfile
import unittest
import zipfile


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location("cf_release_pipeline", ROOT / "tools" / "release_pipeline.py")
assert SPEC and SPEC.loader
pipeline = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(pipeline)

RANGE_SPEC = importlib.util.spec_from_file_location(
    "cf_changed_range",
    ROOT / "tools" / "check_changed_range.py",
)
assert RANGE_SPEC and RANGE_SPEC.loader
changed_range = importlib.util.module_from_spec(RANGE_SPEC)
RANGE_SPEC.loader.exec_module(changed_range)


class ReleasePipelineSpec(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.config = pipeline.load_config()
        cls.commit = pipeline.require_clean_source()
        cls.files = pipeline.production_files(cls.config)
        pipeline.scan_payload_sources(cls.files)

    def test_builds_twice_with_identical_manifests(self) -> None:
        with tempfile.TemporaryDirectory(prefix="cf-release-test-") as temporary:
            first = Path(temporary) / "first"
            second = Path(temporary) / "second"
            pipeline.build_once(first, self.files, self.config, self.commit)
            pipeline.build_once(second, self.files, self.config, self.commit)
            self.assertEqual(pipeline.tree_manifest(first), pipeline.tree_manifest(second))
            self.assertEqual(
                (first / "SHA256SUMS").read_bytes(),
                (second / "SHA256SUMS").read_bytes(),
            )

    def test_channel_wrappers_contain_the_same_payload(self) -> None:
        with tempfile.TemporaryDirectory(prefix="cf-release-test-") as temporary:
            output = Path(temporary) / "output"
            pipeline.build_once(output, self.files, self.config, self.commit)
            version = self.config["version"]
            github = output / f"Conspiracy-Files-{version}-github.zip"
            workshop = output / f"Conspiracy-Files-{version}-workshop.zip"
            with zipfile.ZipFile(github) as github_zip, zipfile.ZipFile(workshop) as workshop_zip:
                github_payload = {
                    name.removeprefix("ConspiracyFiles/"): github_zip.read(name)
                    for name in github_zip.namelist()
                }
                workshop_payload = {
                    name.removeprefix("Contents/mods/ConspiracyFiles/"): workshop_zip.read(name)
                    for name in workshop_zip.namelist()
                }
            self.assertEqual(github_payload, workshop_payload)
            self.assertIn("release-metadata.json", github_payload)
            self.assertIn("SHA256SUMS", github_payload)

    def test_scanner_rejects_credentials_and_machine_paths(self) -> None:
        rejected = (
            b'api_key = "not-a-real-secret-value"',
            b"/home/alice/Zomboid/Saves/test",
            b"C:\\Users\\alice\\Zomboid\\Logs\\console.txt",
        )
        with tempfile.TemporaryDirectory(prefix="cf-release-scan-") as temporary:
            candidate = Path(temporary) / "candidate.txt"
            for content in rejected:
                candidate.write_bytes(content)
                with self.assertRaises(pipeline.ReleaseError):
                    pipeline.scan_file_content(candidate, candidate.name)

    def test_module_gate_rejects_dots_anywhere_in_conspiracy_files_ids(self) -> None:
        rejected = (
            'require("ConspiracyFiles.Bootstrap")',
            'require("ConspiracyFiles/Adapters.PZ")',
            "require 'ConspiracyFiles/Deep/Nested.Module'",
        )
        for source in rejected:
            with self.subTest(source=source), self.assertRaises(pipeline.ReleaseError):
                pipeline.validate_module_identifiers(source, "candidate.lua")
        pipeline.validate_module_identifiers(
            'require("ConspiracyFiles/Adapters/PZ")',
            "candidate.lua",
        )

    def test_workflow_ranges_cover_pr_push_new_branch_and_manual_dispatch(self) -> None:
        with tempfile.TemporaryDirectory(prefix="cf-workflow-range-") as temporary:
            repository = Path(temporary)

            def run_git(*arguments: str) -> subprocess.CompletedProcess[str]:
                return subprocess.run(
                    ["git", *arguments], cwd=repository, check=True, text=True,
                    stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                )

            def commit(message: str) -> str:
                run_git("add", ".")
                run_git("commit", "-q", "-m", message)
                return run_git("rev-parse", "HEAD").stdout.strip()

            run_git("init", "-q")
            run_git("config", "user.name", "Conspiracy-Files workflow test")
            run_git("config", "user.email", "workflow-test@example.invalid")
            (repository / "base.txt").write_text("clean\n", encoding="utf-8")
            base = commit("base")
            (repository / "bad.txt").write_text("trailing whitespace \n", encoding="utf-8")
            bad = commit("bad earlier commit")
            (repository / "later.txt").write_text("clean later commit\n", encoding="utf-8")
            head = commit("clean final commit")

            one_commit_push = changed_range.run_check(repository, "push", head, before=bad)
            self.assertEqual(0, one_commit_push.returncode)
            multi_commit_push = changed_range.run_check(repository, "push", head, before=base)
            self.assertNotEqual(0, multi_commit_push.returncode)
            self.assertIn("trailing whitespace", multi_commit_push.stdout)

            pull_request = changed_range.run_check(
                repository,
                "pull_request",
                head,
                pull_request_base=base,
            )
            self.assertNotEqual(0, pull_request.returncode)
            new_branch = changed_range.run_check(
                repository,
                "push",
                bad,
                before=changed_range.ZERO_SHA,
            )
            self.assertNotEqual(0, new_branch.returncode)
            with self.assertRaises(changed_range.RangeError):
                changed_range.run_check(repository, "push", head, before="")
            manual = changed_range.run_check(repository, "workflow_dispatch", head)
            self.assertEqual(0, manual.returncode)


if __name__ == "__main__":
    unittest.main()
