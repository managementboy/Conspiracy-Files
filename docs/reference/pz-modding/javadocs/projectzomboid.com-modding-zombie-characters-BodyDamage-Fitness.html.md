[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.BodyDamage](package-summary.html)
2. [Fitness](Fitness.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [parent](#parent)
   2. [regularityMap](#regularityMap)
   3. [fitnessLvl](#fitnessLvl)
   4. [strLvl](#strLvl)
   5. [stiffnessTimerMap](#stiffnessTimerMap)
   6. [stiffnessIncMap](#stiffnessIncMap)
   7. [bodypartToIncStiffness](#bodypartToIncStiffness)
   8. [exercises](#exercises)
   9. [exeTimer](#exeTimer)
   10. [lastUpdate](#lastUpdate)
   11. [currentExe](#currentExe)
   12. [HOURS\_FOR\_STIFFNESS](#HOURS_FOR_STIFFNESS)
   13. [BASE\_STIFFNESS\_INC](#BASE_STIFFNESS_INC)
   14. [BASE\_ENDURANCE\_RED](#BASE_ENDURANCE_RED)
   15. [BASE\_REGULARITY\_INC](#BASE_REGULARITY_INC)
   16. [BASE\_REGULARITY\_DEC](#BASE_REGULARITY_DEC)
   17. [BASE\_PAIN\_INC](#BASE_PAIN_INC)
7. [Constructor Details](#constructor-detail)
   1. [Fitness(IsoGameCharacter)](#%3Cinit%3E(zombie.characters.IsoGameCharacter))
8. [Method Details](#method-detail)
   1. [update()](#update())
   2. [decreaseRegularity()](#decreaseRegularity())
   3. [increasePain(String)](#increasePain(java.lang.String))
   4. [setCurrentExercise(String)](#setCurrentExercise(java.lang.String))
   5. [exerciseRepeat()](#exerciseRepeat())
   6. [updateExeTimer()](#updateExeTimer())
   7. [incRegularity()](#incRegularity())
   8. [reduceEndurance()](#reduceEndurance())
   9. [incFutureStiffness()](#incFutureStiffness())
   10. [incStats()](#incStats())
   11. [resetValues()](#resetValues())
   12. [removeStiffnessValue(String)](#removeStiffnessValue(java.lang.String))
   13. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   14. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   15. [onGoingStiffness()](#onGoingStiffness())
   16. [getCurrentExeStiffnessTimer(String)](#getCurrentExeStiffnessTimer(java.lang.String))
   17. [getCurrentExe()](#getCurrentExe())
   18. [getCurrentExeStiffnessInc(String)](#getCurrentExeStiffnessInc(java.lang.String))
   19. [getParent()](#getParent())
   20. [setParent(IsoGameCharacter)](#setParent(zombie.characters.IsoGameCharacter))
   21. [getRegularity(String)](#getRegularity(java.lang.String))
   22. [getRegularityMap()](#getRegularityMap())
   23. [setRegularityMap(HashMap)](#setRegularityMap(java.util.HashMap))
   24. [init()](#init())
   25. [initRegularityMapProfession()](#initRegularityMapProfession())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Fitness
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.BodyDamage.Fitness

---

public final class Fitness
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `Fitness.FitnessExercise`

  Contains information on exercises, including metabolics, xp modifiers and bodyparts effected.
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final float`

  `BASE_ENDURANCE_RED`

  `private static final float`

  `BASE_PAIN_INC`

  `private static final float`

  `BASE_REGULARITY_DEC`

  `private static final float`

  `BASE_REGULARITY_INC`

  `private static final float`

  `BASE_STIFFNESS_INC`

  `private final ArrayList<String>`

  `bodypartToIncStiffness`

  `private Fitness.FitnessExercise`

  `currentExe`

  `private final HashMap<String, Fitness.FitnessExercise>`

  `exercises`

  `private final HashMap<String,Long>`

  `exeTimer`

  `private int`

  `fitnessLvl`

  `private static final int`

  `HOURS_FOR_STIFFNESS`

  `private int`

  `lastUpdate`

  `private IsoGameCharacter`

  `parent`

  `private HashMap<String,Float>`

  `regularityMap`

  `private final HashMap<String,Float>`

  `stiffnessIncMap`

  `private final HashMap<String,Integer>`

  `stiffnessTimerMap`

  `private int`

  `strLvl`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Fitness(IsoGameCharacter parent)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `decreaseRegularity()`

  `void`

  `exerciseRepeat()`

  Performs updates to the fitness data while the player is exercising.

  `Fitness.FitnessExercise`

  `getCurrentExe()`

  `float`

  `getCurrentExeStiffnessInc(String type)`

  Gets the stiffness increase for the specified BodyPartType name.

  `int`

  `getCurrentExeStiffnessTimer(String type)`

  Gets the current time remaining til stiffness for the specified BodyPartType name.

  `IsoGameCharacter`

  `getParent()`

  Gets the IsoGameCharacter instance the fitness data is attached to.

  `float`

  `getRegularity(String type)`

  Gets the regularity of the given exercise type.

  `HashMap<String,Float>`

  `getRegularityMap()`

  Gets the regularity HashMap of exercise types.

  `void`

  `incFutureStiffness()`

  Set the player to increase muscle stiffness after some time.

  `private void`

  `increasePain(String bodypartType)`

  `void`

  `incRegularity()`

  Increases the regularity when the player has done a repeat of an exercise.

  `void`

  `incStats()`

  Grants XP bonuses to the exercising player.

  `void`

  `init()`

  Intializes the player's Fitness data.

  `void`

  `initRegularityMapProfession()`

  Initializes the Regularity Map for specific professions.

  `void`

  `load(ByteBuffer input,
  int worldVersion)`

  Reads the Fitness data from the specified bytebuffer.

  `boolean`

  `onGoingStiffness()`

  Checks if the player has any bodyparts currently increasing stiffness (timer expired).

  `void`

  `reduceEndurance()`

  Reduces endurance, using regularity, current carrying weight, and metabolics.

  `void`

  `removeStiffnessValue(String type)`

  Removes stiffness data for the specified BodyPartType name.

  `void`

  `resetValues()`

  Resets exercise data for a player (stiffness and regularity).

  `void`

  `save(ByteBuffer output)`

  Writes the Fitness data to the specified ByteBuffer.

  `void`

  `setCurrentExercise(String type)`

  Sets the current exercise being performed.

  `void`

  `setParent(IsoGameCharacter parent)`

  Sets the IsoGameCharacter instance the fitness data is attached to.

  `void`

  `setRegularityMap(HashMap<String,Float> regularityMap)`

  Sets the regularity HashMap of exercise types.

  `void`

  `update()`

  Updates the fitness data, triggered every 10 minutes.

  `private void`

  `updateExeTimer()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### parent

    private [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") parent
  + ### regularityMap

    private [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> regularityMap
  + ### fitnessLvl

    private int fitnessLvl
  + ### strLvl

    private int strLvl
  + ### stiffnessTimerMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> stiffnessTimerMap
  + ### stiffnessIncMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> stiffnessIncMap
  + ### bodypartToIncStiffness

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> bodypartToIncStiffness
  + ### exercises

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [Fitness.FitnessExercise](Fitness.FitnessExercise.html "class in zombie.characters.BodyDamage")> exercises
  + ### exeTimer

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang")> exeTimer
  + ### lastUpdate

    private int lastUpdate
  + ### currentExe

    private [Fitness.FitnessExercise](Fitness.FitnessExercise.html "class in zombie.characters.BodyDamage") currentExe
  + ### HOURS\_FOR\_STIFFNESS

    private static final int HOURS\_FOR\_STIFFNESS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Fitness.HOURS_FOR_STIFFNESS)
  + ### BASE\_STIFFNESS\_INC

    private static final float BASE\_STIFFNESS\_INC

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Fitness.BASE_STIFFNESS_INC)
  + ### BASE\_ENDURANCE\_RED

    private static final float BASE\_ENDURANCE\_RED

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Fitness.BASE_ENDURANCE_RED)
  + ### BASE\_REGULARITY\_INC

    private static final float BASE\_REGULARITY\_INC

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Fitness.BASE_REGULARITY_INC)
  + ### BASE\_REGULARITY\_DEC

    private static final float BASE\_REGULARITY\_DEC

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Fitness.BASE_REGULARITY_DEC)
  + ### BASE\_PAIN\_INC

    private static final float BASE\_PAIN\_INC

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.BodyDamage.Fitness.BASE_PAIN_INC)
* Constructor Details
  -------------------

  + ### Fitness

    public Fitness([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") parent)
* Method Details
  --------------

  + ### update

    public void update()

    Updates the fitness data, triggered every 10 minutes.

    called from IsoPlayer.updateInternal2()

    See Also:
    :   - [`IsoPlayer.update()`](../IsoPlayer.html#update())
  + ### decreaseRegularity

    private void decreaseRegularity()
  + ### increasePain

    private void increasePain([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bodypartType)
  + ### setCurrentExercise

    public void setCurrentExercise([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)

    Sets the current exercise being performed.

    Called from `lua/client/timedactions/ISFitnessAction.lua`

    Parameters:
    :   `type` - the string name of the exercise type as defined in `media/lua/shared/Definitions/FitnessExercises.lua`
  + ### exerciseRepeat

    public void exerciseRepeat()

    Performs updates to the fitness data while the player is exercising.

    Called from `lua/client/timedactions/ISFitnessAction.lua`
  + ### updateExeTimer

    private void updateExeTimer()
  + ### incRegularity

    public void incRegularity()

    Increases the regularity when the player has done a repeat of an exercise.

    Depends on fitness (using logarithm), the more fitness, the LESS regularity you get.
    Regularity will influence on the stiffness you get once you've finished an exercise.

    See Also:
    :   - [`exerciseRepeat()`](#exerciseRepeat())
  + ### reduceEndurance

    public void reduceEndurance()

    Reduces endurance, using regularity, current carrying weight, and metabolics.
    (some exercises are more exhausting than others).

    See Also:
    :   - [`exerciseRepeat()`](#exerciseRepeat())
  + ### incFutureStiffness

    public void incFutureStiffness()

    Set the player to increase muscle stiffness after some time.

    12h after finishing an exercise, start to increase stiffness (add pains in muscles).
    Stiffness induced will depend on regularity, fatigue.
    Numbers approx: At 0 regularity, 60min exercises should gives almost 4h of stiffness (gets additional pain).

    See Also:
    :   - [`exerciseRepeat()`](#exerciseRepeat())
  + ### incStats

    public void incStats()

    Grants XP bonuses to the exercising player.

    See Also:
    :   - [`exerciseRepeat()`](#exerciseRepeat())
  + ### resetValues

    public void resetValues()

    Resets exercise data for a player (stiffness and regularity).
  + ### removeStiffnessValue

    public void removeStiffnessValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)

    Removes stiffness data for the specified BodyPartType name.

    Called from `lua/client/XpSystem/ISUI/ISHealthPanel.lua`

    Parameters:
    :   `type` - a string name of a BodyPartType enum

    See Also:
    :   - [`BodyPartType`](BodyPartType.html "enum class in zombie.characters.BodyDamage")
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)

    Writes the Fitness data to the specified ByteBuffer.

    Parameters:
    :   `output` - the bytebuffer to write to

    See Also:
    :   - [`IsoPlayer.save()`](../IsoPlayer.html#save())
  + ### load

    public void load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)

    Reads the Fitness data from the specified bytebuffer.

    Parameters:
    :   `input` - the bytebuffer to read from
    :   `worldVersion` - the worldversion this data was written from

    See Also:
    :   - [`IsoPlayer.load(ByteBuffer, int, boolean)`](../IsoPlayer.html#load(java.nio.ByteBuffer,int,boolean))
  + ### onGoingStiffness

    public boolean onGoingStiffness()

    Checks if the player has any bodyparts currently increasing stiffness (timer expired).

    Returns:
    :   true if bodyparts are getting stiff from exercise
  + ### getCurrentExeStiffnessTimer

    public int getCurrentExeStiffnessTimer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)

    Gets the current time remaining til stiffness for the specified BodyPartType name.

    Parameters:
    :   `type` - a string name of a BodyPartType enum

    See Also:
    :   - [`BodyPartType`](BodyPartType.html "enum class in zombie.characters.BodyDamage")
  + ### getCurrentExe

    public [Fitness.FitnessExercise](Fitness.FitnessExercise.html "class in zombie.characters.BodyDamage") getCurrentExe()
  + ### getCurrentExeStiffnessInc

    public float getCurrentExeStiffnessInc([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)

    Gets the stiffness increase for the specified BodyPartType name.

    Parameters:
    :   `type` - a string name of a BodyPartType enum

    Returns:
    :   the current stiffness left to increase.

    See Also:
    :   - [`BodyPartType`](BodyPartType.html "enum class in zombie.characters.BodyDamage")
  + ### getParent

    public [IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") getParent()

    Gets the IsoGameCharacter instance the fitness data is attached to.
  + ### setParent

    public void setParent([IsoGameCharacter](../IsoGameCharacter.html "class in zombie.characters") parent)

    Sets the IsoGameCharacter instance the fitness data is attached to.
  + ### getRegularity

    public float getRegularity([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)

    Gets the regularity of the given exercise type.

    The higher the returned value, the more often the player exercises.

    Parameters:
    :   `type` - the string name of the exercise type as defined in `media/lua/shared/Definitions/FitnessExercises.lua`

    Returns:
    :   the regularity
  + ### getRegularityMap

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> getRegularityMap()

    Gets the regularity HashMap of exercise types.

    Returns:
    :   the regularityMap
  + ### setRegularityMap

    public void setRegularityMap([HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")> regularityMap)

    Sets the regularity HashMap of exercise types.
  + ### init

    public void init()

    Intializes the player's Fitness data.

    Triggered by the `OnNewGame` event in `media/lua/server/XpSystem/XpUpdate.lua`
  + ### initRegularityMapProfession

    public void initRegularityMapProfession()

    Initializes the Regularity Map for specific professions.

    Some professions have exercise as part of their training / daily routine.
    So assume they were performing the exercises before initial spawn.

    See Also:
    :   - [`init()`](#init())