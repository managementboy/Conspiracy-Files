---
title: "Java"
source: "https://pzwiki.net/wiki/Java"
source_revision: "https://pzwiki.net/w/index.php?title=Java&oldid=1457123"
source_last_edited: "Last modified\n\t\t         This page was last edited on 15 August 2026, at 14:04."
retrieved: "2026-09-15T11:39:37.383Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 7
source_tables: 0
---

# Java

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.0).

Help by adding any missing content. [Edit](Java.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

Java

![Article illustration](../assets/bce18a984901240b71cd.png)

Links

![Article illustration](../assets/d9057a9f19548a000bdb.png)

Oracle's JDK download

![Article illustration](../assets/d9057a9f19548a000bdb.png)

OpenJDK download

Relevant pages

![Article illustration](../assets/e46a6c94fc5172ad3956.png)

Decompiling game code

![Article illustration](../assets/e46a6c94fc5172ad3956.png)

[Startup parameters](../foundations/Startup_parameters.md)

**Java** modding means writing mods directly in Java, the language the game engine itself is written in. It reaches far more of the game than [Lua modding](../lua-api/Lua_API.md) can, but it's harder to start with, and it comes with two catches:

- The first is installation. The game never loads Java mods by itself, not even from the Workshop.
- The second is maintenance. A Java mod is compiled against one specific build. When an update changes a class you replaced, your copy still holds the old code and has to be rebuilt from the freshly decompiled source. Expect to update a Java mod far more often than a Lua one.

[Mod loaders](Java.md#Java_mod_loaders) soften both limitations, which is why it is preferable to use them rather than doing direct class replacements.

If you are new to modding, or to programming in general, it is recommended to start with [Lua modding](../lua-api/Lua_API.md) first.

<a id="Java_mod_loaders"></a>

## Java mod loaders

You can load as many custom class files as you like, but they do nothing until the game actually reaches your code. Without a mod loader, the only way to get there is to replace a vanilla class outright, so only one mod can ever replace a given class.

Mod loaders let several mods patch the same class instead of replacing it, which clears up most conflicts between Java mods. Some also cut down on breakage after updates: a small patch rides out changes elsewhere in the class while a full replacement wouldn't.

Available Java mod loaders:

- ZombieBuddy Recommended is a Java agent, installed through the JVM arguments rather than by copying class files. Mods use`@Patch` annotations with`OnEnter`/`OnExit` hooks to inject code into any game method.
- Leaf WIP is a fork of FabricMC which is used in Minecraft modding. This makes it a very well documented tool for Java bytecode manipulation due to it sharing the same workflow as Minecraft's Fabric modding. It provides a mod loader along with tools for changing part of a class without rewriting it fully.
- Necroid Deprecated is an external mod loader that compiles mod sources against your installed copy of the game. You tick the mods you want and press Apply Changes. Necroid compiles them and diffs the result against what's currently installed. Then it adds or removes class files to match. After a game update, refresh its reference copy of the game and apply the patches again. A small update usually reapplies cleanly, sometimes with a few manual fixes. A large one may not apply at all.

There are more Java mod loaders that previously were made but are too outdated to be useful.

<a id="Installing_the_JDK"></a>

## Installing the JDK

Decompiling and compiling both need a **JDK** (Java Development Kit), which includes the`javac` compiler. A JRE (Java Runtime Environment) won't do, no compiler. The game ships with its own runtime, so this is needed for modding only, not for playing.

Install the version that matches the game rather than the newest one available, see [Compiling your modified code](Java.md#Compiling_your_modified_code) for the version currently in use. Builds come from Oracle or from other implementations such as OpenJDK, and either works.

Then add the JDK's`bin` folder to your environment variables (PATH) and restart your terminal so it picks up the new value. Check that it took:



```text
javac -version
```



<a id="Manual_class_replacement"></a>

## Manual class replacement

This method of Java modding is not recommended. Use a [mod loader](Java.md#Java_mod_loaders) instead.

<a id="Compiling_your_modified_code"></a>

### Compiling your modified code

Once you have decompiled the game and edited the source, it has to go back through the compiler before the game can use it.

As of Build 42.13.0, Project Zomboid runs on Java 25, so your class files have to target that version. Use JDK 25. A newer JDK also works if you pass`--release 25`, but you're better off matching the game's version.

A class file built for a higher version is rejected at load time with`UnsupportedClassVersionError`.

The following is the typical command line for compiling a single source file. You will want to replace`path/to/projectzomboid.jar` with the path to your own copy of the game's jar file that you will find in the [game files](../foundations/Game_files.md).



```text
javac -cp "path/to/projectzomboid.jar" -d "output" "path/to/file.java"
```



-`-cp` puts the game code on the classpath, so your source can see the classes it calls.
-`-d` sends the result to a folder of your choice (here`output`). Without it, class files land next to the source.`javac` recreates the package structure inside it.
-`path/to/file.java` is the file you are compiling.

One source file can produce several class files, because nested and anonymous classes compile into`Foo$Inner.class` and`Foo$1.class`. Missing one shows up as`NoClassDefFoundError` while playing. Such classes will have the following in their source:



```text
public class Foo {
    private class Inner { ... }
}
```



Parts of the game code reach into internal JDK packages, which is why`ProjectZomboid64.json` passes`--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED` to the JVM at startup. If the class you are rebuilding touches such a package,`javac` refuses to compile it until you pass the same flag:



```text
javac --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED -cp "path/to/projectzomboid.jar" -d "output" "path/to/file.java"
```



<a id="Loading_Java_mods"></a>

### Loading Java mods

Every Java mod needs at least one manual step from the user. You have two options:

- Ship the compiled class files with your mod and let users copy them into their game files.
- Build on top of a Java mod loader. The user installs the loader by hand once, and from then on it loads Java mods for them.

<a id="How_the_game_finds_class_files"></a>

#### How the game finds class files

`ProjectZomboid64.json` holds the classpath the launcher passes to the JVM. On the client it begins like this:



```text
{
  "mainClass": "zombie/gameStates/MainScreenState",
  "classpath": [
    ".",
    "projectzomboid.jar"
  ],
```



Two entries matter.`projectzomboid.jar` is the game code, and`.` is the folder the configuration file sits in.

The archive also bundles the libraries the game depends on, among them Log4j, SQLite JDBC, OSHI, Javacord and others. That is convenient when compiling, since a single`-cp projectzomboid.jar` covers everything with nothing else to download. It also means decompiling the archive hands you those libraries alongside the game, but only the game's own packages, such as`zombie`, are yours to change.

Because that folder is on the classpath, the JVM searches it for classes as well, including package folders you add yourself. A fresh installation has no`zombie` folder, because all the vanilla code now lives inside the jar. But one you create gets searched all the same.

The classpath is searched in order, and the first match wins. Since`.` is listed ahead of the jar, your class file is found first and loaded instead of the copy in the archive, which stays untouched.

The alternate`.bat` launch builds the same two entries in`PZ_CLASSPATH`, in the same order, so it makes no difference which launcher you use. See [Startup parameters](../foundations/Startup_parameters.md).

The folder path has to mirror the package name exactly, as it appears in the decompiled source. Overwriting`zombie.characters.IsoZombie` therefore means putting your`IsoZombie.class` in`zombie/characters/`. An overwrite always replaces the whole class, so there is no way to change part of one and leave the rest alone. A finished installation looks like this:



```text
📁 ProjectZomboid                  # on Linux, this is ProjectZomboid/projectzomboid
    📁 media
      ...
    📁 zombie
        📄 YourModClass.class      # your own class, declared in package zombie
        📁 characters
            📄 IsoZombie.class     # replaces zombie.characters.IsoZombie
    📄 projectzomboid.jar          # game code and bundled libraries
    📄 ProjectZomboid64.json
    ...
```



Only compiled`.class` files are ever loaded. A`.java` source file put here is ignored without a word in the console, and the vanilla class loads instead. Compile first, then install the result.

<a id="Installing_on_a_dedicated_server"></a>

#### Installing on a dedicated server

The dedicated server works the same way, but its classpath sits one level deeper. The entries are`java/.` and`java/projectzomboid.jar`, under`"mainClass": "zombie/network/GameServer"`. Package folders go inside the server's`java` folder, not in the server root:



```text
📁 ProjectZomboidDedicatedServer
    📁 java
        📁 zombie
            📁 characters
                📄 IsoZombie.class
        📄 projectzomboid.jar
    📄 ProjectZomboid64.json
    ...
```



In multiplayer, a class that runs on both sides has to be installed on both, and the two copies must match.

Retrieved from "[https://pzwiki.net/w/index.php?title=Java&oldid=1457123](Java.md)"
