#!/usr/bin/env python3
"""Release-pipeline regression tests; requires a clean Git source tree."""

from __future__ import annotations

import importlib.util
from pathlib import Path
import tempfile
import unittest
import zipfile


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location("cf_release_pipeline", ROOT / "tools" / "release_pipeline.py")
assert SPEC and SPEC.loader
pipeline = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(pipeline)


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


if __name__ == "__main__":
    unittest.main()

