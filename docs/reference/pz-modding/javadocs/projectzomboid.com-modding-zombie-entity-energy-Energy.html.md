[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.entity.energy](package-summary.html)
2. [Energy](Energy.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [hasInitialized](#hasInitialized)
   2. [energyEnumMap](#energyEnumMap)
   3. [energyStringMap](#energyStringMap)
   4. [cacheStringMap](#cacheStringMap)
   5. [allEnergies](#allEnergies)
   6. [Electric](#Electric)
   7. [Mechanical](#Mechanical)
   8. [Thermal](#Thermal)
   9. [Steam](#Steam)
   10. [VoidEnergy](#VoidEnergy)
   11. [script](#script)
   12. [energyType](#energyType)
   13. [energyTypeString](#energyTypeString)
   14. [color](#color)
6. [Constructor Details](#constructor-detail)
   1. [Energy(EnergyType)](#%3Cinit%3E(zombie.entity.energy.EnergyType))
   2. [Energy(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [addEnergy(EnergyType)](#addEnergy(zombie.entity.energy.EnergyType))
   2. [Get(EnergyType)](#Get(zombie.entity.energy.EnergyType))
   3. [Get(String)](#Get(java.lang.String))
   4. [getAllEnergies()](#getAllEnergies())
   5. [Init(ScriptLoadMode)](#Init(zombie.scripting.ScriptLoadMode))
   6. [PreReloadScripts()](#PreReloadScripts())
   7. [Reset()](#Reset())
   8. [saveEnergy(Energy, ByteBuffer)](#saveEnergy(zombie.entity.energy.Energy,java.nio.ByteBuffer))
   9. [loadEnergy(ByteBuffer, int)](#loadEnergy(java.nio.ByteBuffer,int))
   10. [setScript(EnergyDefinitionScript)](#setScript(zombie.scripting.objects.EnergyDefinitionScript))
   11. [isVanilla()](#isVanilla())
   12. [getDisplayName()](#getDisplayName())
   13. [getColor()](#getColor())
   14. [getIconTexture()](#getIconTexture())
   15. [getHorizontalBarTexture()](#getHorizontalBarTexture())
   16. [getVerticalBarTexture()](#getVerticalBarTexture())
   17. [getEnergyTypeString()](#getEnergyTypeString())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Energy
============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.energy.Energy

---

public class Energy
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<Energy>`

  `allEnergies`

  `private static final HashMap<String,Energy>`

  `cacheStringMap`

  `private final Color`

  `color`

  `static final Energy`

  `Electric`

  `private static final HashMap<EnergyType, Energy>`

  `energyEnumMap`

  `private static final HashMap<String,Energy>`

  `energyStringMap`

  `private final EnergyType`

  `energyType`

  `private final String`

  `energyTypeString`

  `private static boolean`

  `hasInitialized`

  `static final Energy`

  `Mechanical`

  `private EnergyDefinitionScript`

  `script`

  `static final Energy`

  `Steam`

  `static final Energy`

  `Thermal`

  `static final Energy`

  `VoidEnergy`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Energy(String energyTypeString)`

  `private`

  `Energy(EnergyType energyType)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static Energy`

  `addEnergy(EnergyType type)`

  `static Energy`

  `Get(String name)`

  `static Energy`

  `Get(EnergyType type)`

  `static ArrayList<Energy>`

  `getAllEnergies()`

  `Color`

  `getColor()`

  `String`

  `getDisplayName()`

  `String`

  `getEnergyTypeString()`

  `Texture`

  `getHorizontalBarTexture()`

  `Texture`

  `getIconTexture()`

  `Texture`

  `getVerticalBarTexture()`

  `static void`

  `Init(zombie.scripting.ScriptLoadMode loadMode)`

  `boolean`

  `isVanilla()`

  `static Energy`

  `loadEnergy(ByteBuffer input,
  int worldVersion)`

  `static void`

  `PreReloadScripts()`

  `static void`

  `Reset()`

  `static void`

  `saveEnergy(Energy energy,
  ByteBuffer output)`

  `private void`

  `setScript(EnergyDefinitionScript script)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### hasInitialized

    private static boolean hasInitialized
  + ### energyEnumMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[EnergyType](EnergyType.html "enum class in zombie.entity.energy"), [Energy](Energy.html "class in zombie.entity.energy")> energyEnumMap
  + ### energyStringMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Energy](Energy.html "class in zombie.entity.energy")> energyStringMap
  + ### cacheStringMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Energy](Energy.html "class in zombie.entity.energy")> cacheStringMap
  + ### allEnergies

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Energy](Energy.html "class in zombie.entity.energy")> allEnergies
  + ### Electric

    public static final [Energy](Energy.html "class in zombie.entity.energy") Electric
  + ### Mechanical

    public static final [Energy](Energy.html "class in zombie.entity.energy") Mechanical
  + ### Thermal

    public static final [Energy](Energy.html "class in zombie.entity.energy") Thermal
  + ### Steam

    public static final [Energy](Energy.html "class in zombie.entity.energy") Steam
  + ### VoidEnergy

    public static final [Energy](Energy.html "class in zombie.entity.energy") VoidEnergy
  + ### script

    private [EnergyDefinitionScript](../../scripting/objects/EnergyDefinitionScript.html "class in zombie.scripting.objects") script
  + ### energyType

    private final [EnergyType](EnergyType.html "enum class in zombie.entity.energy") energyType
  + ### energyTypeString

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") energyTypeString
  + ### color

    private final [Color](../../core/Color.html "class in zombie.core") color
* Constructor Details
  -------------------

  + ### Energy

    private Energy([EnergyType](EnergyType.html "enum class in zombie.entity.energy") energyType)
  + ### Energy

    private Energy([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") energyTypeString)
* Method Details
  --------------

  + ### addEnergy

    private static [Energy](Energy.html "class in zombie.entity.energy") addEnergy([EnergyType](EnergyType.html "enum class in zombie.entity.energy") type)
  + ### Get

    public static [Energy](Energy.html "class in zombie.entity.energy") Get([EnergyType](EnergyType.html "enum class in zombie.entity.energy") type)
  + ### Get

    public static [Energy](Energy.html "class in zombie.entity.energy") Get([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAllEnergies

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Energy](Energy.html "class in zombie.entity.energy")> getAllEnergies()
  + ### Init

    public static void Init(zombie.scripting.ScriptLoadMode loadMode)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### PreReloadScripts

    public static void PreReloadScripts()
  + ### Reset

    public static void Reset()
  + ### saveEnergy

    public static void saveEnergy([Energy](Energy.html "class in zombie.entity.energy") energy,
    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### loadEnergy

    public static [Energy](Energy.html "class in zombie.entity.energy") loadEnergy([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
  + ### setScript

    private void setScript([EnergyDefinitionScript](../../scripting/objects/EnergyDefinitionScript.html "class in zombie.scripting.objects") script)
  + ### isVanilla

    public boolean isVanilla()
  + ### getDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName()
  + ### getColor

    public [Color](../../core/Color.html "class in zombie.core") getColor()
  + ### getIconTexture

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getIconTexture()
  + ### getHorizontalBarTexture

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getHorizontalBarTexture()
  + ### getVerticalBarTexture

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getVerticalBarTexture()
  + ### getEnergyTypeString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEnergyTypeString()