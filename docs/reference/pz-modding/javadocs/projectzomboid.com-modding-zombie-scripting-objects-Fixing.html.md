[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [Fixing](Fixing.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [name](#name)
   2. [require](#require)
   3. [fixers](#fixers)
   4. [globalItem](#globalItem)
   5. [conditionModifier](#conditionModifier)
   6. [s\_PredicateRequired](#s_PredicateRequired)
   7. [s\_InventoryItems](#s_InventoryItems)
7. [Constructor Details](#constructor-detail)
   1. [Fixing()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   2. [Load(String, String[])](#Load(java.lang.String,java.lang.String%5B%5D))
   3. [getName()](#getName())
   4. [setName(String)](#setName(java.lang.String))
   5. [getRequiredItem()](#getRequiredItem())
   6. [addRequiredItem(String)](#addRequiredItem(java.lang.String))
   7. [getFixers()](#getFixers())
   8. [usedInFixer(InventoryItem, IsoGameCharacter)](#usedInFixer(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   9. [haveGlobalItem(IsoGameCharacter)](#haveGlobalItem(zombie.characters.IsoGameCharacter))
   10. [haveThisFixer(IsoGameCharacter, Fixing.Fixer, InventoryItem)](#haveThisFixer(zombie.characters.IsoGameCharacter,zombie.scripting.objects.Fixing.Fixer,zombie.inventory.InventoryItem))
   11. [countUses(IsoGameCharacter, Fixing.Fixer, InventoryItem)](#countUses(zombie.characters.IsoGameCharacter,zombie.scripting.objects.Fixing.Fixer,zombie.inventory.InventoryItem))
   12. [countUses(InventoryItem)](#countUses(zombie.inventory.InventoryItem))
   13. [getRequiredFixerItems(IsoGameCharacter, Fixing.Fixer, InventoryItem, ArrayList)](#getRequiredFixerItems(zombie.characters.IsoGameCharacter,zombie.scripting.objects.Fixing.Fixer,zombie.inventory.InventoryItem,java.util.ArrayList))
   14. [getRequiredItems(IsoGameCharacter, Fixing.Fixer, InventoryItem)](#getRequiredItems(zombie.characters.IsoGameCharacter,zombie.scripting.objects.Fixing.Fixer,zombie.inventory.InventoryItem))
   15. [getGlobalItem()](#getGlobalItem())
   16. [setGlobalItem(Fixing.Fixer)](#setGlobalItem(zombie.scripting.objects.Fixing.Fixer))
   17. [getConditionModifier()](#getConditionModifier())
   18. [setConditionModifier(float)](#setConditionModifier(float))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Fixing
============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.Fixing

---

public final class Fixing
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `Fixing.Fixer`

  `static final class`

  `Fixing.FixerSkill`

  `private static final class`

  `Fixing.PredicateRequired`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `conditionModifier`

  `private final LinkedList<Fixing.Fixer>`

  `fixers`

  `private Fixing.Fixer`

  `globalItem`

  `private String`

  `name`

  `private ArrayList<String>`

  `require`

  `private static final ArrayList<InventoryItem>`

  `s_InventoryItems`

  `private static final Fixing.PredicateRequired`

  `s_PredicateRequired`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Fixing()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addRequiredItem(String require)`

  `int`

  `countUses(IsoGameCharacter chr,
  Fixing.Fixer fixer,
  InventoryItem brokenObject)`

  `private static int`

  `countUses(InventoryItem item)`

  `float`

  `getConditionModifier()`

  `LinkedList<Fixing.Fixer>`

  `getFixers()`

  `Fixing.Fixer`

  `getGlobalItem()`

  `String`

  `getName()`

  `ArrayList<InventoryItem>`

  `getRequiredFixerItems(IsoGameCharacter chr,
  Fixing.Fixer fixer,
  InventoryItem brokenItem,
  ArrayList<InventoryItem> items)`

  `ArrayList<String>`

  `getRequiredItem()`

  `ArrayList<InventoryItem>`

  `getRequiredItems(IsoGameCharacter chr,
  Fixing.Fixer fixer,
  InventoryItem brokenItem)`

  `InventoryItem`

  `haveGlobalItem(IsoGameCharacter chr)`

  `InventoryItem`

  `haveThisFixer(IsoGameCharacter chr,
  Fixing.Fixer fixer,
  InventoryItem brokenObject)`

  `void`

  `Load(String name,
  String body)`

  `private void`

  `Load(String name,
  String[] strArray)`

  `void`

  `setConditionModifier(float conditionModifier)`

  `void`

  `setGlobalItem(Fixing.Fixer globalItem)`

  `void`

  `setName(String name)`

  `Fixing.Fixer`

  `usedInFixer(InventoryItem itemType,
  IsoGameCharacter chr)`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### require

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> require
  + ### fixers

    private final [LinkedList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/LinkedList.html "class or interface in java.util")<[Fixing.Fixer](Fixing.Fixer.html "class in zombie.scripting.objects")> fixers
  + ### globalItem

    private [Fixing.Fixer](Fixing.Fixer.html "class in zombie.scripting.objects") globalItem
  + ### conditionModifier

    private float conditionModifier
  + ### s\_PredicateRequired

    private static final [Fixing.PredicateRequired](Fixing.PredicateRequired.html "class in zombie.scripting.objects") s\_PredicateRequired
  + ### s\_InventoryItems

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory")> s\_InventoryItems
* Constructor Details
  -------------------

  + ### Fixing

    public Fixing()
* Method Details
  --------------

  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") body)

    Overrides:
    :   `Load` in class `BaseScriptObject`
  + ### Load

    private void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] strArray)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getRequiredItem

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getRequiredItem()
  + ### addRequiredItem

    public void addRequiredItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") require)
  + ### getFixers

    public [LinkedList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/LinkedList.html "class or interface in java.util")<[Fixing.Fixer](Fixing.Fixer.html "class in zombie.scripting.objects")> getFixers()
  + ### usedInFixer

    public [Fixing.Fixer](Fixing.Fixer.html "class in zombie.scripting.objects") usedInFixer([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") itemType,
    [IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### haveGlobalItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") haveGlobalItem([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### haveThisFixer

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") haveThisFixer([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [Fixing.Fixer](Fixing.Fixer.html "class in zombie.scripting.objects") fixer,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") brokenObject)
  + ### countUses

    public int countUses([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [Fixing.Fixer](Fixing.Fixer.html "class in zombie.scripting.objects") fixer,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") brokenObject)
  + ### countUses

    private static int countUses([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### getRequiredFixerItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory")> getRequiredFixerItems([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [Fixing.Fixer](Fixing.Fixer.html "class in zombie.scripting.objects") fixer,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") brokenItem,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory")> items)
  + ### getRequiredItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory")> getRequiredItems([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [Fixing.Fixer](Fixing.Fixer.html "class in zombie.scripting.objects") fixer,
    [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") brokenItem)
  + ### getGlobalItem

    public [Fixing.Fixer](Fixing.Fixer.html "class in zombie.scripting.objects") getGlobalItem()
  + ### setGlobalItem

    public void setGlobalItem([Fixing.Fixer](Fixing.Fixer.html "class in zombie.scripting.objects") globalItem)
  + ### getConditionModifier

    public float getConditionModifier()
  + ### setConditionModifier

    public void setConditionModifier(float conditionModifier)