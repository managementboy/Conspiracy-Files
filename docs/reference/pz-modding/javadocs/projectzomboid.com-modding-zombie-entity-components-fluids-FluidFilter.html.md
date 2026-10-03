[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.fluids](package-summary.html)
2. [FluidFilter](FluidFilter.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [filterScript](#filterScript)
   2. [categories](#categories)
   3. [fluidEnums](#fluidEnums)
   4. [fluidStrings](#fluidStrings)
   5. [filterType](#filterType)
   6. [isSealed](#isSealed)
   7. [cachedFilterDisplayName](#cachedFilterDisplayName)
   8. [cachedFilterTooltipText](#cachedFilterTooltipText)
7. [Constructor Details](#constructor-detail)
   1. [FluidFilter()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [setFilterScript(String)](#setFilterScript(java.lang.String))
   2. [toString()](#toString())
   3. [seal()](#seal())
   4. [isSealed()](#isSealed())
   5. [copy()](#copy())
   6. [getFilterType()](#getFilterType())
   7. [setFilterType(FluidFilter.FilterType)](#setFilterType(zombie.entity.components.fluids.FluidFilter.FilterType))
   8. [add(FluidCategory)](#add(zombie.entity.components.fluids.FluidCategory))
   9. [remove(FluidCategory)](#remove(zombie.entity.components.fluids.FluidCategory))
   10. [contains(FluidCategory)](#contains(zombie.entity.components.fluids.FluidCategory))
   11. [add(FluidType)](#add(zombie.entity.components.fluids.FluidType))
   12. [add(Fluid)](#add(zombie.entity.components.fluids.Fluid))
   13. [add(String)](#add(java.lang.String))
   14. [remove(FluidType)](#remove(zombie.entity.components.fluids.FluidType))
   15. [remove(Fluid)](#remove(zombie.entity.components.fluids.Fluid))
   16. [remove(String)](#remove(java.lang.String))
   17. [contains(FluidType)](#contains(zombie.entity.components.fluids.FluidType))
   18. [contains(Fluid)](#contains(zombie.entity.components.fluids.Fluid))
   19. [contains(String)](#contains(java.lang.String))
   20. [allows(FluidType)](#allows(zombie.entity.components.fluids.FluidType))
   21. [allows(Fluid)](#allows(zombie.entity.components.fluids.Fluid))
   22. [allows(String)](#allows(java.lang.String))
   23. [getFilterDisplayName()](#getFilterDisplayName())
   24. [getFilterTooltipText()](#getFilterTooltipText())
   25. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   26. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class FluidFilter
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.fluids.FluidFilter

---

public class FluidFilter
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `FluidFilter.FilterType`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `cachedFilterDisplayName`

  `private String`

  `cachedFilterTooltipText`

  `private final EnumSet<FluidCategory>`

  `categories`

  `private FluidFilterScript`

  `filterScript`

  `private FluidFilter.FilterType`

  `filterType`

  `private final EnumSet<FluidType>`

  `fluidEnums`

  `private final HashSet<String>`

  `fluidStrings`

  `private boolean`

  `isSealed`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FluidFilter()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `FluidFilter`

  `add(String fluid)`

  `FluidFilter`

  `add(Fluid fluid)`

  `FluidFilter`

  `add(FluidCategory category)`

  `FluidFilter`

  `add(FluidType fluid)`

  `boolean`

  `allows(String fluidString)`

  `boolean`

  `allows(Fluid fluid)`

  `boolean`

  `allows(FluidType fluidType)`

  `boolean`

  `contains(String fluid)`

  `boolean`

  `contains(Fluid fluid)`

  `boolean`

  `contains(FluidCategory category)`

  `boolean`

  `contains(FluidType fluid)`

  `FluidFilter`

  `copy()`

  `String`

  `getFilterDisplayName()`

  `String`

  `getFilterTooltipText()`

  `FluidFilter.FilterType`

  `getFilterType()`

  `boolean`

  `isSealed()`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `FluidFilter`

  `remove(String fluid)`

  `FluidFilter`

  `remove(Fluid fluid)`

  `FluidFilter`

  `remove(FluidCategory category)`

  `FluidFilter`

  `remove(FluidType fluid)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `seal()`

  `void`

  `setFilterScript(String filterScriptName)`

  `FluidFilter`

  `setFilterType(FluidFilter.FilterType filterType)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### filterScript

    private [FluidFilterScript](../../../scripting/objects/FluidFilterScript.html "class in zombie.scripting.objects") filterScript
  + ### categories

    private final [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids")> categories
  + ### fluidEnums

    private final [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[FluidType](FluidType.html "enum class in zombie.entity.components.fluids")> fluidEnums
  + ### fluidStrings

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> fluidStrings
  + ### filterType

    private [FluidFilter.FilterType](FluidFilter.FilterType.html "enum class in zombie.entity.components.fluids") filterType
  + ### isSealed

    private boolean isSealed
  + ### cachedFilterDisplayName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") cachedFilterDisplayName
  + ### cachedFilterTooltipText

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") cachedFilterTooltipText
* Constructor Details
  -------------------

  + ### FluidFilter

    public FluidFilter()
* Method Details
  --------------

  + ### setFilterScript

    public void setFilterScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filterScriptName)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### seal

    public void seal()
  + ### isSealed

    public boolean isSealed()
  + ### copy

    public [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") copy()
  + ### getFilterType

    public [FluidFilter.FilterType](FluidFilter.FilterType.html "enum class in zombie.entity.components.fluids") getFilterType()
  + ### setFilterType

    public [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") setFilterType([FluidFilter.FilterType](FluidFilter.FilterType.html "enum class in zombie.entity.components.fluids") filterType)
  + ### add

    public [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") add([FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") category)
  + ### remove

    public [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") remove([FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") category)
  + ### contains

    public boolean contains([FluidCategory](FluidCategory.html "enum class in zombie.entity.components.fluids") category)
  + ### add

    public [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") add([FluidType](FluidType.html "enum class in zombie.entity.components.fluids") fluid)
  + ### add

    public [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") add([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid)
  + ### add

    public [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") add([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluid)
  + ### remove

    public [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") remove([FluidType](FluidType.html "enum class in zombie.entity.components.fluids") fluid)
  + ### remove

    public [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") remove([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid)
  + ### remove

    public [FluidFilter](FluidFilter.html "class in zombie.entity.components.fluids") remove([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluid)
  + ### contains

    public boolean contains([FluidType](FluidType.html "enum class in zombie.entity.components.fluids") fluid)
  + ### contains

    public boolean contains([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid)
  + ### contains

    public boolean contains([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluid)
  + ### allows

    public boolean allows([FluidType](FluidType.html "enum class in zombie.entity.components.fluids") fluidType)
  + ### allows

    public boolean allows([Fluid](Fluid.html "class in zombie.entity.components.fluids") fluid)
  + ### allows

    public boolean allows([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluidString)
  + ### getFilterDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFilterDisplayName()
  + ### getFilterTooltipText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFilterTooltipText()
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`