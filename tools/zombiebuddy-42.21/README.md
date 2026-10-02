# ZombieBuddy for Build 42.21: the local fix

On Build 42.21, ZombieBuddy 2.3.2 (Workshop 3619862853) loads **no Java mods**.
The watermark says "No active Java mods", so No Help's `NoHelpScenes.jar`
scene listener never runs. Upstream issue zed-0xff/ZombieBuddy#53: 42.21
changed `ZomboidFileSystem.loadMods(ArrayList<String>)` to
`loadMods(List<String>)`, and ZombieBuddy's hook no longer matches anything.
The upstream fix is PR #56, unmerged as of 2026-10-02.

This folder rebuilds the agent with that fix. Built and verified on the
owner's Windows machine on 2026-09-30. With it, ZombieBuddy loads both Java
mods, `NoHelpScenes.jar` passes ZBS verification, and all 143 scene patches
apply on 42.21.0.

**Delete this workaround once ZombieBuddy ships a 42.21 fix on the Workshop.**

## What changed

`pr56-on-v2.3.3.patch`: PR #56 ported by hand onto the **v2.3.3** release
tag. PR #56 targets master, which is 124 commits ahead and mid-refactor, so
its diff does not apply to the tag. The port changes the same five
signatures from `ArrayList<String>` to `List<String>`: in `Loader.java`,
`autoFixModOrder`, `moveModToIndex` and `loadMods`; in
`Patch_ZomboidFileSystem.java`, `Patch_loadMods2.enter` and `exit`. Types
only: no new behaviour, network or file access. `ArrayList` is a `List`, so
the hook still matches 42.20.

## Rebuild (Windows)

Needs git, a JDK (Zulu 25 was used; `JAVA_HOME` already points at it) and
the game installed. Run in PowerShell.

```powershell
# 1. Source, in a short path: the repo exceeds Windows' 260-character path limit otherwise
git -c core.longpaths=true clone https://github.com/zed-0xff/ZombieBuddy.git C:\Users\$env:USERNAME\zbsrc
Set-Location C:\Users\$env:USERNAME\zbsrc
git config core.longpaths true
git checkout -b pr56-on-v2.3.3 v2.3.3
git apply "<Conspiracy-Files>\tools\zombiebuddy-42.21\pr56-on-v2.3.3.patch"

# 2. Gradle 9.3.1. The repo ships no gradle-wrapper.jar; check the SHA-256 against
#    https://services.gradle.org/distributions/gradle-9.3.1-bin.zip.sha256
#    (b266d5ff6b90eada6dc3b20cb090e3731302e553a27c5d3e4df1f0d76beaff06)
Invoke-WebRequest https://services.gradle.org/distributions/gradle-9.3.1-bin.zip -OutFile g.zip
(Get-FileHash g.zip).Hash
Expand-Archive g.zip .gradle-dist

# 3. Build the agent jar against the installed game
$env:Path="$env:JAVA_HOME\bin;$env:Path"
Set-Location java
& ..\.gradle-dist\gradle-9.3.1\bin\gradle.bat --no-daemon shadowJar "-PgameClasspath=C:/Program Files (x86)/Steam/steamapps/common/ProjectZomboid/projectzomboid.jar"
Get-ChildItem build\libs   # ZombieBuddy.jar, about 12.4 MB
```

Gradle needs a localhost socket for its worker process. Claude Code's sandbox
blocks that, so the owner runs step 3 in their own terminal.

## Check before installing

`javap` (in the JDK) should show `List`, not `ArrayList`:

```powershell
javap -cp build\libs\ZombieBuddy.jar 'me.zed_0xff.zombie_buddy.patches.Patch_ZomboidFileSystem$Patch_loadMods2'
# public static void enter(java.util.List<java.lang.String>, long);
```

The manifest reports `Implementation-Version: 2.3.3`. Compared with the
official jar, the only missing files are the author's jar signature
(`META-INF/ME_ZED_0.RSA` and `.SF`). A local build cannot carry it, and the
agent is loaded by the launch option, not by signature. The 2026-09-30 build
had SHA-256 `0a71027466ebbb207a2df3b9773f2b6ae3f8a10e0d7c227c40463dc6f5e70e77`.
A rebuild differs by its timestamps.

## Install and undo

Close the game first.

```powershell
$pz="C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid"
Copy-Item "$pz\ZombieBuddy.jar" "$pz\ZombieBuddy.jar.2.3.2-backup"   # once
Copy-Item C:\Users\$env:USERNAME\zbsrc\java\build\libs\ZombieBuddy.jar "$pz\ZombieBuddy.jar"

# undo
Copy-Item "$pz\ZombieBuddy.jar.2.3.2-backup" "$pz\ZombieBuddy.jar"
```

The launch option stays `-agentlib:zbNative --` (add `-debug` after `--` for
the Lua console). `zbNative.dll` does not change. Steam's "verify integrity of
game files" may remove or replace the jar; re-copy it if Java mods stop
loading.

## Confirm in `Zomboid\console.txt`

```
[ZB] ZomboidFileSystem.loadMods(... mods) ...
[ZB] java mod list to load:
[ZB]     conspiracyfiles.nohelp    ...\NoHelpScenes.jar
[ZB] ZBS verification valid for ...\NoHelpScenes.jar
[ZB] added to classpath: ...\NoHelpScenes.jar
[ZB] Found patch class: conspiracyfiles.nohelp.ScenePatches$P000   (143 of these)
```

If the `loadMods(...)` line is missing, the hook did not match: the agent in
the game folder is not this build.
