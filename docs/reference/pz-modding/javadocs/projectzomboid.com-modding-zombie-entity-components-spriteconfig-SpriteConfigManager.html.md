[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.spriteconfig](package-summary.html)
2. [SpriteConfigManager](SpriteConfigManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [FACE\_SINGLE](#FACE_SINGLE)
   2. [FACE\_N](#FACE_N)
   3. [FACE\_W](#FACE_W)
   4. [FACE\_S](#FACE_S)
   5. [FACE\_E](#FACE_E)
   6. [FACE\_N\_OPEN](#FACE_N_OPEN)
   7. [FACE\_W\_OPEN](#FACE_W_OPEN)
   8. [FACE\_ID\_SINGLE](#FACE_ID_SINGLE)
   9. [FACE\_ID\_N](#FACE_ID_N)
   10. [FACE\_ID\_W](#FACE_ID_W)
   11. [FACE\_ID\_S](#FACE_ID_S)
   12. [FACE\_ID\_E](#FACE_ID_E)
   13. [FACE\_ID\_CARDINAL\_MAX](#FACE_ID_CARDINAL_MAX)
   14. [FACE\_ID\_N\_OPEN](#FACE_ID_N_OPEN)
   15. [FACE\_ID\_W\_OPEN](#FACE_ID_W_OPEN)
   16. [FACE\_ID\_MAX](#FACE_ID_MAX)
   17. [hasLoadErrors](#hasLoadErrors)
   18. [objectInfos](#objectInfos)
   19. [objectInfosList](#objectInfosList)
   20. [registeredScriptedSprites](#registeredScriptedSprites)
   21. [tempFaceSprites](#tempFaceSprites)
7. [Constructor Details](#constructor-detail)
   1. [SpriteConfigManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [GetFaceIdForString(String)](#GetFaceIdForString(java.lang.String))
   2. [HasLoadErrors()](#HasLoadErrors())
   3. [GetObjectInfo(String)](#GetObjectInfo(java.lang.String))
   4. [getObjectInfoFromSprite(String)](#getObjectInfoFromSprite(java.lang.String))
   5. [GetObjectInfoList()](#GetObjectInfoList())
   6. [Reset()](#Reset())
   7. [InitScriptsPostTileDef()](#InitScriptsPostTileDef())
   8. [parseEntityScript(GameEntityScript)](#parseEntityScript(zombie.scripting.entity.GameEntityScript))
   9. [parseSpriteConfigScript(SpriteConfigScript)](#parseSpriteConfigScript(zombie.scripting.entity.components.spriteconfig.SpriteConfigScript))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class SpriteConfigManager
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.spriteconfig.SpriteConfigManager

---

public class SpriteConfigManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `SpriteConfigManager.FaceInfo`

  `static class`

  `SpriteConfigManager.ObjectInfo`

  `static class`

  `SpriteConfigManager.TileInfo`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final String`

  `FACE_E`

  `static final int`

  `FACE_ID_CARDINAL_MAX`

  `static final int`

  `FACE_ID_E`

  `static final int`

  `FACE_ID_MAX`

  `static final int`

  `FACE_ID_N`

  `static final int`

  `FACE_ID_N_OPEN`

  `static final int`

  `FACE_ID_S`

  `static final int`

  `FACE_ID_SINGLE`

  `static final int`

  `FACE_ID_W`

  `static final int`

  `FACE_ID_W_OPEN`

  `static final String`

  `FACE_N`

  `static final String`

  `FACE_N_OPEN`

  `static final String`

  `FACE_S`

  `static final String`

  `FACE_SINGLE`

  `static final String`

  `FACE_W`

  `static final String`

  `FACE_W_OPEN`

  `private static boolean`

  `hasLoadErrors`

  `private static final HashMap<String, SpriteConfigManager.ObjectInfo>`

  `objectInfos`

  `private static final ArrayList<SpriteConfigManager.ObjectInfo>`

  `objectInfosList`

  `private static final HashSet<IsoSprite>`

  `registeredScriptedSprites`

  `private static final HashSet<String>`

  `tempFaceSprites`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SpriteConfigManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static int`

  `GetFaceIdForString(String face)`

  `static SpriteConfigManager.ObjectInfo`

  `GetObjectInfo(String name)`

  `static SpriteConfigManager.ObjectInfo`

  `getObjectInfoFromSprite(String spriteName)`

  `static ArrayList<SpriteConfigManager.ObjectInfo>`

  `GetObjectInfoList()`

  `static boolean`

  `HasLoadErrors()`

  `static void`

  `InitScriptsPostTileDef()`

  `private static void`

  `parseEntityScript(GameEntityScript entityScript)`

  `private static boolean`

  `parseSpriteConfigScript(SpriteConfigScript configScript)`

  `static void`

  `Reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### FACE\_SINGLE

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FACE\_SINGLE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_SINGLE)
  + ### FACE\_N

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FACE\_N

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_N)
  + ### FACE\_W

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FACE\_W

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_W)
  + ### FACE\_S

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FACE\_S

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_S)
  + ### FACE\_E

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FACE\_E

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_E)
  + ### FACE\_N\_OPEN

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FACE\_N\_OPEN

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_N_OPEN)
  + ### FACE\_W\_OPEN

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") FACE\_W\_OPEN

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_W_OPEN)
  + ### FACE\_ID\_SINGLE

    public static final int FACE\_ID\_SINGLE

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_ID_SINGLE)
  + ### FACE\_ID\_N

    public static final int FACE\_ID\_N

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_ID_N)
  + ### FACE\_ID\_W

    public static final int FACE\_ID\_W

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_ID_W)
  + ### FACE\_ID\_S

    public static final int FACE\_ID\_S

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_ID_S)
  + ### FACE\_ID\_E

    public static final int FACE\_ID\_E

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_ID_E)
  + ### FACE\_ID\_CARDINAL\_MAX

    public static final int FACE\_ID\_CARDINAL\_MAX

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_ID_CARDINAL_MAX)
  + ### FACE\_ID\_N\_OPEN

    public static final int FACE\_ID\_N\_OPEN

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_ID_N_OPEN)
  + ### FACE\_ID\_W\_OPEN

    public static final int FACE\_ID\_W\_OPEN

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_ID_W_OPEN)
  + ### FACE\_ID\_MAX

    public static final int FACE\_ID\_MAX

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.entity.components.spriteconfig.SpriteConfigManager.FACE_ID_MAX)
  + ### hasLoadErrors

    private static boolean hasLoadErrors
  + ### objectInfos

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [SpriteConfigManager.ObjectInfo](SpriteConfigManager.ObjectInfo.html "class in zombie.entity.components.spriteconfig")> objectInfos
  + ### objectInfosList

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SpriteConfigManager.ObjectInfo](SpriteConfigManager.ObjectInfo.html "class in zombie.entity.components.spriteconfig")> objectInfosList
  + ### registeredScriptedSprites

    private static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[IsoSprite](../../../iso/sprite/IsoSprite.html "class in zombie.iso.sprite")> registeredScriptedSprites
  + ### tempFaceSprites

    private static final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tempFaceSprites
* Constructor Details
  -------------------

  + ### SpriteConfigManager

    public SpriteConfigManager()
* Method Details
  --------------

  + ### GetFaceIdForString

    public static int GetFaceIdForString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") face)
  + ### HasLoadErrors

    public static boolean HasLoadErrors()
  + ### GetObjectInfo

    public static [SpriteConfigManager.ObjectInfo](SpriteConfigManager.ObjectInfo.html "class in zombie.entity.components.spriteconfig") GetObjectInfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getObjectInfoFromSprite

    public static [SpriteConfigManager.ObjectInfo](SpriteConfigManager.ObjectInfo.html "class in zombie.entity.components.spriteconfig") getObjectInfoFromSprite([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### GetObjectInfoList

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[SpriteConfigManager.ObjectInfo](SpriteConfigManager.ObjectInfo.html "class in zombie.entity.components.spriteconfig")> GetObjectInfoList()
  + ### Reset

    public static void Reset()
  + ### InitScriptsPostTileDef

    public static void InitScriptsPostTileDef()
  + ### parseEntityScript

    private static void parseEntityScript([GameEntityScript](../../../scripting/entity/GameEntityScript.html "class in zombie.scripting.entity") entityScript)
  + ### parseSpriteConfigScript

    private static boolean parseSpriteConfigScript([SpriteConfigScript](../../../scripting/entity/components/spriteconfig/SpriteConfigScript.html "class in zombie.scripting.entity.components.spriteconfig") configScript)