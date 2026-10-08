[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [Role](Role.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [maxName](#maxName)
   2. [maxDescription](#maxDescription)
   3. [id](#id)
   4. [name](#name)
   5. [description](#description)
   6. [color](#color)
   7. [isReadOnly](#isReadOnly)
   8. [position](#position)
   9. [capabilities](#capabilities)
6. [Constructor Details](#constructor-detail)
   1. [Role(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [getId()](#getId())
   2. [setId(int)](#setId(int))
   3. [getName()](#getName())
   4. [setName(String)](#setName(java.lang.String))
   5. [getDescription()](#getDescription())
   6. [setDescription(String)](#setDescription(java.lang.String))
   7. [getColor()](#getColor())
   8. [setColor(Color)](#setColor(zombie.core.Color))
   9. [isReadOnly()](#isReadOnly())
   10. [setReadOnly()](#setReadOnly())
   11. [getPosition()](#getPosition())
   12. [setPosition(int)](#setPosition(int))
   13. [getDefaults()](#getDefaults())
   14. [addCapability(Capability)](#addCapability(zombie.characters.Capability))
   15. [removeCapability(Capability)](#removeCapability(zombie.characters.Capability))
   16. [cleanCapability()](#cleanCapability())
   17. [getCapabilities()](#getCapabilities())
   18. [send(ByteBufferWriter)](#send(zombie.core.network.ByteBufferWriter))
   19. [parse(ByteBufferReader)](#parse(zombie.core.network.ByteBufferReader))
   20. [hasCapability(IsoMovingObject, Capability)](#hasCapability(zombie.iso.IsoMovingObject,zombie.characters.Capability))
   21. [hasCapability(Capability)](#hasCapability(zombie.characters.Capability))
   22. [isUsingDebugMode()](#isUsingDebugMode())
   23. [hasAdminTool()](#hasAdminTool())
   24. [hasAdminPower()](#hasAdminPower())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Role
==========

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.Role

---

public class Role
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final HashSet<Capability>`

  `capabilities`

  `private Color`

  `color`

  `private String`

  `description`

  `private int`

  `id`

  `private boolean`

  `isReadOnly`

  `private static final int`

  `maxDescription`

  `private static final int`

  `maxName`

  `private String`

  `name`

  `private int`

  `position`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Role(String name)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `addCapability(Capability capability)`

  `void`

  `cleanCapability()`

  `HashSet<Capability>`

  `getCapabilities()`

  `Color`

  `getColor()`

  `ArrayList<String>`

  `getDefaults()`

  `String`

  `getDescription()`

  `int`

  `getId()`

  `String`

  `getName()`

  `int`

  `getPosition()`

  `boolean`

  `hasAdminPower()`

  `boolean`

  `hasAdminTool()`

  `boolean`

  `hasCapability(Capability capability)`

  `static boolean`

  `hasCapability(IsoMovingObject target,
  Capability capability)`

  `boolean`

  `isReadOnly()`

  `static boolean`

  `isUsingDebugMode()`

  `void`

  `parse(zombie.core.network.ByteBufferReader input)`

  `boolean`

  `removeCapability(Capability capability)`

  `void`

  `send(zombie.core.network.ByteBufferWriter output)`

  `void`

  `setColor(Color v)`

  `void`

  `setDescription(String v)`

  `void`

  `setId(int id)`

  `void`

  `setName(String name)`

  `void`

  `setPosition(int position)`

  `void`

  `setReadOnly()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### maxName

    private static final int maxName

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.Role.maxName)
  + ### maxDescription

    private static final int maxDescription

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.characters.Role.maxDescription)
  + ### id

    private int id
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### description

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description
  + ### color

    private [Color](../core/Color.html "class in zombie.core") color
  + ### isReadOnly

    private boolean isReadOnly
  + ### position

    private int position
  + ### capabilities

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Capability](Capability.html "enum class in zombie.characters")> capabilities
* Constructor Details
  -------------------

  + ### Role

    public Role([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### getId

    public int getId()
  + ### setId

    public void setId(int id)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### setDescription

    public void setDescription([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") v)
  + ### getColor

    public [Color](../core/Color.html "class in zombie.core") getColor()
  + ### setColor

    public void setColor([Color](../core/Color.html "class in zombie.core") v)
  + ### isReadOnly

    public boolean isReadOnly()
  + ### setReadOnly

    public void setReadOnly()
  + ### getPosition

    public int getPosition()
  + ### setPosition

    public void setPosition(int position)
  + ### getDefaults

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getDefaults()
  + ### addCapability

    public boolean addCapability([Capability](Capability.html "enum class in zombie.characters") capability)
  + ### removeCapability

    public boolean removeCapability([Capability](Capability.html "enum class in zombie.characters") capability)
  + ### cleanCapability

    public void cleanCapability()
  + ### getCapabilities

    public [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Capability](Capability.html "enum class in zombie.characters")> getCapabilities()
  + ### send

    public void send(zombie.core.network.ByteBufferWriter output)
  + ### parse

    public void parse(zombie.core.network.ByteBufferReader input)
  + ### hasCapability

    public static boolean hasCapability([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") target,
    [Capability](Capability.html "enum class in zombie.characters") capability)
  + ### hasCapability

    public boolean hasCapability([Capability](Capability.html "enum class in zombie.characters") capability)
  + ### isUsingDebugMode

    public static boolean isUsingDebugMode()
  + ### hasAdminTool

    public boolean hasAdminTool()
  + ### hasAdminPower

    public boolean hasAdminPower()