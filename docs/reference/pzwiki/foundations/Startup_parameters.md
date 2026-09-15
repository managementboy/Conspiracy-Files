---
title: "Startup parameters"
source: "https://pzwiki.net/wiki/Startup_parameters"
source_revision: "https://pzwiki.net/w/index.php?title=Startup_parameters&oldid=1478235"
source_last_edited: "Last modified\n\t\t         This page was last edited on 3 September 2026, at 22:06."
retrieved: "2026-09-15T11:39:31.014Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 7
source_tables: 6
---

# Startup parameters

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.4).

Help by adding any missing content. [Edit](Startup_parameters.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

Project Zomboid has customizable **startup parameters** that are used to override the default options of the launcher, JVM, and game. JVM arguments must be provided first and end with`--` even if there are no game arguments. Game arguments can be passed to the launcher because they are forwarded to the game itself.

<a id="Usage"></a>

## Usage

<a id="From_the_Steam_application"></a>

### From the Steam application

- Right-click the game in the Steam Library, a menu will pop up.
- Click Properties. A new modal window will appear.
- By default the 'general' tab in the modal window should be opened, but if not, click it.
- Look under Launch Options → Selected Launch Option. Add a parameter from the table below, e.g.,`-debug` to the field.
- Close window and launch the game.

<a id="Example"></a>

#### Example



```text
-Xmx8192m -Xms8192m -- -debug
```



<a id="From_a_game_shortcut"></a>

### From a game shortcut

- Navigate to the game folder via right-clicking Project Zomboid in the Steam Library → Manage → Browse local files.
- Create a shortcut of the game launcher`ProjectZomboid<32/64>.exe`.
- Add the arguments to the Target field.

<a id="Example_2"></a>

#### Example



```text
"C:\ProjectZomboid64.exe" -Xmx8192m -Xms8192m -- -debug
```



<a id="From_the_StartServer64.bat_parameters"></a>

### From the StartServer64.bat parameters

This method is only for dedicated servers.

- Open the`StartServer64.bat` script with a text editor.
- Add any JVM arguments after the`-Xmx` line in the script.
- Add any game parameters after the`%1 %2` text inside the script, which is at the end of the file before PAUSE.

Here the`--` is not needed because the script already separates the JVM and game arguments.

<a id="Example_3"></a>

#### Example



```text
-Xmx16g -Duser.home=C:\Zomboid
```





```text
%1 %2 -nosteam -servername MySecondServer -adminpassword Password123
```



<a id="Common_use_cases"></a>

## Common use cases

<a id="Increasing_allocated_memory"></a>

### Increasing allocated memory

To increase the maximum allocated memory to 8 GB and the minimum to 8 GB, add the following to the launch options:



```text
-Xmx8192m -Xms8192m --
```



If the JVM cannot allocate the minimum amount of memory set here (as noted by`-Xms`), the game will not boot. For most people, and to recommend on a wide range of systems, its better to not set the minimum at all.

<a id="Opening_the_game_in_debug_mode"></a>

### Opening the game in debug mode

To open the game in debug mode, add the following to the launch options:



```text
-debug
```



<a id="Disabling_Steam_integration"></a>

### Disabling Steam integration

To disable Steam integration, add the following to the launch options:



```text
-nosteam
```



<a id="Game_arguments"></a>

## Game arguments

<a id="Client_.26_server"></a>

### Client & server

| Arguments | Description | Example |
| --- | --- | --- |
|`-console_dot_txt_size_kb={int size}` | Sets the maximum console.txt file size in kilobytes. |`-console_dot_txt_size_kb=512000` |
|`-cachedir={str path}` | Sets the absolute path for the game's cache directory. |`-cachedir="C:\Zomboid"` |
|`-nosteam` | This is equal to using the`-Dzomboid.steam` JVM property. |  |
|`-anti-cheats` | Sets the internal anticheats enable flag which force-enables the anticheat. This flag is automatically true when in a non-coop environment. This option will do nothing if anticheats are disabled in the server config. |  |

<a id="Client"></a>

### Client

| Arguments | Description | Example |
| --- | --- | --- |
|`-safemode` | Launches the game with reduced resolution, texture compression, 1x tile scale, and 1x texture scale. Disables the WeatherShader and FBO support. No FBO means that offscreen rendering will not work! The game will enable safe mode if it fails to create a framebuffer object. |  |
|`-nosound` | Disables the game audio. This has the side effect of disabling some aspects of the voice chat. |  |
|`-aitest` | Enables the AI testing mode. It has been neglected and isn't used anywhere but to set IsoGameCharacter.isNPC. |  |
|`-novoip` | Disables the VoiceManager from starting, which controls in-game voice chat. |  |
|`-debug` | Launches the game in [debug mode](Debug_mode.md). Makes the CoopMaster coop server use debug mode. |  |
|`-debuglog={DebugType[] types}` | Enables certain filters in the console log. Takes in a comma-separated list of DebugType values. Since the client doesn't have`-disablelog`, this allows us to specify whether to enable or disable the filter. |`-debuglog=All` /`-debuglog=Network,-Sound` |
|`+connect {str ip}:{str port}` | This is equivalent to using the`-Dargs.server.connect` JVM property. |`+connect 127.0.0.1:16261` |
|`+password {str password}` | This is equivalent to using the`-Dargs.server.password` JVM property. |`+password ServersPassword` |
|`-debugtranslation` | Enables the debug mode for the Translator class. Writes possible translation issues to`cachedir/translationProblems.txt` and allows for reloading translation files while holding F12 in-game. |  |
|`-modfolders {Folder[] folders}` | Controls where mods load from and their load order. There are only 3 possible folders. Any folder can be unspecified to disable the game from loading mods in that directory, and rearranged to change the load order of the mods. |`-modfolders workshop,steam,mods` /`-modfolders workshop,steam` |
|`-debugcfg={str path}` | Loads a custom debug config file instead of the default (`debuglog.cfg` or`debuglog-server.cfg`) |`-debugcfg=debuglog-custom.cfg` |
|`-imgui` | Launches the game in [debug mode](Debug_mode.md) with Imgui enabled. |  |
|`-imguidebugviewports` | Launches the game in [debug mode](Debug_mode.md) with Imgui enabled in a separate window. |  |

<a id="Server"></a>

### Server

| Arguments | Description | Example |
| --- | --- | --- |
|`-coop` | Runs a coop server instead of a dedicated server. Disables the default admin from being accessible. |  |
|`-disablelog={DebugType[] types}` | Disables certain filters in the console log. Takes in a comma-separated list of DebugType values. |`-disablelog=All` /`-disablelog=Network,Sound` |
|`-debuglog={DebugType[] types}` | Enables certain filters in the console log. Takes in a comma-separated list of DebugType values. |`-debuglog=All` /`-debuglog=Network,Sound` |
|`-adminusername {str name}` | Uses a different username for the default admin user when creating a server. It doesn't remove the previous default admin user if there is one. |`-adminusername BobTheAdmin75` |
|`-adminpassword {str pass}` | Set the default admin user's password automatically, bypassing the prompt if the default admin user is not found. |`-adminpassword ReallySecurePassword` |
|`-ip {str ip}` | Forces the server to bind to a specific IP address. |`-ip 123.45.678.9` |
|`-gui` | Launches the server GUI alongside the console. Another neglected argument that is unfinished, doesn't render properly, causes lots of exceptions, and uses extra memory. |  |
|`-statistic {int period}` | Enables multiplayer statistics monitoring. The period is measured in seconds. Monitored statistics are saved in the`cachedir/Statistic` directory. |`-statistic 10` |
|`-port {int port}` | Overrides the DefaultPort config option in the INI file. |`-port 16261` |
|`-udpport {int port}` | Overrides the UDPPort config option in the INI file. |`-udpport 16261` |
|`-steamvac {bool enabled}` | Enables or disables Valve Anti-Cheat on the server. Overrides the option in the server INI config. |`-steamvac true` |
|`-servername {str name}` | Sets the internal servername to use. It affects the name of the save files that are loaded/saved. |`-servername AnotherWorldSave` |

<a id="JVM_arguments"></a>

## JVM arguments

JVM arguments must be provided first before client/server arguments and ending with`--` even if there are no game arguments.`--` must be included at the ending if Java arguments are used.

<a id="Client_.26_server_2"></a>

### Client & server

| Arguments | Description | Example |
| --- | --- | --- |
|`-Xms{int size}{char unit}` | The minimum amount of memory to allocate to the JVM. The game will not start if there is not enough memory available on the system to allocate. The unit can be`g` or`m`. |`-Xms8192m` |
|`-Xmx{int size}{char unit}` | The maximum amount of memory to allocate to the JVM. Setting this above the physical RAM amount of the system will end up using virtual memory. The unit can be`g` or`m`. |`-Xmx8192m` |
|`-XX:+AlwaysPreTouch` | Requests the VM to touch every page on the Java heap after requesting it from the operating system and before handing memory out to the application. If you are using ZGC it is officially recommended that one enables this option as of Java 21. [\[1\]](Startup_parameters.md) |  |
|`-Dzomboid.ConsoleDotTxtSizeKB={int size}` | Sets the maximum console.txt file size in kilobytes. |`-Dzomboid.ConsoleDotTxtSizeKB=512000` |
|`-Dzomboid.steam={int enabled}` | Disables the game's Steam API integration, which prevents joining Steam servers or accessing Workshop content. |`-Dzomboid.steam=1` |
|`-Ddeployment.user.cachedir={str path}` | Sets the game's cache directory. The same as setting`-cachedir`. Only works on Linux. |`-Ddeployment.user.cachedir="/home/user/zomboid_server"` |
|`-Dsoftreset` | Forces the game to perform a soft reset. This does not work as of 42.20.4. The issue was reported and could be fixed in future versions[\[2\]](Startup_parameters.md). |  |
|`-Ddebug` | Launches the game in [debug mode](Debug_mode.md). Makes the CoopMaster coop server use debug mode if enabled. |  |

<a id="Client_2"></a>

### Client

| Arguments | Description | Example |
| --- | --- | --- |
|`-Dargs.server.connect={str ip}:{str port}` | Connects to the server specified without needing to use the server browser. |`-Dargs.server.connect="123.4.567.89:16261"` |
|`-Dargs.server.password={str pass}` | Provides the server being connected to a password without needing to use the server browser. |`-Dargs.server.password="DinoNuggetsTasteGood!!"` |

<a id="Launcher_arguments"></a>

## Launcher arguments

<a id="Client_3"></a>

### Client

| Arguments | Description | Example |
| --- | --- | --- |
|`-pzexeconfig {str config}` | Overrides the default launcher config`ProjectZomboid64.json`. An alternative to specifying args in the bat or in launch options. |`-pzexeconfig ProjectZomboid64Custom.json` |
|`-pzexelog {str logfile}` | Stores the logging output of the launcher`ProjectZomboid64.exe`. It is only useful for debugging purposes. |`-pzexelog ProjectZomboid64.log` |
|`-pzexejavacmd {str path}` | Overrides the default bundled JRE, allowing you to specify the path to any Java installation. |`-pzexejavacmd jre64/bin/java` |

<a id="References"></a>

## References

- [↑](Startup_parameters.md) HotSpot Virtual Machine Garbage Collection Tuning Guide
- [↑](Startup_parameters.md) Dedicated Server Soft Reset :: Project Zomboid General Discussions

Retrieved from "[https://pzwiki.net/w/index.php?title=Startup_parameters&oldid=1478235](Startup_parameters.md)"
