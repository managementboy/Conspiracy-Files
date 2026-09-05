"""Archive reproducible offline checks; never operates Project Zomboid."""
from pathlib import Path
import argparse
import hashlib
import json
import re
import subprocess

parser = argparse.ArgumentParser()
parser.add_argument('--lua-dir', type=Path, required=True)
args = parser.parse_args()
root = Path(__file__).resolve().parent.parent
out = root / 'docs/management/evidence/2026-09-05-correction'
out.mkdir(parents=True, exist_ok=True)

def run(command):
    result = subprocess.run(command, cwd=root, capture_output=True, text=True, encoding='utf-8', errors='replace')
    if result.returncode:
        raise RuntimeError(result.stdout + result.stderr)
    return result.stdout + result.stderr

suite = run([str(args.lua_dir / 'lua5.1.exe'), 'test/run.lua'])
(out / 'lua51-suite.txt').write_text(suite, encoding='utf-8')
files = sorted(p for folder in ['mod', 'dev', 'test'] for p in (root / folder).rglob('*.lua'))
for file in files:
    run([str(args.lua_dir / 'luac5.1.exe'), '-p', str(file)])
syntax = f'{len(files)} Lua files parsed; zero syntax failures. No engine execution.\n'
(out / 'lua51-syntax.txt').write_text(syntax + '\n'.join(str(p.relative_to(root)).replace('\\', '/') for p in files) + '\n', encoding='utf-8')

content = (root / 'mod/common/media/lua/shared/ConspiracyFiles/Content.lua').read_text(encoding='utf-8-sig')
baseline = run(['git', 'show', 'de4439a:mod/common/media/lua/shared/ConspiracyFiles/Content.lua'])
def bodies(source):
    return [m[1] for m in re.findall(r'bodyText\s*=\s*\[(=*)\[(.*?)\]\1\]', source, re.S)]
current_bodies = bodies(content)
assert len(current_bodies) == 6 and current_bodies == bodies(baseline), 'authored bodies changed from preserved checkpoint'
fixture = (root / 'test/fixtures/THREAD-001-DEAD-AIR.md').read_text(encoding='utf-8-sig')
fixture_bodies = re.findall(r'```text\n(.*?)\n```', fixture, re.S)
assert len(fixture_bodies) >= 6 and current_bodies == fixture_bodies[:6], 'fixture bodies differ'
(out / 'content-integrity.txt').write_text('Six bodies unchanged from de4439a and identical to fixture text (LF-normalized).\n', encoding='utf-8')

source_files = sorted(p for folder in ['mod', 'dev/t11-adapter-integration', 'dev/t12-ui-runtime'] for p in (root / folder).rglob('*') if p.is_file() and (p.suffix == '.lua' or p.name == 'mod.info'))
manifest = {str(p.relative_to(root)).replace('\\', '/'): hashlib.sha256(p.read_bytes()).hexdigest() for p in source_files}
(out / 'candidate-sha256.json').write_text(json.dumps(manifest, indent=2) + '\n', encoding='utf-8')
diff = run(['git', 'diff', '--check'])
(out / 'repository-check.txt').write_text('git diff --check: PASS (line-ending conversion warnings are informational).\n' + diff, encoding='utf-8')
readme = f'''# DEV-0.6 offline evidence — 2026-09-05

Generated with tools/verify_candidate.py and PUC Lua 5.1.5. No PZ input, launch, deployment or live verdict.

- [Suite](lua51-suite.txt): {suite.strip().splitlines()[-1]}.
- [Syntax](lua51-syntax.txt): {len(files)} Lua files, no syntax failures.
- [Content](content-integrity.txt): six authored bodies preserved and fixture-aligned.
- [Source hashes](candidate-sha256.json): raw working-file SHA-256 for candidate mod and both wrappers; compare deployed files before attendance. If a checkout converts line endings, record its deployed hashes separately.
- [Repository check](repository-check.txt): diff whitespace check.

Historical takeover evidence remains in the sibling 2026-09-05-takeover directory. Mock/synthetic labels are deliberate: these results cannot accept E01–E13, rendering, focus, controller, native persistence or real frame timing.
'''
(out / 'README.md').write_text(readme, encoding='utf-8')
print(suite.strip().splitlines()[-1])
print(syntax.strip())
print('Six authored bodies preserved; fixture comparison and diff check passed.')
