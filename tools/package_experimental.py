"""Deterministic experimental runtime and non-installable review archives."""
from __future__ import annotations
import argparse, hashlib, io, json, stat, zipfile
from pathlib import Path

VERSION="DEV-0.8.1-overnight-20260905"; PACKAGE_ROOT="ConspiracyFiles"; REVIEW_ROOT="ConspiracyFiles-review"; STAMP=(1980,1,1,0,0,0)
RUNTIME_42={"mod.info","README.md"}
REVIEW_FILES=("dev/next-phase/InvestigationFlow.lua","dev/next-phase/EncounterContext.lua","dev/next-phase/InterpretationUpdates.lua","dev/next-phase/EvidenceArchive.lua","dev/next-phase/ObjectBookmarks.lua","test/selected_generation.lua","test/investigation_flow.lua","test/evidence_archive.lua","test/object_bookmarks.lua","docs/management/SECOND_OFFLINE_BATCH.md","docs/research/SECOND_BATCH_FLOW.md","docs/research/SECOND_BATCH_CONTEXT.md","docs/research/SECOND_BATCH_UPDATES.md","docs/research/SECOND_BATCH_ARCHIVE.md","docs/research/SECOND_BATCH_BOOKMARKS.md","dev/next-phase/CampaignPolicy.lua","dev/next-phase/MultiCaseNotebook.lua","test/campaign_policy.lua","test/multi_case_notebook.lua","docs/research/NEXT_PHASE_CAMPAIGN_POLICY.md","docs/research/NEXT_PHASE_MULTI_CASE_NOTEBOOK.md","tools/package_experimental.py","test/package_experimental_test.py","dev/next-phase/PerfStats.lua","dev/next-phase/FirstClue.lua","dev/next-phase/LocationReadiness.lua","dev/next-phase/DraftCases.lua","test/perf_stats.lua","test/first_clue.lua","test/location_readiness.lua","test/draft_cases.lua","test/g2_faults.lua","tools/benchmark_next_phase.lua","docs/research/NEXT_PHASE_PERFORMANCE.md","docs/research/NEXT_PHASE_FIRST_CLUE.md","docs/research/NEXT_PHASE_LOCATION_READINESS.md","docs/research/NEXT_PHASE_DRAFT_CASES.md","docs/design/PLAYER_HELP_NEXT_PHASE.md","docs/management/G2_FAULT_MATRIX.md","docs/management/OVERNIGHT_2026-09-05.md","docs/management/EXPERIMENTAL_PACKAGE.md")
SHARED_DEPS=("mod/common/media/lua/shared/ConspiracyFiles/Generated/Generator.lua","mod/common/media/lua/shared/ConspiracyFiles/Scheduler.lua","mod/common/media/lua/shared/ConspiracyFiles/Validator.lua","mod/common/media/lua/shared/ConspiracyFiles/Content.lua","mod/common/media/lua/shared/ConspiracyFiles/Ids.lua","mod/common/media/lua/shared/ConspiracyFiles/Reach.lua","mod/common/media/lua/shared/ConspiracyFiles/Generated/Catalog.lua")
def sha256(data): return hashlib.sha256(data).hexdigest()
def safe_name(name): return bool(name) and "\\" not in name and not name.startswith("/") and not name.startswith(".") and ":" not in name and all(part not in ("", ".", "..") for part in name.split("/"))
def source_entries(repo):
    entries={}
    for relative in ("mod", "mod/42", "mod/common"):
        root=repo/relative
        if not root.is_dir() or root.is_symlink(): raise ValueError(f"missing or unsafe source root: {relative}")
    for path in sorted((repo/"mod/42").iterdir()):
        if path.is_symlink(): raise ValueError(f"symlink rejected: {path}")
        if path.is_file() and path.name in RUNTIME_42: entries[f"{PACKAGE_ROOT}/42/{path.name}"]=path.read_bytes()
    for path in sorted((repo/"mod/common").rglob("*")):
        relative=path.relative_to(repo/"mod/common")
        if any(part.startswith(".") or part in ("__pycache__","cache") for part in relative.parts): continue
        if path.is_symlink(): raise ValueError(f"symlink rejected: {path}")
        if path.is_file() and path.suffix==".lua": entries[f"{PACKAGE_ROOT}/common/{relative.as_posix()}"]=path.read_bytes()
    if f"{PACKAGE_ROOT}/42/mod.info" not in entries: raise ValueError("required PZ42 mod.info is missing")
    return entries
def review_entries(repo):
    entries={}
    for relative in REVIEW_FILES+SHARED_DEPS:
        path=repo/relative
        if not path.is_file() or path.is_symlink(): raise ValueError(f"missing or unsafe review input: {relative}")
        entries[f"{REVIEW_ROOT}/{relative}"]=path.read_bytes()
    note=("NOT INSTALLABLE. Review-only archive; it has no PZ mod root. g2_faults.lua exercises the runtime adapter and therefore requires the repository's mod runtime or the separately packaged experimental runtime. Shared files are included only for offline next-phase module review.\n")
    entries[f"{REVIEW_ROOT}/REVIEW_DEPENDENCIES.txt"]=note.encode()
    return entries
def manifest(entries, root, kind):
    return json.dumps({"label":"NOT INSTALLABLE REVIEW BUNDLE" if kind=="review" else "EXPERIMENTAL DEBUG-ONLY — NOT A RELEASE","package":root,"kind":kind,"supportedObservedBuild":"42.20.4" if kind=="runtime" else None,"version":VERSION,"files":[{"path":n,"sha256":sha256(entries[n]),"bytes":len(entries[n])} for n in sorted(entries)]},sort_keys=True,separators=(",",":"),ensure_ascii=True).encode()
def info(name):
    item=zipfile.ZipInfo(name,STAMP); item.compress_type=zipfile.ZIP_DEFLATED; item.external_attr=(stat.S_IFREG|0o644)<<16; item.create_system=3; return item
def archive_bytes(entries,root,kind):
    entries=dict(entries); entries[f"{root}/MANIFEST.json"]=manifest(entries,root,kind); out=io.BytesIO()
    with zipfile.ZipFile(out,"w",compression=zipfile.ZIP_DEFLATED,compresslevel=9,strict_timestamps=True) as z:
        for name in sorted(entries): z.writestr(info(name),entries[name])
    return out.getvalue()
def allowed_runtime(name): return name in {f"{PACKAGE_ROOT}/42/{x}" for x in RUNTIME_42} or (name.startswith(f"{PACKAGE_ROOT}/common/") and name.endswith(".lua"))
def verify_bytes(blob,kind="runtime"):
    root=PACKAGE_ROOT if kind=="runtime" else REVIEW_ROOT; manifest_name=f"{root}/MANIFEST.json"
    with zipfile.ZipFile(io.BytesIO(blob)) as z:
        infos=z.infolist(); names=[x.filename for x in infos]
        if len(names)!=len(set(names)) or names!=sorted(names) or any(not safe_name(n) for n in names): raise ValueError("unsafe, duplicate, or unordered archive path")
        if names.count(manifest_name)!=1 or (f"{PACKAGE_ROOT}/42/mod.info" not in names if kind=="runtime" else False): raise ValueError("required archive root content missing")
        if kind=="runtime" and any(n!=manifest_name and not allowed_runtime(n) for n in names): raise ValueError("unallowed runtime archive path")
        if kind=="review" and any(not n.startswith(root+"/") for n in names): raise ValueError("review bundle contains non-review root")
        data=json.loads(z.read(manifest_name)); rows=data.get("files",[]); listed={}
        for row in rows:
            if not isinstance(row,dict) or row.get("path") in listed: raise ValueError("duplicate or invalid manifest row")
            listed[row["path"]]=row
        expected=[n for n in names if n!=manifest_name]
        if data.get("package")!=root or data.get("kind")!=kind or data.get("version")!=VERSION or sorted(listed)!=expected: raise ValueError("manifest identity or listing invalid")
        if kind=="runtime" and (data.get("supportedObservedBuild")!="42.20.4" or "DEBUG-ONLY" not in data.get("label","")): raise ValueError("runtime identity invalid")
        if kind=="review" and "NOT INSTALLABLE" not in data.get("label",""): raise ValueError("review identity invalid")
        for n in expected:
            content=z.read(n); row=listed[n]
            if row.get("sha256")!=sha256(content) or row.get("bytes")!=len(content): raise ValueError(f"manifest hash mismatch: {n}")
    return data
def build(repo,output,kind="runtime"):
    if output.exists(): raise FileExistsError(f"refusing to overwrite: {output}")
    root=PACKAGE_ROOT if kind=="runtime" else REVIEW_ROOT; entries=source_entries(repo) if kind=="runtime" else review_entries(repo)
    output.parent.mkdir(parents=True,exist_ok=True); output.write_bytes(archive_bytes(entries,root,kind)); verify_bytes(output.read_bytes(),kind); return output
def main():
    p=argparse.ArgumentParser(); p.add_argument("--repo",type=Path,default=Path.cwd()); p.add_argument("--output",type=Path); p.add_argument("--verify",type=Path); p.add_argument("--review",action="store_true"); a=p.parse_args(); kind="review" if a.review else "runtime"
    if bool(a.output)==bool(a.verify): p.error("supply exactly one of --output or --verify")
    if a.verify: verify_bytes(a.verify.read_bytes(),kind); print(f"verified {a.verify}")
    else: print(build(a.repo,a.output,kind))
if __name__=="__main__": main()
