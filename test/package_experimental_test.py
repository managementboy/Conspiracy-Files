import importlib.util, io, json, unittest, zipfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
S=importlib.util.spec_from_file_location("package_experimental",ROOT/"tools"/"package_experimental.py"); P=importlib.util.module_from_spec(S); S.loader.exec_module(P)
class PackageExperimentalTest(unittest.TestCase):
 def test_reproducible_manifest_tamper_and_allowlist(self):
  entries=P.source_entries(ROOT); self.assertEqual(P.archive_bytes(entries,P.PACKAGE_ROOT,"runtime"),P.archive_bytes(entries,P.PACKAGE_ROOT,"runtime"))
  blob=P.archive_bytes(entries,P.PACKAGE_ROOT,"runtime"); self.assertEqual(P.verify_bytes(blob)["supportedObservedBuild"],"42.20.4")
  self.assertTrue(all(n.endswith(".lua") or n.endswith("mod.info") or n.endswith("README.md") for n in entries)); self.assertFalse(P.allowed_runtime("ConspiracyFiles/common/cache/secret.txt"))
  out=io.BytesIO()
  with zipfile.ZipFile(io.BytesIO(blob)) as src,zipfile.ZipFile(out,"w") as dst:
   for n in src.namelist(): dst.writestr(n,b"tampered" if n.endswith("mod.info") else src.read(n))
  with self.assertRaises(ValueError): P.verify_bytes(out.getvalue())
 def test_malicious_paths_and_duplicate_manifest_rows_reject(self):
  entries={"ConspiracyFiles/42/mod.info":b"x"}; good=P.archive_bytes(entries,P.PACKAGE_ROOT,"runtime")
  with zipfile.ZipFile(io.BytesIO(good)) as z: data=json.loads(z.read("ConspiracyFiles/MANIFEST.json")); content=z.read("ConspiracyFiles/42/mod.info")
  data["files"].append(dict(data["files"][0])); out=io.BytesIO()
  with zipfile.ZipFile(out,"w") as z: z.writestr("ConspiracyFiles/42/mod.info",content); z.writestr("ConspiracyFiles/MANIFEST.json",json.dumps(data))
  with self.assertRaises(ValueError): P.verify_bytes(out.getvalue())
  out=io.BytesIO()
  with zipfile.ZipFile(out,"w") as z: z.writestr("ConspiracyFiles/42/mod.info",content); z.writestr("../ConspiracyFiles/MANIFEST.json",b"{}")
  with self.assertRaises(ValueError): P.verify_bytes(out.getvalue())
 def test_review_reproducibility(self):
  entries=P.review_entries(ROOT)
  one=P.archive_bytes(entries,P.REVIEW_ROOT,"review")
  self.assertEqual(one,P.archive_bytes(entries,P.REVIEW_ROOT,"review"))
  self.assertEqual(P.verify_bytes(one,"review")["kind"],"review")
  self.assertFalse(any(n.endswith("mod.info") for n in entries))
if __name__=="__main__": unittest.main()
