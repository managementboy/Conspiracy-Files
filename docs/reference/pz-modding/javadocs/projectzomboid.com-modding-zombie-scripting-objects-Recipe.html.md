[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [Recipe](Recipe.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [canBeDoneFromFloor](#canBeDoneFromFloor)
   2. [timeToMake](#timeToMake)
   3. [sound](#sound)
   4. [animNode](#animNode)
   5. [prop1](#prop1)
   6. [prop2](#prop2)
   7. [source](#source)
   8. [result](#result)
   9. [results](#results)
   10. [allowDestroyedItem](#allowDestroyedItem)
   11. [allowFrozenItem](#allowFrozenItem)
   12. [allowRottenItem](#allowRottenItem)
   13. [allowOnlyOne](#allowOnlyOne)
   14. [inSameInventory](#inSameInventory)
   15. [name](#name)
   16. [originalname](#originalname)
   17. [requiredNearObject](#requiredNearObject)
   18. [tooltip](#tooltip)
   19. [skillRequired](#skillRequired)
   20. [needToBeLearn](#needToBeLearn)
   21. [category](#category)
   22. [removeResultItem](#removeResultItem)
   23. [heat](#heat)
   24. [stopOnWalk](#stopOnWalk)
   25. [stopOnRun](#stopOnRun)
   26. [hidden](#hidden)
   27. [recipeFileText](#recipeFileText)
   28. [obsolete](#obsolete)
   29. [requiresWorkstation](#requiresWorkstation)
   30. [stationMultiplier](#stationMultiplier)
   31. [luaCalls](#luaCalls)
7. [Constructor Details](#constructor-detail)
   1. [Recipe()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [isRequiresWorkstation()](#isRequiresWorkstation())
   2. [getStationMultiplier()](#getStationMultiplier())
   3. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   4. [DoSource(String)](#DoSource(java.lang.String))
   5. [DoResult(String)](#DoResult(java.lang.String))
   6. [getNumberOfNeededItem()](#getNumberOfNeededItem())
   7. [getRequiredSkills()](#getRequiredSkills())
   8. [getRequiredSkillCount()](#getRequiredSkillCount())
   9. [getRequiredSkill(int)](#getRequiredSkill(int))
   10. [clearRequiredSkills()](#clearRequiredSkills())
   11. [addRequiredSkill(PerkFactory.Perk, int)](#addRequiredSkill(zombie.characters.skills.PerkFactory.Perk,int))
   12. [findSource(String)](#findSource(java.lang.String))
   13. [getSource()](#getSource())
   14. [getOriginalname()](#getOriginalname())
   15. [setOriginalname(String)](#setOriginalname(java.lang.String))
   16. [getFullType()](#getFullType())
   17. [getName()](#getName())
   18. [getHeat()](#getHeat())
   19. [getResult()](#getResult())
   20. [getNearItem()](#getNearItem())
   21. [setNearItem(String)](#setNearItem(java.lang.String))
   22. [getResults()](#getResults())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Recipe
============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.Recipe

Direct Known Subclasses:
:   `MovableRecipe`

---

public class Recipe
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `Recipe.LuaCall`

  `static final class`

  `Recipe.RequiredSkill`

  `static final class`

  `Recipe.Result`

  `static final class`

  `Recipe.Source`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `allowDestroyedItem`

  `boolean`

  `allowFrozenItem`

  `boolean`

  `allowOnlyOne`

  `boolean`

  `allowRottenItem`

  `protected String`

  `animNode`

  `private final boolean`

  `canBeDoneFromFloor`

  `protected String`

  `category`

  `private final float`

  `heat`

  `boolean`

  `hidden`

  `boolean`

  `inSameInventory`

  `private final HashMap<Recipe.LuaCall, String>`

  `luaCalls`

  `String`

  `name`

  `private final boolean`

  `needToBeLearn`

  `private final boolean`

  `obsolete`

  `private String`

  `originalname`

  `protected String`

  `prop1`

  `protected String`

  `prop2`

  `private String`

  `recipeFileText`

  `protected boolean`

  `removeResultItem`

  `private String`

  `requiredNearObject`

  `private final boolean`

  `requiresWorkstation`

  `Recipe.Result`

  `result`

  `final ArrayList<Recipe.Result>`

  `results`

  `ArrayList<Recipe.RequiredSkill>`

  `skillRequired`

  `String`

  `sound`

  `final ArrayList<Recipe.Source>`

  `source`

  `private final float`

  `stationMultiplier`

  `protected boolean`

  `stopOnRun`

  `protected boolean`

  `stopOnWalk`

  `float`

  `timeToMake`

  `private final String`

  `tooltip`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Recipe()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `addRequiredSkill(PerkFactory.Perk perk,
  int level)`

  `void`

  `clearRequiredSkills()`

  `void`

  `DoResult(String type)`

  `void`

  `DoSource(String type)`

  `Recipe.Source`

  `findSource(String sourceFullType)`

  `String`

  `getFullType()`

  `float`

  `getHeat()`

  `String`

  `getName()`

  `String`

  `getNearItem()`

  Deprecated.

  `int`

  `getNumberOfNeededItem()`

  `String`

  `getOriginalname()`

  `Recipe.RequiredSkill`

  `getRequiredSkill(int index)`

  `int`

  `getRequiredSkillCount()`

  `ArrayList<String>`

  `getRequiredSkills()`

  `Recipe.Result`

  `getResult()`

  `ArrayList<Recipe.Result>`

  `getResults()`

  `ArrayList<Recipe.Source>`

  `getSource()`

  `float`

  `getStationMultiplier()`

  `boolean`

  `isRequiresWorkstation()`

  `void`

  `Load(String name,
  String totalFile)`

  `void`

  `setNearItem(String nearItem)`

  Deprecated.

  `void`

  `setOriginalname(String originalname)`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### canBeDoneFromFloor

    private final boolean canBeDoneFromFloor

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.objects.Recipe.canBeDoneFromFloor)
  + ### timeToMake

    public float timeToMake
  + ### sound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sound
  + ### animNode

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animNode
  + ### prop1

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prop1
  + ### prop2

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prop2
  + ### source

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Recipe.Source](Recipe.Source.html "class in zombie.scripting.objects")> source
  + ### result

    public [Recipe.Result](Recipe.Result.html "class in zombie.scripting.objects") result
  + ### results

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Recipe.Result](Recipe.Result.html "class in zombie.scripting.objects")> results
  + ### allowDestroyedItem

    public boolean allowDestroyedItem
  + ### allowFrozenItem

    public boolean allowFrozenItem
  + ### allowRottenItem

    public boolean allowRottenItem
  + ### allowOnlyOne

    public boolean allowOnlyOne
  + ### inSameInventory

    public boolean inSameInventory
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### originalname

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originalname
  + ### requiredNearObject

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") requiredNearObject
  + ### tooltip

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tooltip
  + ### skillRequired

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Recipe.RequiredSkill](Recipe.RequiredSkill.html "class in zombie.scripting.objects")> skillRequired
  + ### needToBeLearn

    private final boolean needToBeLearn

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.objects.Recipe.needToBeLearn)
  + ### category

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category
  + ### removeResultItem

    protected boolean removeResultItem
  + ### heat

    private final float heat

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.objects.Recipe.heat)
  + ### stopOnWalk

    protected boolean stopOnWalk
  + ### stopOnRun

    protected boolean stopOnRun
  + ### hidden

    public boolean hidden
  + ### recipeFileText

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipeFileText
  + ### obsolete

    private final boolean obsolete

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.objects.Recipe.obsolete)
  + ### requiresWorkstation

    private final boolean requiresWorkstation

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.objects.Recipe.requiresWorkstation)
  + ### stationMultiplier

    private final float stationMultiplier

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.objects.Recipe.stationMultiplier)
  + ### luaCalls

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Recipe.LuaCall](Recipe.LuaCall.html "enum class in zombie.scripting.objects"), [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> luaCalls
* Constructor Details
  -------------------

  + ### Recipe

    public Recipe()
* Method Details
  --------------

  + ### isRequiresWorkstation

    public boolean isRequiresWorkstation()
  + ### getStationMultiplier

    public float getStationMultiplier()
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") totalFile)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### DoSource

    public void DoSource([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### DoResult

    public void DoResult([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getNumberOfNeededItem

    public int getNumberOfNeededItem()
  + ### getRequiredSkills

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getRequiredSkills()
  + ### getRequiredSkillCount

    public int getRequiredSkillCount()
  + ### getRequiredSkill

    public [Recipe.RequiredSkill](Recipe.RequiredSkill.html "class in zombie.scripting.objects") getRequiredSkill(int index)
  + ### clearRequiredSkills

    public void clearRequiredSkills()
  + ### addRequiredSkill

    public void addRequiredSkill([PerkFactory.Perk](../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    int level)
  + ### findSource

    public [Recipe.Source](Recipe.Source.html "class in zombie.scripting.objects") findSource([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sourceFullType)
  + ### getSource

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Recipe.Source](Recipe.Source.html "class in zombie.scripting.objects")> getSource()
  + ### getOriginalname

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOriginalname()
  + ### setOriginalname

    public void setOriginalname([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originalname)
  + ### getFullType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFullType()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getHeat

    public float getHeat()
  + ### getResult

    public [Recipe.Result](Recipe.Result.html "class in zombie.scripting.objects") getResult()
  + ### getNearItem

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNearItem()

    Deprecated.
  + ### setNearItem

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void setNearItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") nearItem)

    Deprecated.

    Refactored to `setRequiredNearObject(String requiredNearObject)`
    Kept this method in case mods use it.
  + ### getResults

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Recipe.Result](Recipe.Result.html "class in zombie.scripting.objects")> getResults()