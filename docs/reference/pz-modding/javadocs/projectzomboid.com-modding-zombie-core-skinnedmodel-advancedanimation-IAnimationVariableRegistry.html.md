[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.advancedanimation](package-summary.html)
2. [IAnimationVariableRegistry](IAnimationVariableRegistry.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [getGameVariablesInternal()](#getGameVariablesInternal())
   2. [setVariable(String, AnimationVariableSlotCallbackBool.CallbackGetStrongTyped, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackGetStrongTyped,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   3. [setVariable(String, AnimationVariableSlotCallbackBool.CallbackGetStrongTyped, AnimationVariableSlotCallbackBool.CallbackSetStrongTyped, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackGetStrongTyped,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackSetStrongTyped,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   4. [setVariable(String, AnimationVariableSlotCallbackString.CallbackGetStrongTyped, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackGetStrongTyped,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   5. [setVariable(String, AnimationVariableSlotCallbackString.CallbackGetStrongTyped, AnimationVariableSlotCallbackString.CallbackSetStrongTyped, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackGetStrongTyped,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackSetStrongTyped,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   6. [setVariable(String, AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   7. [setVariable(String, AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier, AnimationVariableSlotCallbackFloat.PrimitiveFloatConsumer, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatConsumer,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   8. [setVariable(String, AnimationVariableSlotCallbackInt.PrimitiveIntSupplier, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntSupplier,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   9. [setVariable(String, AnimationVariableSlotCallbackInt.PrimitiveIntSupplier, AnimationVariableSlotCallbackInt.PrimitiveIntConsumer, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntSupplier,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntConsumer,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   10. [setVariable(String, boolean, AnimationVariableSlotCallbackBool.CallbackGetStrongTyped, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,boolean,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackGetStrongTyped,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   11. [setVariable(String, boolean, AnimationVariableSlotCallbackBool.CallbackGetStrongTyped, AnimationVariableSlotCallbackBool.CallbackSetStrongTyped, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,boolean,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackGetStrongTyped,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackSetStrongTyped,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   12. [setVariable(String, String, AnimationVariableSlotCallbackString.CallbackGetStrongTyped, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,java.lang.String,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackGetStrongTyped,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   13. [setVariable(String, String, AnimationVariableSlotCallbackString.CallbackGetStrongTyped, AnimationVariableSlotCallbackString.CallbackSetStrongTyped, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,java.lang.String,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackGetStrongTyped,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackSetStrongTyped,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   14. [setVariable(String, float, AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,float,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   15. [setVariable(String, float, AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier, AnimationVariableSlotCallbackFloat.PrimitiveFloatConsumer, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,float,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatConsumer,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   16. [setVariable(String, int, AnimationVariableSlotCallbackInt.PrimitiveIntSupplier, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,int,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntSupplier,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   17. [setVariable(String, int, AnimationVariableSlotCallbackInt.PrimitiveIntSupplier, AnimationVariableSlotCallbackInt.PrimitiveIntConsumer, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,int,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntSupplier,zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntConsumer,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   18. [setVariable(String, Class, Supplier, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,java.lang.Class,java.util.function.Supplier,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))
   19. [setVariable(String, Class, Supplier, Consumer, IAnimationVariableSlotDescriptor)](#setVariable(java.lang.String,java.lang.Class,java.util.function.Supplier,java.util.function.Consumer,zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Interface IAnimationVariableRegistry
====================================

All Superinterfaces:
:   `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSourceContainer`

All Known Implementing Classes:
:   `IsoAnimal, IsoDummyCameraCharacter, IsoGameCharacter, zombie.characters.IsoLivingCharacter, IsoLuaMover, IsoPlayer, IsoSurvivor, IsoZombie, RandomizedBuildingBase.HumanCorpse`

---

public interface IAnimationVariableRegistry
extends zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSourceContainer

* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsDefault Methods

  Modifier and Type

  Method

  Description

  `zombie.core.skinnedmodel.advancedanimation.AnimationVariableSource`

  `getGameVariablesInternal()`

  `default void`

  `setVariable(String key,
  boolean defaultVal,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackGetStrongTyped callbackGet,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackSetStrongTyped callbackSet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default void`

  `setVariable(String key,
  boolean defaultVal,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackGetStrongTyped callbackGet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default void`

  `setVariable(String key,
  float defaultVal,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier callbackGet,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatConsumer callbackSet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default void`

  `setVariable(String key,
  float defaultVal,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier callbackGet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default void`

  `setVariable(String key,
  int defaultVal,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntSupplier callbackGet,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntConsumer callbackSet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default void`

  `setVariable(String key,
  int defaultVal,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntSupplier callbackGet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default <EnumType extends Enum<EnumType>>  
  void`

  `setVariable(String key,
  Class<EnumType> enumTypeClass,
  Supplier<EnumType> callbackGet,
  Consumer<EnumType> callbackSet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default <EnumType extends Enum<EnumType>>  
  void`

  `setVariable(String key,
  Class<EnumType> enumTypeClass,
  Supplier<EnumType> callbackGet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default void`

  `setVariable(String key,
  String defaultVal,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackGetStrongTyped callbackGet,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackSetStrongTyped callbackSet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default void`

  `setVariable(String key,
  String defaultVal,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackGetStrongTyped callbackGet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default void`

  `setVariable(String key,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackGetStrongTyped callbackGet,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackSetStrongTyped callbackSet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default void`

  `setVariable(String key,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackGetStrongTyped callbackGet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default void`

  `setVariable(String key,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier callbackGet,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatConsumer callbackSet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  Strong-typed utility function.

  `default void`

  `setVariable(String key,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier callbackGet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default void`

  `setVariable(String key,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntSupplier callbackGet,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntConsumer callbackSet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default void`

  `setVariable(String key,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntSupplier callbackGet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default void`

  `setVariable(String key,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackGetStrongTyped callbackGet,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackSetStrongTyped callbackSet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  `default void`

  `setVariable(String key,
  zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackGetStrongTyped callbackGet,
  zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSource

  `getSubVariableSource, getVariableBoolean, getVariableEnum`

  ### Methods inherited from interface zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSourceContainer

  `containsVariable, getGameVariables, getVariable, getVariable, getVariableBoolean, getVariableBoolean, getVariableFloat, getVariableString, isVariable`

* Method Details
  --------------

  + ### getGameVariablesInternal

    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSource getGameVariablesInternal()

    Specified by:
    :   `getGameVariablesInternal` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSourceContainer`
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackGetStrongTyped callbackGet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackGetStrongTyped callbackGet,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackSetStrongTyped callbackSet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackGetStrongTyped callbackGet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackGetStrongTyped callbackGet,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackSetStrongTyped callbackSet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier callbackGet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier callbackGet,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatConsumer callbackSet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)

    Strong-typed utility function.
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntSupplier callbackGet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntSupplier callbackGet,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntConsumer callbackSet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    boolean defaultVal,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackGetStrongTyped callbackGet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    boolean defaultVal,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackGetStrongTyped callbackGet,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackBool.CallbackSetStrongTyped callbackSet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultVal,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackGetStrongTyped callbackGet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultVal,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackGetStrongTyped callbackGet,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackString.CallbackSetStrongTyped callbackSet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    float defaultVal,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier callbackGet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    float defaultVal,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatSupplier callbackGet,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackFloat.PrimitiveFloatConsumer callbackSet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    int defaultVal,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntSupplier callbackGet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    int defaultVal,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntSupplier callbackGet,
    zombie.core.skinnedmodel.advancedanimation.AnimationVariableSlotCallbackInt.PrimitiveIntConsumer callbackSet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default <EnumType extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<EnumType>> void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<EnumType> enumTypeClass,
    [Supplier](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Supplier.html "class or interface in java.util.function")<EnumType> callbackGet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)
  + ### setVariable

    default <EnumType extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<EnumType>> void setVariable([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<EnumType> enumTypeClass,
    [Supplier](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Supplier.html "class or interface in java.util.function")<EnumType> callbackGet,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<EnumType> callbackSet,
    zombie.core.skinnedmodel.advancedanimation.IAnimationVariableSlotDescriptor descriptor)