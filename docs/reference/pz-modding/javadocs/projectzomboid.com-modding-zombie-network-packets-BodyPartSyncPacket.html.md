[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.network.packets](package-summary.html)
2. [BodyPartSyncPacket](BodyPartSyncPacket.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [BD\_Health](#BD_Health)
   2. [BD\_bandaged](#BD_bandaged)
   3. [BD\_bitten](#BD_bitten)
   4. [BD\_bleeding](#BD_bleeding)
   5. [BD\_IsBleedingStemmed](#BD_IsBleedingStemmed)
   6. [BD\_IsCauterized](#BD_IsCauterized)
   7. [BD\_scratched](#BD_scratched)
   8. [BD\_stitched](#BD_stitched)
   9. [BD\_deepWounded](#BD_deepWounded)
   10. [BD\_IsInfected](#BD_IsInfected)
   11. [BD\_IsFakeInfected](#BD_IsFakeInfected)
   12. [BD\_bandageLife](#BD_bandageLife)
   13. [BD\_scratchTime](#BD_scratchTime)
   14. [BD\_biteTime](#BD_biteTime)
   15. [BD\_alcoholicBandage](#BD_alcoholicBandage)
   16. [BD\_woundInfectionLevel](#BD_woundInfectionLevel)
   17. [BD\_infectedWound](#BD_infectedWound)
   18. [BD\_bleedingTime](#BD_bleedingTime)
   19. [BD\_deepWoundTime](#BD_deepWoundTime)
   20. [BD\_haveGlass](#BD_haveGlass)
   21. [BD\_stitchTime](#BD_stitchTime)
   22. [BD\_alcoholLevel](#BD_alcoholLevel)
   23. [BD\_additionalPain](#BD_additionalPain)
   24. [BD\_bandageType](#BD_bandageType)
   25. [BD\_getBandageXp](#BD_getBandageXp)
   26. [BD\_getStitchXp](#BD_getStitchXp)
   27. [BD\_getSplintXp](#BD_getSplintXp)
   28. [BD\_fractureTime](#BD_fractureTime)
   29. [BD\_splint](#BD_splint)
   30. [BD\_splintFactor](#BD_splintFactor)
   31. [BD\_haveBullet](#BD_haveBullet)
   32. [BD\_burnTime](#BD_burnTime)
   33. [BD\_needBurnWash](#BD_needBurnWash)
   34. [BD\_lastTimeBurnWash](#BD_lastTimeBurnWash)
   35. [BD\_splintItem](#BD_splintItem)
   36. [BD\_plantainFactor](#BD_plantainFactor)
   37. [BD\_comfreyFactor](#BD_comfreyFactor)
   38. [BD\_garlicFactor](#BD_garlicFactor)
   39. [BD\_cut](#BD_cut)
   40. [BD\_cutTime](#BD_cutTime)
   41. [BD\_stiffness](#BD_stiffness)
   42. [BD\_BodyDamage](#BD_BodyDamage)
   43. [playerId](#playerId)
   44. [bodyPart](#bodyPart)
   45. [syncParams](#syncParams)
6. [Constructor Details](#constructor-detail)
   1. [BodyPartSyncPacket()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [setData(Object...)](#setData(java.lang.Object...))
   2. [parse(ByteBufferReader, IConnection)](#parse(zombie.core.network.ByteBufferReader,zombie.network.IConnection))
   3. [write(ByteBufferWriter)](#write(zombie.core.network.ByteBufferWriter))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class BodyPartSyncPacket
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.packets.BodyPartSyncPacket

All Implemented Interfaces:
:   `zombie.network.fields.INetworkPacketField, zombie.network.packets.IDescriptor, zombie.network.packets.INetworkPacket`

---

public class BodyPartSyncPacket
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements zombie.network.packets.INetworkPacket

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final long`

  `BD_additionalPain`

  `static final long`

  `BD_alcoholicBandage`

  `static final long`

  `BD_alcoholLevel`

  `static final long`

  `BD_bandaged`

  `static final long`

  `BD_bandageLife`

  `static final long`

  `BD_bandageType`

  `static final long`

  `BD_biteTime`

  `static final long`

  `BD_bitten`

  `static final long`

  `BD_bleeding`

  `static final long`

  `BD_bleedingTime`

  `static final long`

  `BD_BodyDamage`

  `static final long`

  `BD_burnTime`

  `static final long`

  `BD_comfreyFactor`

  `static final long`

  `BD_cut`

  `static final long`

  `BD_cutTime`

  `static final long`

  `BD_deepWounded`

  `static final long`

  `BD_deepWoundTime`

  `static final long`

  `BD_fractureTime`

  `static final long`

  `BD_garlicFactor`

  `static final long`

  `BD_getBandageXp`

  `static final long`

  `BD_getSplintXp`

  `static final long`

  `BD_getStitchXp`

  `static final long`

  `BD_haveBullet`

  `static final long`

  `BD_haveGlass`

  `static final long`

  `BD_Health`

  `static final long`

  `BD_infectedWound`

  `static final long`

  `BD_IsBleedingStemmed`

  `static final long`

  `BD_IsCauterized`

  `static final long`

  `BD_IsFakeInfected`

  `static final long`

  `BD_IsInfected`

  `static final long`

  `BD_lastTimeBurnWash`

  `static final long`

  `BD_needBurnWash`

  `static final long`

  `BD_plantainFactor`

  `static final long`

  `BD_scratched`

  `static final long`

  `BD_scratchTime`

  `static final long`

  `BD_splint`

  `static final long`

  `BD_splintFactor`

  `static final long`

  `BD_splintItem`

  `static final long`

  `BD_stiffness`

  `static final long`

  `BD_stitched`

  `static final long`

  `BD_stitchTime`

  `static final long`

  `BD_woundInfectionLevel`

  `(package private) BodyPart`

  `bodyPart`

  `(package private) zombie.network.fields.character.PlayerID`

  `playerId`

  `(package private) long`

  `syncParams`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BodyPartSyncPacket()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `parse(zombie.core.network.ByteBufferReader b,
  zombie.network.IConnection connection)`

  `void`

  `setData(Object... values)`

  This methods sets the packet data from varargs

  `void`

  `write(zombie.core.network.ByteBufferWriter b)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.network.packets.IDescriptor

  `getClassDescription, getDescription, getDescription`

  ### Methods inherited from interface zombie.network.packets.INetworkPacket

  `isPostponed, logInconsistentPacket, parseClient, parseClientLoading, parseServer, postpone, processClient, processClientLoading, processServer, sendToClient, sendToClient, sendToClients, sendToRelativeClients, sendToServer, shouldInstantiate, sync`

  ### Methods inherited from interface zombie.network.fields.INetworkPacketField

  `getPacketSizeBytes, isConsistent`

* Field Details
  -------------

  + ### BD\_Health

    public static final long BD\_Health

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_Health)
  + ### BD\_bandaged

    public static final long BD\_bandaged

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_bandaged)
  + ### BD\_bitten

    public static final long BD\_bitten

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_bitten)
  + ### BD\_bleeding

    public static final long BD\_bleeding

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_bleeding)
  + ### BD\_IsBleedingStemmed

    public static final long BD\_IsBleedingStemmed

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_IsBleedingStemmed)
  + ### BD\_IsCauterized

    public static final long BD\_IsCauterized

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_IsCauterized)
  + ### BD\_scratched

    public static final long BD\_scratched

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_scratched)
  + ### BD\_stitched

    public static final long BD\_stitched

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_stitched)
  + ### BD\_deepWounded

    public static final long BD\_deepWounded

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_deepWounded)
  + ### BD\_IsInfected

    public static final long BD\_IsInfected

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_IsInfected)
  + ### BD\_IsFakeInfected

    public static final long BD\_IsFakeInfected

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_IsFakeInfected)
  + ### BD\_bandageLife

    public static final long BD\_bandageLife

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_bandageLife)
  + ### BD\_scratchTime

    public static final long BD\_scratchTime

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_scratchTime)
  + ### BD\_biteTime

    public static final long BD\_biteTime

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_biteTime)
  + ### BD\_alcoholicBandage

    public static final long BD\_alcoholicBandage

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_alcoholicBandage)
  + ### BD\_woundInfectionLevel

    public static final long BD\_woundInfectionLevel

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_woundInfectionLevel)
  + ### BD\_infectedWound

    public static final long BD\_infectedWound

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_infectedWound)
  + ### BD\_bleedingTime

    public static final long BD\_bleedingTime

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_bleedingTime)
  + ### BD\_deepWoundTime

    public static final long BD\_deepWoundTime

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_deepWoundTime)
  + ### BD\_haveGlass

    public static final long BD\_haveGlass

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_haveGlass)
  + ### BD\_stitchTime

    public static final long BD\_stitchTime

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_stitchTime)
  + ### BD\_alcoholLevel

    public static final long BD\_alcoholLevel

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_alcoholLevel)
  + ### BD\_additionalPain

    public static final long BD\_additionalPain

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_additionalPain)
  + ### BD\_bandageType

    public static final long BD\_bandageType

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_bandageType)
  + ### BD\_getBandageXp

    public static final long BD\_getBandageXp

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_getBandageXp)
  + ### BD\_getStitchXp

    public static final long BD\_getStitchXp

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_getStitchXp)
  + ### BD\_getSplintXp

    public static final long BD\_getSplintXp

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_getSplintXp)
  + ### BD\_fractureTime

    public static final long BD\_fractureTime

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_fractureTime)
  + ### BD\_splint

    public static final long BD\_splint

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_splint)
  + ### BD\_splintFactor

    public static final long BD\_splintFactor

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_splintFactor)
  + ### BD\_haveBullet

    public static final long BD\_haveBullet

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_haveBullet)
  + ### BD\_burnTime

    public static final long BD\_burnTime

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_burnTime)
  + ### BD\_needBurnWash

    public static final long BD\_needBurnWash

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_needBurnWash)
  + ### BD\_lastTimeBurnWash

    public static final long BD\_lastTimeBurnWash

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_lastTimeBurnWash)
  + ### BD\_splintItem

    public static final long BD\_splintItem

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_splintItem)
  + ### BD\_plantainFactor

    public static final long BD\_plantainFactor

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_plantainFactor)
  + ### BD\_comfreyFactor

    public static final long BD\_comfreyFactor

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_comfreyFactor)
  + ### BD\_garlicFactor

    public static final long BD\_garlicFactor

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_garlicFactor)
  + ### BD\_cut

    public static final long BD\_cut

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_cut)
  + ### BD\_cutTime

    public static final long BD\_cutTime

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_cutTime)
  + ### BD\_stiffness

    public static final long BD\_stiffness

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_stiffness)
  + ### BD\_BodyDamage

    public static final long BD\_BodyDamage

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.network.packets.BodyPartSyncPacket.BD_BodyDamage)
  + ### playerId

    zombie.network.fields.character.PlayerID playerId
  + ### bodyPart

    [BodyPart](../../characters/BodyDamage/BodyPart.html "class in zombie.characters.BodyDamage") bodyPart
  + ### syncParams

    long syncParams
* Constructor Details
  -------------------

  + ### BodyPartSyncPacket

    public BodyPartSyncPacket()
* Method Details
  --------------

  + ### setData

    public void setData([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")... values)

    Description copied from interface: `zombie.network.packets.INetworkPacket`

    This methods sets the packet data from varargs

    Specified by:
    :   `setData` in interface `zombie.network.packets.INetworkPacket`

    Parameters:
    :   `values` - varargs packet data
  + ### parse

    public void parse(zombie.core.network.ByteBufferReader b,
    zombie.network.IConnection connection)

    Specified by:
    :   `parse` in interface `zombie.network.fields.INetworkPacketField`
  + ### write

    public void write(zombie.core.network.ByteBufferWriter b)

    Specified by:
    :   `write` in interface `zombie.network.fields.INetworkPacketField`