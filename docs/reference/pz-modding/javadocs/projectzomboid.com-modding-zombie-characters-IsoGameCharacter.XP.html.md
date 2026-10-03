[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [IsoGameCharacter](IsoGameCharacter.html)
3. [XP](IsoGameCharacter.XP.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [level](#level)
   2. [lastlevel](#lastlevel)
   3. [totalXp](#totalXp)
   4. [xpMap](#xpMap)
   5. [xpMapMultiplier](#xpMapMultiplier)
   6. [chr](#chr)
6. [Constructor Details](#constructor-detail)
   1. [XP(IsoGameCharacter)](#%3Cinit%3E(zombie.characters.IsoGameCharacter))
7. [Method Details](#method-detail)
   1. [addXpMultiplier(PerkFactory.Perk, float, int, int)](#addXpMultiplier(zombie.characters.skills.PerkFactory.Perk,float,int,int))
   2. [getMultiplierMap()](#getMultiplierMap())
   3. [getMultiplier(PerkFactory.Perk)](#getMultiplier(zombie.characters.skills.PerkFactory.Perk))
   4. [getPerkBoost(PerkFactory.Perk)](#getPerkBoost(zombie.characters.skills.PerkFactory.Perk))
   5. [setPerkBoost(PerkFactory.Perk, int)](#setPerkBoost(zombie.characters.skills.PerkFactory.Perk,int))
   6. [getLevel()](#getLevel())
   7. [setLevel(int)](#setLevel(int))
   8. [getTotalXp()](#getTotalXp())
   9. [AddXP(PerkFactory.Perk, float)](#AddXP(zombie.characters.skills.PerkFactory.Perk,float))
   10. [AddXPHaloText(PerkFactory.Perk, float)](#AddXPHaloText(zombie.characters.skills.PerkFactory.Perk,float))
   11. [AddXP(PerkFactory.Perk, float, boolean)](#AddXP(zombie.characters.skills.PerkFactory.Perk,float,boolean))
   12. [AddXP(PerkFactory.Perk, float, boolean, boolean)](#AddXP(zombie.characters.skills.PerkFactory.Perk,float,boolean,boolean))
   13. [AddXPNoMultiplier(PerkFactory.Perk, float)](#AddXPNoMultiplier(zombie.characters.skills.PerkFactory.Perk,float))
   14. [AddXP(PerkFactory.Perk, float, boolean, boolean, boolean)](#AddXP(zombie.characters.skills.PerkFactory.Perk,float,boolean,boolean,boolean))
   15. [AddXP(PerkFactory.Perk, float, boolean, boolean, boolean, boolean)](#AddXP(zombie.characters.skills.PerkFactory.Perk,float,boolean,boolean,boolean,boolean))
   16. [isSkillExcludedFromSpeedReduction(PerkFactory.Perk)](#isSkillExcludedFromSpeedReduction(zombie.characters.skills.PerkFactory.Perk))
   17. [isSkillExcludedFromSpeedIncrease(PerkFactory.Perk)](#isSkillExcludedFromSpeedIncrease(zombie.characters.skills.PerkFactory.Perk))
   18. [getXP(PerkFactory.Perk)](#getXP(zombie.characters.skills.PerkFactory.Perk))
   19. [AddXP(HandWeapon, int)](#AddXP(zombie.inventory.types.HandWeapon,int))
   20. [setTotalXP(float)](#setTotalXP(float))
   21. [savePerk(ByteBuffer, PerkFactory.Perk)](#savePerk(java.nio.ByteBuffer,zombie.characters.skills.PerkFactory.Perk))
   22. [loadPerk(ByteBuffer, int)](#loadPerk(java.nio.ByteBuffer,int))
   23. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   24. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   25. [setXPToLevel(PerkFactory.Perk, int)](#setXPToLevel(zombie.characters.skills.PerkFactory.Perk,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoGameCharacter.XP
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.IsoGameCharacter.XP

Enclosing class:
:   `IsoGameCharacter`

---

public class IsoGameCharacter.XP
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final IsoGameCharacter`

  `chr`

  `int`

  `lastlevel`

  `int`

  `level`

  `float`

  `totalXp`

  `HashMap<PerkFactory.Perk, Float>`

  `xpMap`

  `HashMap<PerkFactory.Perk, IsoGameCharacter.XPMultiplier>`

  `xpMapMultiplier`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `XP(IsoGameCharacter chr)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `AddXP(PerkFactory.Perk type,
  float amount)`

  `void`

  `AddXP(PerkFactory.Perk type,
  float amount,
  boolean noMultiplier)`

  `void`

  `AddXP(PerkFactory.Perk type,
  float amount,
  boolean noMultiplier,
  boolean haloText)`

  `void`

  `AddXP(PerkFactory.Perk type,
  float amount,
  boolean callLua,
  boolean doXPBoost,
  boolean remote)`

  `void`

  `AddXP(PerkFactory.Perk type,
  float amount,
  boolean callLua,
  boolean doXPBoost,
  boolean remote,
  boolean haloText)`

  `void`

  `AddXP(HandWeapon weapon,
  int amount)`

  Deprecated.

  `void`

  `AddXPHaloText(PerkFactory.Perk type,
  float amount)`

  `void`

  `addXpMultiplier(PerkFactory.Perk perks,
  float multiplier,
  int minLevel,
  int maxLevel)`

  `void`

  `AddXPNoMultiplier(PerkFactory.Perk type,
  float amount)`

  `int`

  `getLevel()`

  `float`

  `getMultiplier(PerkFactory.Perk perk)`

  `HashMap<PerkFactory.Perk, IsoGameCharacter.XPMultiplier>`

  `getMultiplierMap()`

  `int`

  `getPerkBoost(PerkFactory.Perk type)`

  `float`

  `getTotalXp()`

  `float`

  `getXP(PerkFactory.Perk type)`

  `private boolean`

  `isSkillExcludedFromSpeedIncrease(PerkFactory.Perk key)`

  `private boolean`

  `isSkillExcludedFromSpeedReduction(PerkFactory.Perk key)`

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  `private PerkFactory.Perk`

  `loadPerk(ByteBuffer input,
  int worldVersion)`

  `void`

  `save(ByteBuffer output)`

  `private void`

  `savePerk(ByteBuffer output,
  PerkFactory.Perk perk)`

  `void`

  `setLevel(int newlevel)`

  `void`

  `setPerkBoost(PerkFactory.Perk perk,
  int level)`

  `void`

  `setTotalXP(float xp)`

  `void`

  `setXPToLevel(PerkFactory.Perk key,
  int perkLevel)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### level

    public int level
  + ### lastlevel

    public int lastlevel
  + ### totalXp

    public float totalXp
  + ### xpMap

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills"), [Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> xpMap
  + ### xpMapMultiplier

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills"), [IsoGameCharacter.XPMultiplier](IsoGameCharacter.XPMultiplier.html "class in zombie.characters")> xpMapMultiplier
  + ### chr

    private final [IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") chr
* Constructor Details
  -------------------

  + ### XP

    public XP([IsoGameCharacter](IsoGameCharacter.html "class in zombie.characters") chr)
* Method Details
  --------------

  + ### addXpMultiplier

    public void addXpMultiplier([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") perks,
    float multiplier,
    int minLevel,
    int maxLevel)
  + ### getMultiplierMap

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills"), [IsoGameCharacter.XPMultiplier](IsoGameCharacter.XPMultiplier.html "class in zombie.characters")> getMultiplierMap()
  + ### getMultiplier

    public float getMultiplier([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk)
  + ### getPerkBoost

    public int getPerkBoost([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") type)
  + ### setPerkBoost

    public void setPerkBoost([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk,
    int level)
  + ### getLevel

    public int getLevel()
  + ### setLevel

    public void setLevel(int newlevel)
  + ### getTotalXp

    public float getTotalXp()
  + ### AddXP

    public void AddXP([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") type,
    float amount)
  + ### AddXPHaloText

    public void AddXPHaloText([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") type,
    float amount)
  + ### AddXP

    public void AddXP([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") type,
    float amount,
    boolean noMultiplier)
  + ### AddXP

    public void AddXP([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") type,
    float amount,
    boolean noMultiplier,
    boolean haloText)
  + ### AddXPNoMultiplier

    public void AddXPNoMultiplier([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") type,
    float amount)
  + ### AddXP

    public void AddXP([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") type,
    float amount,
    boolean callLua,
    boolean doXPBoost,
    boolean remote)
  + ### AddXP

    public void AddXP([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") type,
    float amount,
    boolean callLua,
    boolean doXPBoost,
    boolean remote,
    boolean haloText)
  + ### isSkillExcludedFromSpeedReduction

    private boolean isSkillExcludedFromSpeedReduction([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") key)
  + ### isSkillExcludedFromSpeedIncrease

    private boolean isSkillExcludedFromSpeedIncrease([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") key)
  + ### getXP

    public float getXP([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") type)
  + ### AddXP

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void AddXP([HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") weapon,
    int amount)

    Deprecated.
  + ### setTotalXP

    public void setTotalXP(float xp)
  + ### savePerk

    private void savePerk([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    [PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") perk)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### loadPerk

    private [PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") loadPerk([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### setXPToLevel

    public void setXPToLevel([PerkFactory.Perk](skills/PerkFactory.Perk.html "class in zombie.characters.skills") key,
    int perkLevel)