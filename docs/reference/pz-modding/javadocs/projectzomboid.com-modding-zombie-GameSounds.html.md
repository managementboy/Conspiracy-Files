[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [GameSounds](GameSounds.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [VERSION](#VERSION)
   2. [soundByName](#soundByName)
   3. [sounds](#sounds)
   4. [previewBank](#previewBank)
   5. [previewFile](#previewFile)
   6. [soundIsPaused](#soundIsPaused)
   7. [previewSound](#previewSound)
   8. [VCA\_VOLUME](#VCA_VOLUME)
   9. [missingEventCount](#missingEventCount)
7. [Constructor Details](#constructor-detail)
   1. [GameSounds()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [addSound(GameSound)](#addSound(zombie.audio.GameSound))
   2. [initClipEvents(GameSound)](#initClipEvents(zombie.audio.GameSound))
   3. [isKnownSound(String)](#isKnownSound(java.lang.String))
   4. [getSound(String)](#getSound(java.lang.String))
   5. [getOrCreateSound(String)](#getOrCreateSound(java.lang.String))
   6. [loadNonBankSounds()](#loadNonBankSounds())
   7. [ScriptsLoaded()](#ScriptsLoaded())
   8. [OnReloadSound(GameSoundScript)](#OnReloadSound(zombie.scripting.objects.GameSoundScript))
   9. [getCategories()](#getCategories())
   10. [getSoundsInCategory(String)](#getSoundsInCategory(java.lang.String))
   11. [loadINI()](#loadINI())
   12. [saveINI()](#saveINI())
   13. [previewSound(String)](#previewSound(java.lang.String))
   14. [stopPreview()](#stopPreview())
   15. [isPreviewPlaying()](#isPreviewPlaying())
   16. [fix3DListenerPosition(boolean)](#fix3DListenerPosition(boolean))
   17. [Reset()](#Reset())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class GameSounds
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.GameSounds

---

public final class GameSounds
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `GameSounds.BankPreviewSound`

  `private static final class`

  `GameSounds.FilePreviewSound`

  `private static interface`

  `GameSounds.IPreviewSound`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static int`

  `missingEventCount`

  `private static final GameSounds.BankPreviewSound`

  `previewBank`

  `private static final GameSounds.FilePreviewSound`

  `previewFile`

  `private static GameSounds.IPreviewSound`

  `previewSound`

  `protected static final HashMap<String, GameSound>`

  `soundByName`

  `static boolean`

  `soundIsPaused`

  `protected static final ArrayList<GameSound>`

  `sounds`

  `static final boolean`

  `VCA_VOLUME`

  `static final int`

  `VERSION`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GameSounds()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `addSound(GameSound sound)`

  `static void`

  `fix3DListenerPosition(boolean inMenu)`

  `static ArrayList<String>`

  `getCategories()`

  `static GameSound`

  `getOrCreateSound(String name)`

  `static GameSound`

  `getSound(String name)`

  `static ArrayList<GameSound>`

  `getSoundsInCategory(String category)`

  `private static void`

  `initClipEvents(GameSound sound)`

  `static boolean`

  `isKnownSound(String name)`

  `static boolean`

  `isPreviewPlaying()`

  `static void`

  `loadINI()`

  `private static void`

  `loadNonBankSounds()`

  `static void`

  `OnReloadSound(GameSoundScript scriptSound)`

  `static void`

  `previewSound(String name)`

  `static void`

  `Reset()`

  `static void`

  `saveINI()`

  `static void`

  `ScriptsLoaded()`

  `static void`

  `stopPreview()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### VERSION

    public static final int VERSION

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.GameSounds.VERSION)
  + ### soundByName

    protected static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [GameSound](audio/GameSound.html "class in zombie.audio")> soundByName
  + ### sounds

    protected static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[GameSound](audio/GameSound.html "class in zombie.audio")> sounds
  + ### previewBank

    private static final [GameSounds.BankPreviewSound](GameSounds.BankPreviewSound.html "class in zombie") previewBank
  + ### previewFile

    private static final [GameSounds.FilePreviewSound](GameSounds.FilePreviewSound.html "class in zombie") previewFile
  + ### soundIsPaused

    public static boolean soundIsPaused
  + ### previewSound

    private static [GameSounds.IPreviewSound](GameSounds.IPreviewSound.html "interface in zombie") previewSound
  + ### VCA\_VOLUME

    public static final boolean VCA\_VOLUME

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.GameSounds.VCA_VOLUME)
  + ### missingEventCount

    private static int missingEventCount
* Constructor Details
  -------------------

  + ### GameSounds

    public GameSounds()
* Method Details
  --------------

  + ### addSound

    public static void addSound([GameSound](audio/GameSound.html "class in zombie.audio") sound)
  + ### initClipEvents

    private static void initClipEvents([GameSound](audio/GameSound.html "class in zombie.audio") sound)
  + ### isKnownSound

    public static boolean isKnownSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getSound

    public static [GameSound](audio/GameSound.html "class in zombie.audio") getSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getOrCreateSound

    public static [GameSound](audio/GameSound.html "class in zombie.audio") getOrCreateSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### loadNonBankSounds

    private static void loadNonBankSounds()
  + ### ScriptsLoaded

    public static void ScriptsLoaded()
  + ### OnReloadSound

    public static void OnReloadSound([GameSoundScript](scripting/objects/GameSoundScript.html "class in zombie.scripting.objects") scriptSound)
  + ### getCategories

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getCategories()
  + ### getSoundsInCategory

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[GameSound](audio/GameSound.html "class in zombie.audio")> getSoundsInCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### loadINI

    public static void loadINI()
  + ### saveINI

    public static void saveINI()
  + ### previewSound

    public static void previewSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### stopPreview

    public static void stopPreview()
  + ### isPreviewPlaying

    public static boolean isPreviewPlaying()
  + ### fix3DListenerPosition

    public static void fix3DListenerPosition(boolean inMenu)
  + ### Reset

    public static void Reset()