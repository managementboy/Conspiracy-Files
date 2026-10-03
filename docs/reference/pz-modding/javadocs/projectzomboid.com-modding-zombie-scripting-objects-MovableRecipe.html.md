[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [MovableRecipe](MovableRecipe.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [isValid](#isValid)
   2. [worldSprite](#worldSprite)
   3. [xpPerk](#xpPerk)
   4. [primaryTools](#primaryTools)
   5. [secondaryTools](#secondaryTools)
7. [Constructor Details](#constructor-detail)
   1. [MovableRecipe()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [setResult(String, int)](#setResult(java.lang.String,int))
   2. [setSource(String)](#setSource(java.lang.String))
   3. [setTool(String, boolean)](#setTool(java.lang.String,boolean))
   4. [getPrimaryTools()](#getPrimaryTools())
   5. [getSecondaryTools()](#getSecondaryTools())
   6. [setRequiredSkill(PerkFactory.Perk, int)](#setRequiredSkill(zombie.characters.skills.PerkFactory.Perk,int))
   7. [setXpPerk(PerkFactory.Perk)](#setXpPerk(zombie.characters.skills.PerkFactory.Perk))
   8. [getXpPerk()](#getXpPerk())
   9. [hasXpPerk()](#hasXpPerk())
   10. [setTime(float)](#setTime(float))
   11. [setName(String)](#setName(java.lang.String))
   12. [getWorldSprite()](#getWorldSprite())
   13. [setWorldSprite(String)](#setWorldSprite(java.lang.String))
   14. [isValid()](#isValid())
   15. [setValid(boolean)](#setValid(boolean))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class MovableRecipe
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

[zombie.scripting.objects.Recipe](Recipe.html "class in zombie.scripting.objects")

zombie.scripting.objects.MovableRecipe

---

public class MovableRecipe
extends [Recipe](Recipe.html "class in zombie.scripting.objects")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [Recipe](Recipe.html#nested-class-summary "class in zombie.scripting.objects")

  `Recipe.LuaCall, Recipe.RequiredSkill, Recipe.Result, Recipe.Source`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `isValid`

  `private Recipe.Source`

  `primaryTools`

  `private Recipe.Source`

  `secondaryTools`

  `private String`

  `worldSprite`

  `private PerkFactory.Perk`

  `xpPerk`

  ### Fields inherited from class [Recipe](Recipe.html#field-summary "class in zombie.scripting.objects")

  `allowDestroyedItem, allowFrozenItem, allowOnlyOne, allowRottenItem, animNode, category, hidden, inSameInventory, name, prop1, prop2, removeResultItem, result, results, skillRequired, sound, source, stopOnRun, stopOnWalk, timeToMake`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MovableRecipe()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Recipe.Source`

  `getPrimaryTools()`

  `Recipe.Source`

  `getSecondaryTools()`

  `String`

  `getWorldSprite()`

  `PerkFactory.Perk`

  `getXpPerk()`

  `boolean`

  `hasXpPerk()`

  `boolean`

  `isValid()`

  `void`

  `setName(String name)`

  `void`

  `setRequiredSkill(PerkFactory.Perk perk,
  int level)`

  `void`

  `setResult(String resultItem,
  int count)`

  `void`

  `setSource(String sourceItem)`

  `void`

  `setTime(float time)`

  `void`

  `setTool(String tools,
  boolean isPrimary)`

  `void`

  `setValid(boolean valid)`

  `void`

  `setWorldSprite(String worldSprite)`

  `void`

  `setXpPerk(PerkFactory.Perk perk)`

  ### Methods inherited from class [Recipe](Recipe.html#method-summary "class in zombie.scripting.objects")

  `addRequiredSkill, clearRequiredSkills, DoResult, DoSource, findSource, getFullType, getHeat, getName, getNearItem, getNumberOfNeededItem, getOriginalname, getRequiredSkill, getRequiredSkillCount, getRequiredSkills, getResult, getResults, getSource, getStationMultiplier, isRequiresWorkstation, Load, setNearItem, setOriginalname`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### isValid

    private boolean isValid
  + ### worldSprite

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") worldSprite
  + ### xpPerk

    private [PerkFactory.Perk](../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") xpPerk
  + ### primaryTools

    private [Recipe.Source](Recipe.Source.html "class in zombie.scripting.objects") primaryTools
  + ### secondaryTools

    private [Recipe.Source](Recipe.Source.html "class in zombie.scripting.objects") secondaryTools
* Constructor Details
  -------------------

  + ### MovableRecipe

    public MovableRecipe()
* Method Details
  --------------

  + ### setResult

    public void setResult([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") resultItem,
    int count)
  + ### setSource

    public void setSource([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sourceItem)
  + ### setTool

    public void setTool([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tools,
    boolean isPrimary)
  + ### getPrimaryTools

    public [Recipe.Source](Recipe.Source.html "class in zombie.scripting.objects") getPrimaryTools()
  + ### getSecondaryTools

    public [Recipe.Source](Recipe.Source.html "class in zombie.scripting.objects") getSecondaryTools()
  + ### setRequiredSkill

    public void setRequiredSkill([PerkFactory.Perk](../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    int level)
  + ### setXpPerk

    public void setXpPerk([PerkFactory.Perk](../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk)
  + ### getXpPerk

    public [PerkFactory.Perk](../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") getXpPerk()
  + ### hasXpPerk

    public boolean hasXpPerk()
  + ### setTime

    public void setTime(float time)
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getWorldSprite

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWorldSprite()
  + ### setWorldSprite

    public void setWorldSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") worldSprite)
  + ### isValid

    public boolean isValid()
  + ### setValid

    public void setValid(boolean valid)