[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [TimedActionScript](TimedActionScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [metabolics](#metabolics)
   2. [time](#time)
   3. [faceObject](#faceObject)
   4. [prop1](#prop1)
   5. [prop2](#prop2)
   6. [actionAnim](#actionAnim)
   7. [animVarKey](#animVarKey)
   8. [animVarVal](#animVarVal)
   9. [sound](#sound)
   10. [soundTime](#soundTime)
   11. [completionSound](#completionSound)
   12. [muscleStrainFactor](#muscleStrainFactor)
   13. [muscleStrainParts](#muscleStrainParts)
   14. [muscleStrainSkill](#muscleStrainSkill)
   15. [cantSit](#cantSit)
6. [Constructor Details](#constructor-detail)
   1. [TimedActionScript()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [getFullType()](#getFullType())
   3. [getMetabolics()](#getMetabolics())
   4. [getTime()](#getTime())
   5. [isFaceObject()](#isFaceObject())
   6. [isCantSit()](#isCantSit())
   7. [getProp1()](#getProp1())
   8. [getProp2()](#getProp2())
   9. [getActionAnim()](#getActionAnim())
   10. [getAnimVarKey()](#getAnimVarKey())
   11. [getAnimVarVal()](#getAnimVarVal())
   12. [getSound()](#getSound())
   13. [getSoundTime()](#getSoundTime())
   14. [getCompletionSound()](#getCompletionSound())
   15. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   16. [PreReload()](#PreReload())
   17. [hasMuscleStrain()](#hasMuscleStrain())
   18. [applyMuscleStrain(IsoGameCharacter)](#applyMuscleStrain(zombie.characters.IsoGameCharacter))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class TimedActionScript
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.TimedActionScript

---

public class TimedActionScript
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `actionAnim`

  `private String`

  `animVarKey`

  `private String`

  `animVarVal`

  `private boolean`

  `cantSit`

  `private String`

  `completionSound`

  `private boolean`

  `faceObject`

  `private Metabolics`

  `metabolics`

  `private float`

  `muscleStrainFactor`

  `private ArrayList<BodyPartType>`

  `muscleStrainParts`

  `private PerkFactory.Perk`

  `muscleStrainSkill`

  `private String`

  `prop1`

  `private String`

  `prop2`

  `private String`

  `sound`

  `private ActionSoundTime`

  `soundTime`

  `private int`

  `time`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TimedActionScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `applyMuscleStrain(IsoGameCharacter player)`

  `String`

  `getActionAnim()`

  `String`

  `getAnimVarKey()`

  `String`

  `getAnimVarVal()`

  `String`

  `getCompletionSound()`

  `String`

  `getFullType()`

  `Metabolics`

  `getMetabolics()`

  `String`

  `getName()`

  `String`

  `getProp1()`

  `String`

  `getProp2()`

  `String`

  `getSound()`

  `ActionSoundTime`

  `getSoundTime()`

  `int`

  `getTime()`

  `boolean`

  `hasMuscleStrain()`

  `boolean`

  `isCantSit()`

  `boolean`

  `isFaceObject()`

  `void`

  `Load(String name,
  String body)`

  `void`

  `PreReload()`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### metabolics

    private [Metabolics](../../characters/BodyDamage/Metabolics.html "enum class in zombie.characters.BodyDamage") metabolics
  + ### time

    private int time
  + ### faceObject

    private boolean faceObject
  + ### prop1

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prop1
  + ### prop2

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prop2
  + ### actionAnim

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") actionAnim
  + ### animVarKey

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animVarKey
  + ### animVarVal

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animVarVal
  + ### sound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sound
  + ### soundTime

    private [ActionSoundTime](ActionSoundTime.html "enum class in zombie.scripting.objects") soundTime
  + ### completionSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") completionSound
  + ### muscleStrainFactor

    private float muscleStrainFactor
  + ### muscleStrainParts

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[BodyPartType](../../characters/BodyDamage/BodyPartType.html "enum class in zombie.characters.BodyDamage")> muscleStrainParts
  + ### muscleStrainSkill

    private [PerkFactory.Perk](../../characters/skills/PerkFactory.Perk.html "class in zombie.characters.skills") muscleStrainSkill
  + ### cantSit

    private boolean cantSit
* Constructor Details
  -------------------

  + ### TimedActionScript

    public TimedActionScript()
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getFullType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFullType()
  + ### getMetabolics

    public [Metabolics](../../characters/BodyDamage/Metabolics.html "enum class in zombie.characters.BodyDamage") getMetabolics()
  + ### getTime

    public int getTime()
  + ### isFaceObject

    public boolean isFaceObject()
  + ### isCantSit

    public boolean isCantSit()
  + ### getProp1

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getProp1()
  + ### getProp2

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getProp2()
  + ### getActionAnim

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getActionAnim()
  + ### getAnimVarKey

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimVarKey()
  + ### getAnimVarVal

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAnimVarVal()
  + ### getSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSound()
  + ### getSoundTime

    public [ActionSoundTime](ActionSoundTime.html "enum class in zombie.scripting.objects") getSoundTime()
  + ### getCompletionSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCompletionSound()
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") body)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### PreReload

    public void PreReload()

    Overrides:
    :   `PreReload` in class `BaseScriptObject`
  + ### hasMuscleStrain

    public boolean hasMuscleStrain()
  + ### applyMuscleStrain

    public void applyMuscleStrain([IsoGameCharacter](../../characters/IsoGameCharacter.html "class in zombie.characters") player)