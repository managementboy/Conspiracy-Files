[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.audio](package-summary.html)
2. [MusicIntensityConfig](MusicIntensityConfig.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [events](#events)
   3. [eventById](#eventById)
7. [Constructor Details](#constructor-detail)
   1. [MusicIntensityConfig()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [initEvents(KahluaTableImpl)](#initEvents(se.krka.kahlua.j2se.KahluaTableImpl))
   3. [triggerEvent(String, MusicIntensityEvents)](#triggerEvent(java.lang.String,zombie.audio.MusicIntensityEvents))
   4. [checkHealthPanelVisible(IsoGameCharacter)](#checkHealthPanelVisible(zombie.characters.IsoGameCharacter))
   5. [checkHealthPanel\_SeeBite(IsoPlayer)](#checkHealthPanel_SeeBite(zombie.characters.IsoPlayer))
   6. [restoreToFullHealth(IsoGameCharacter)](#restoreToFullHealth(zombie.characters.IsoGameCharacter))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class MusicIntensityConfig
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.MusicIntensityConfig

---

public final class MusicIntensityConfig
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `MusicIntensityConfig.Event`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final HashMap<String, MusicIntensityConfig.Event>`

  `eventById`

  `private final ArrayList<MusicIntensityConfig.Event>`

  `events`

  `private static MusicIntensityConfig`

  `instance`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MusicIntensityConfig()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `checkHealthPanel_SeeBite(IsoPlayer player)`

  `void`

  `checkHealthPanelVisible(IsoGameCharacter character)`

  `static MusicIntensityConfig`

  `getInstance()`

  `void`

  `initEvents(se.krka.kahlua.j2se.KahluaTableImpl eventsTable)`

  `void`

  `restoreToFullHealth(IsoGameCharacter character)`

  `MusicIntensityEvent`

  `triggerEvent(String id,
  MusicIntensityEvents mie)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [MusicIntensityConfig](MusicIntensityConfig.html "class in zombie.audio") instance
  + ### events

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MusicIntensityConfig.Event](MusicIntensityConfig.Event.html "class in zombie.audio")> events
  + ### eventById

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [MusicIntensityConfig.Event](MusicIntensityConfig.Event.html "class in zombie.audio")> eventById
* Constructor Details
  -------------------

  + ### MusicIntensityConfig

    public MusicIntensityConfig()
* Method Details
  --------------

  + ### getInstance

    public static [MusicIntensityConfig](MusicIntensityConfig.html "class in zombie.audio") getInstance()
  + ### initEvents

    public void initEvents(se.krka.kahlua.j2se.KahluaTableImpl eventsTable)
  + ### triggerEvent

    public [MusicIntensityEvent](MusicIntensityEvent.html "class in zombie.audio") triggerEvent([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [MusicIntensityEvents](MusicIntensityEvents.html "class in zombie.audio") mie)
  + ### checkHealthPanelVisible

    public void checkHealthPanelVisible([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)
  + ### checkHealthPanel\_SeeBite

    private void checkHealthPanel\_SeeBite([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### restoreToFullHealth

    public void restoreToFullHealth([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") character)