"""Of Interest phase 7: regenerating Generated/Contract.lua from the dependency's code is byte-identical when
nothing changed, and the baseline generator agrees with the shipped Baseline.lua. Skipped (not a pass) when the
dependency is not installed on this machine."""
import os, subprocess, sys, unittest

ROOT = os.path.join(os.path.dirname(__file__), "..")
sys.path.insert(0, os.path.join(ROOT, "tools", "ofinterest"))
import gen_contract


class ContractTest(unittest.TestCase):
    def setUp(self):
        if not os.path.isdir(gen_contract.DEFAULT):
            self.skipTest("dependency not installed here")

    def test_contract_is_byte_identical(self):
        shipped = open(os.path.normpath(gen_contract.OUT), encoding="utf-8").read()
        self.assertEqual(gen_contract.generate(gen_contract.DEFAULT), shipped)

    def test_generation_is_deterministic(self):
        self.assertEqual(gen_contract.generate(gen_contract.DEFAULT), gen_contract.generate(gen_contract.DEFAULT))

    def test_baseline_is_identical(self):
        r = subprocess.run(["lua5.1", "tools/ofinterest/gen_baseline.lua", "--check"], cwd=ROOT,
                           capture_output=True, text=True)
        self.assertEqual(r.returncode, 0, r.stdout + r.stderr)


if __name__ == "__main__":
    unittest.main()
