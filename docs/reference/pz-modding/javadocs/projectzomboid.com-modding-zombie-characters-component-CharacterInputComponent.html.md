[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.component](package-summary.html)
2. [CharacterInputComponent](CharacterInputComponent.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [GAMEPAD\_MIN\_VALUE\_TRIGGER\_AIMING](#GAMEPAD_MIN_VALUE_TRIGGER_AIMING)
   2. [GAMEPAD\_MIN\_VALUE\_TRIGGER\_SHOOT](#GAMEPAD_MIN_VALUE_TRIGGER_SHOOT)
   3. [GAMEPAD\_MIN\_VALUE\_TRIGGER\_MELEE](#GAMEPAD_MIN_VALUE_TRIGGER_MELEE)
   4. [GAMEPAD\_AIM\_VALUE\_MIN](#GAMEPAD_AIM_VALUE_MIN)
   5. [MOVEMENT\_RATE\_STOPPED](#MOVEMENT_RATE_STOPPED)
   6. [MOVEMENT\_RATE\_MAX\_WALKING](#MOVEMENT_RATE_MAX_WALKING)
   7. [MOVEMENT\_RATE\_MAX](#MOVEMENT_RATE_MAX)
   8. [GAMEPAD\_MIN\_VALUE\_RUN](#GAMEPAD_MIN_VALUE_RUN)
   9. [joypadMoveVector](#joypadMoveVector)
   10. [joypadAimVector](#joypadAimVector)
   11. [joypadBind](#joypadBind)
   12. [joypadButtonsActive](#joypadButtonsActive)
   13. [ignoreInputsForDirection](#ignoreInputsForDirection)
   14. [joypadIgnoreAim](#joypadIgnoreAim)
   15. [joypadIgnoreAimUntilCentered](#joypadIgnoreAimUntilCentered)
   16. [ignoreAimingInput](#ignoreAimingInput)
   17. [allowSprint](#allowSprint)
   18. [allowRun](#allowRun)
   19. [forceAim](#forceAim)
   20. [forceRun](#forceRun)
   21. [forceSprint](#forceSprint)
   22. [melee](#melee)
   23. [toggleAim](#toggleAim)
   24. [toggleSprint](#toggleSprint)
   25. [toggleRun](#toggleRun)
   26. [toggleCrouch](#toggleCrouch)
   27. [interact](#interact)
   28. [reloadWeapon](#reloadWeapon)
   29. [rackFirearm](#rackFirearm)
   30. [zoomIn](#zoomIn)
   31. [zoomOut](#zoomOut)
   32. [build](#build)
7. [Constructor Details](#constructor-detail)
   1. [CharacterInputComponent()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [frameStep()](#frameStep())
   2. [getJoypadBind()](#getJoypadBind())
   3. [setJoypadBind(int)](#setJoypadBind(int))
   4. [getInputMode()](#getInputMode())
   5. [isForceAim()](#isForceAim())
   6. [setForceAim(boolean)](#setForceAim(boolean))
   7. [toggleForceAim()](#toggleForceAim())
   8. [isForceSprint()](#isForceSprint())
   9. [setForceSprint(boolean)](#setForceSprint(boolean))
   10. [toggleForceSprint()](#toggleForceSprint())
   11. [isForceRun()](#isForceRun())
   12. [setForceRun(boolean)](#setForceRun(boolean))
   13. [toggleForceRun()](#toggleForceRun())
   14. [updateToggleButtons()](#updateToggleButtons())
   15. [updateToggleToAim()](#updateToggleToAim())
   16. [updateToggleToSprint()](#updateToggleToSprint())
   17. [updateToggleToRun()](#updateToggleToRun())
   18. [shouldAllowForceRunOrSprint()](#shouldAllowForceRunOrSprint())
   19. [isJoypadControllerActive()](#isJoypadControllerActive())
   20. [getInputMoveVector(Vector2)](#getInputMoveVector(zombie.iso.Vector2))
   21. [getInputMovementRate()](#getInputMovementRate())
   22. [isInputMoveAxisApplied()](#isInputMoveAxisApplied())
   23. [getJoypadAimVector(Vector2)](#getJoypadAimVector(zombie.iso.Vector2))
   24. [isForwardKeyDown()](#isForwardKeyDown())
   25. [isBackwardKeyDown()](#isBackwardKeyDown())
   26. [isLeftKeyDown()](#isLeftKeyDown())
   27. [isRightKeyDown()](#isRightKeyDown())
   28. [isKeyboardSelectingAll()](#isKeyboardSelectingAll())
   29. [isAimKeyDown()](#isAimKeyDown())
   30. [isPrecisionAimKeyDown()](#isPrecisionAimKeyDown())
   31. [isToggleAimKeyDown()](#isToggleAimKeyDown())
   32. [isToggleAimKeyMouse()](#isToggleAimKeyMouse())
   33. [isToggleSprintButtonDown()](#isToggleSprintButtonDown())
   34. [isToggleRunButtonDown()](#isToggleRunButtonDown())
   35. [isToggleCrouchButtonDown()](#isToggleCrouchButtonDown())
   36. [isAimKeyDownInternal()](#isAimKeyDownInternal())
   37. [isPrecisionAimKeyDownInternal()](#isPrecisionAimKeyDownInternal())
   38. [isAnyAimKeyDown()](#isAnyAimKeyDown())
   39. [isMeleeButtonDown()](#isMeleeButtonDown())
   40. [isMeleeButtonDownInternal()](#isMeleeButtonDownInternal())
   41. [isAttackButtonDown()](#isAttackButtonDown())
   42. [isBuildButtonDown()](#isBuildButtonDown())
   43. [isBuildButtonReleased()](#isBuildButtonReleased())
   44. [isRunButtonDown()](#isRunButtonDown())
   45. [wasRunButtonDown()](#wasRunButtonDown())
   46. [isInteractButtonPressed()](#isInteractButtonPressed())
   47. [isInteractButtonDown()](#isInteractButtonDown())
   48. [isInteractButtonDownInternal()](#isInteractButtonDownInternal())
   49. [isInteractButtonClicked()](#isInteractButtonClicked())
   50. [isWalkToButtonDown()](#isWalkToButtonDown())
   51. [isCrouchButtonDown()](#isCrouchButtonDown())
   52. [isCrouchButtonPressed()](#isCrouchButtonPressed())
   53. [isReloadWeaponButtonPressed()](#isReloadWeaponButtonPressed())
   54. [isRackFirearmButtonPressed()](#isRackFirearmButtonPressed())
   55. [isReloadWeaponButtonDownInternal()](#isReloadWeaponButtonDownInternal())
   56. [isRackFirearmButtonDownInternal()](#isRackFirearmButtonDownInternal())
   57. [isSprintButtonDown()](#isSprintButtonDown())
   58. [wasSprintButtonDown()](#wasSprintButtonDown())
   59. [isCancelActionButtonDown()](#isCancelActionButtonDown())
   60. [isManualFloorAtkButtonDown()](#isManualFloorAtkButtonDown())
   61. [isZoomInButtonDownInternal()](#isZoomInButtonDownInternal())
   62. [isZoomOutButtonDownInternal()](#isZoomOutButtonDownInternal())
   63. [isZoomInButtonPressed()](#isZoomInButtonPressed())
   64. [isZoomOutButtonPressed()](#isZoomOutButtonPressed())
   65. [isLShiftKeyDown()](#isLShiftKeyDown())
   66. [isRShiftKeyDown()](#isRShiftKeyDown())
   67. [isShiftKeyDown()](#isShiftKeyDown())
   68. [isLCtrlKeyDown()](#isLCtrlKeyDown())
   69. [isRCtrlKeyDown()](#isRCtrlKeyDown())
   70. [isCtrlKeyDown()](#isCtrlKeyDown())
   71. [isF12KeyDown()](#isF12KeyDown())
   72. [isChangeCharacterKeyDown()](#isChangeCharacterKeyDown())
   73. [checkJoypadIgnoreAimUntilCentered()](#checkJoypadIgnoreAimUntilCentered())
   74. [isJoypadMovementAxisApplied()](#isJoypadMovementAxisApplied())
   75. [isJoypadAimingAxisApplied()](#isJoypadAimingAxisApplied())
   76. [isJoypadAimingAxisAppliedInternal()](#isJoypadAimingAxisAppliedInternal())
   77. [isJoypadMovementAxisAppliedInternal()](#isJoypadMovementAxisAppliedInternal())
   78. [isJoypadButtonsActive()](#isJoypadButtonsActive())
   79. [setJoypadButtonsActive(boolean)](#setJoypadButtonsActive(boolean))
   80. [isIgnoreInputsForDirection()](#isIgnoreInputsForDirection())
   81. [setIgnoreInputsForDirection(boolean)](#setIgnoreInputsForDirection(boolean))
   82. [setJoypadIgnoreAim(boolean)](#setJoypadIgnoreAim(boolean))
   83. [isJoypadIgnoreAim()](#isJoypadIgnoreAim())
   84. [setJoypadIgnoreAimUntilCentered(boolean)](#setJoypadIgnoreAimUntilCentered(boolean))
   85. [isJoypadIgnoreAimUntilCentered()](#isJoypadIgnoreAimUntilCentered())
   86. [setIgnoreAimingInput(boolean)](#setIgnoreAimingInput(boolean))
   87. [isIgnoringAimingInput()](#isIgnoringAimingInput())
   88. [isAllowSprint()](#isAllowSprint())
   89. [setAllowSprint(boolean)](#setAllowSprint(boolean))
   90. [isAllowRun()](#isAllowRun())
   91. [setAllowRun(boolean)](#setAllowRun(boolean))
   92. [onGameLoadingStateEnter()](#onGameLoadingStateEnter())
   93. [onInGameStateEnter()](#onInGameStateEnter())
   94. [logVariablesToRecording(AnimationPlayerRecorder)](#logVariablesToRecording(zombie.core.skinnedmodel.animation.debug.AnimationPlayerRecorder))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class CharacterInputComponent
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.characters.ecs.ECSComponent](../ecs/ECSComponent.html "class in zombie.characters.ecs")

zombie.characters.component.CharacterInputComponent

All Implemented Interfaces:
:   `zombie.characters.ecs.componentmods.ECSFrameStep, zombie.characters.ecs.componentmods.ECSGameLoadingStateEnter, zombie.characters.ecs.componentmods.ECSInGameStateEnter, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableLogger`

---

public class CharacterInputComponent
extends [ECSComponent](../ecs/ECSComponent.html "class in zombie.characters.ecs")
implements zombie.characters.ecs.componentmods.ECSFrameStep, zombie.characters.ecs.componentmods.ECSInGameStateEnter, zombie.characters.ecs.componentmods.ECSGameLoadingStateEnter, zombie.core.skinnedmodel.advancedanimation.IAnimationVariableLogger

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `CharacterInputComponent.Options`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `allowRun`

  `private boolean`

  `allowSprint`

  `private final zombie.characters.TimedInputHandler`

  `build`

  `private boolean`

  `forceAim`

  `private boolean`

  `forceRun`

  `private boolean`

  `forceSprint`

  `static final float`

  `GAMEPAD_AIM_VALUE_MIN`

  `static final float`

  `GAMEPAD_MIN_VALUE_RUN`

  `static final float`

  `GAMEPAD_MIN_VALUE_TRIGGER_AIMING`

  `static final float`

  `GAMEPAD_MIN_VALUE_TRIGGER_MELEE`

  `static final float`

  `GAMEPAD_MIN_VALUE_TRIGGER_SHOOT`

  `private boolean`

  `ignoreAimingInput`

  `private boolean`

  `ignoreInputsForDirection`

  `private final zombie.characters.TimedInputHandler`

  `interact`

  `private static final Vector2`

  `joypadAimVector`

  `private int`

  `joypadBind`

  `private boolean`

  `joypadButtonsActive`

  `private boolean`

  `joypadIgnoreAim`

  `private boolean`

  `joypadIgnoreAimUntilCentered`

  `private static final Vector2`

  `joypadMoveVector`

  `private final zombie.characters.TimedInputHandler`

  `melee`

  `static final float`

  `MOVEMENT_RATE_MAX`

  `static final float`

  `MOVEMENT_RATE_MAX_WALKING`

  `static final float`

  `MOVEMENT_RATE_STOPPED`

  `private final zombie.characters.TimedInputHandler`

  `rackFirearm`

  `private final zombie.characters.TimedInputHandler`

  `reloadWeapon`

  `private final zombie.characters.TimedInputHandler`

  `toggleAim`

  `private final zombie.characters.TimedInputHandler`

  `toggleCrouch`

  `private final zombie.characters.TimedInputHandler`

  `toggleRun`

  `private final zombie.characters.TimedInputHandler`

  `toggleSprint`

  `private final zombie.characters.TimedInputHandler`

  `zoomIn`

  `private final zombie.characters.TimedInputHandler`

  `zoomOut`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `CharacterInputComponent()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `checkJoypadIgnoreAimUntilCentered()`

  `void`

  `frameStep()`

  `zombie.characters.CharacterInputMode`

  `getInputMode()`

  `float`

  `getInputMovementRate()`

  `Vector2`

  `getInputMoveVector(Vector2 out)`

  `Vector2`

  `getJoypadAimVector(Vector2 out)`

  `int`

  `getJoypadBind()`

  `boolean`

  `isAimKeyDown()`

  `boolean`

  `isAimKeyDownInternal()`

  `boolean`

  `isAllowRun()`

  `boolean`

  `isAllowSprint()`

  `boolean`

  `isAnyAimKeyDown()`

  `boolean`

  `isAttackButtonDown()`

  `boolean`

  `isBackwardKeyDown()`

  `boolean`

  `isBuildButtonDown()`

  `boolean`

  `isBuildButtonReleased()`

  `boolean`

  `isCancelActionButtonDown()`

  `boolean`

  `isChangeCharacterKeyDown()`

  `boolean`

  `isCrouchButtonDown()`

  `boolean`

  `isCrouchButtonPressed()`

  `boolean`

  `isCtrlKeyDown()`

  `boolean`

  `isF12KeyDown()`

  `boolean`

  `isForceAim()`

  `boolean`

  `isForceRun()`

  `boolean`

  `isForceSprint()`

  `boolean`

  `isForwardKeyDown()`

  `boolean`

  `isIgnoreInputsForDirection()`

  `boolean`

  `isIgnoringAimingInput()`

  `boolean`

  `isInputMoveAxisApplied()`

  `boolean`

  `isInteractButtonClicked()`

  `boolean`

  `isInteractButtonDown()`

  `boolean`

  `isInteractButtonDownInternal()`

  `boolean`

  `isInteractButtonPressed()`

  `boolean`

  `isJoypadAimingAxisApplied()`

  `private boolean`

  `isJoypadAimingAxisAppliedInternal()`

  `boolean`

  `isJoypadButtonsActive()`

  `boolean`

  `isJoypadControllerActive()`

  `boolean`

  `isJoypadIgnoreAim()`

  `boolean`

  `isJoypadIgnoreAimUntilCentered()`

  `boolean`

  `isJoypadMovementAxisApplied()`

  `private boolean`

  `isJoypadMovementAxisAppliedInternal()`

  `boolean`

  `isKeyboardSelectingAll()`

  `boolean`

  `isLCtrlKeyDown()`

  `boolean`

  `isLeftKeyDown()`

  `boolean`

  `isLShiftKeyDown()`

  `boolean`

  `isManualFloorAtkButtonDown()`

  `boolean`

  `isMeleeButtonDown()`

  `boolean`

  `isMeleeButtonDownInternal()`

  `boolean`

  `isPrecisionAimKeyDown()`

  `boolean`

  `isPrecisionAimKeyDownInternal()`

  `private boolean`

  `isRackFirearmButtonDownInternal()`

  `boolean`

  `isRackFirearmButtonPressed()`

  `boolean`

  `isRCtrlKeyDown()`

  `private boolean`

  `isReloadWeaponButtonDownInternal()`

  `boolean`

  `isReloadWeaponButtonPressed()`

  `boolean`

  `isRightKeyDown()`

  `boolean`

  `isRShiftKeyDown()`

  `boolean`

  `isRunButtonDown()`

  `boolean`

  `isShiftKeyDown()`

  `boolean`

  `isSprintButtonDown()`

  `boolean`

  `isToggleAimKeyDown()`

  `boolean`

  `isToggleAimKeyMouse()`

  `boolean`

  `isToggleCrouchButtonDown()`

  `boolean`

  `isToggleRunButtonDown()`

  `boolean`

  `isToggleSprintButtonDown()`

  `boolean`

  `isWalkToButtonDown()`

  `private boolean`

  `isZoomInButtonDownInternal()`

  `boolean`

  `isZoomInButtonPressed()`

  `private boolean`

  `isZoomOutButtonDownInternal()`

  `boolean`

  `isZoomOutButtonPressed()`

  `void`

  `logVariablesToRecording(zombie.core.skinnedmodel.animation.debug.AnimationPlayerRecorder animationRecorder)`

  `void`

  `onGameLoadingStateEnter()`

  `void`

  `onInGameStateEnter()`

  `void`

  `setAllowRun(boolean allowRun)`

  `void`

  `setAllowSprint(boolean allowSprint)`

  `void`

  `setForceAim(boolean forceAim)`

  `void`

  `setForceRun(boolean forceRun)`

  `void`

  `setForceSprint(boolean forceSprint)`

  `void`

  `setIgnoreAimingInput(boolean b)`

  `void`

  `setIgnoreInputsForDirection(boolean ignoreInputsForDirection)`

  `void`

  `setJoypadBind(int joypadBind)`

  `void`

  `setJoypadButtonsActive(boolean joypadMovementActive)`

  `void`

  `setJoypadIgnoreAim(boolean ignore)`

  `void`

  `setJoypadIgnoreAimUntilCentered(boolean ignore)`

  `private boolean`

  `shouldAllowForceRunOrSprint()`

  `final boolean`

  `toggleForceAim()`

  `final boolean`

  `toggleForceRun()`

  `final boolean`

  `toggleForceSprint()`

  `void`

  `updateToggleButtons()`

  `void`

  `updateToggleToAim()`

  `void`

  `updateToggleToRun()`

  `void`

  `updateToggleToSprint()`

  `boolean`

  `wasRunButtonDown()`

  `boolean`

  `wasSprintButtonDown()`

  ### Methods inherited from class [ECSComponent](../ecs/ECSComponent.html#method-summary "class in zombie.characters.ecs")

  `getECSClass, getECSClass, getECSOwnerEntity, getECSOwnerEntity, setECSOwnerEntity, tryGetECSOwnerEntity, tryGetECSOwnerEntityAs`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### GAMEPAD\_MIN\_VALUE\_TRIGGER\_AIMING

    public static final float GAMEPAD\_MIN\_VALUE\_TRIGGER\_AIMING

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.component.CharacterInputComponent.GAMEPAD_MIN_VALUE_TRIGGER_AIMING)
  + ### GAMEPAD\_MIN\_VALUE\_TRIGGER\_SHOOT

    public static final float GAMEPAD\_MIN\_VALUE\_TRIGGER\_SHOOT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.component.CharacterInputComponent.GAMEPAD_MIN_VALUE_TRIGGER_SHOOT)
  + ### GAMEPAD\_MIN\_VALUE\_TRIGGER\_MELEE

    public static final float GAMEPAD\_MIN\_VALUE\_TRIGGER\_MELEE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.component.CharacterInputComponent.GAMEPAD_MIN_VALUE_TRIGGER_MELEE)
  + ### GAMEPAD\_AIM\_VALUE\_MIN

    public static final float GAMEPAD\_AIM\_VALUE\_MIN

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.component.CharacterInputComponent.GAMEPAD_AIM_VALUE_MIN)
  + ### MOVEMENT\_RATE\_STOPPED

    public static final float MOVEMENT\_RATE\_STOPPED

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.component.CharacterInputComponent.MOVEMENT_RATE_STOPPED)
  + ### MOVEMENT\_RATE\_MAX\_WALKING

    public static final float MOVEMENT\_RATE\_MAX\_WALKING

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.component.CharacterInputComponent.MOVEMENT_RATE_MAX_WALKING)
  + ### MOVEMENT\_RATE\_MAX

    public static final float MOVEMENT\_RATE\_MAX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.component.CharacterInputComponent.MOVEMENT_RATE_MAX)
  + ### GAMEPAD\_MIN\_VALUE\_RUN

    public static final float GAMEPAD\_MIN\_VALUE\_RUN

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.characters.component.CharacterInputComponent.GAMEPAD_MIN_VALUE_RUN)
  + ### joypadMoveVector

    private static final [Vector2](../../iso/Vector2.html "class in zombie.iso") joypadMoveVector
  + ### joypadAimVector

    private static final [Vector2](../../iso/Vector2.html "class in zombie.iso") joypadAimVector
  + ### joypadBind

    private int joypadBind
  + ### joypadButtonsActive

    private boolean joypadButtonsActive
  + ### ignoreInputsForDirection

    private boolean ignoreInputsForDirection
  + ### joypadIgnoreAim

    private boolean joypadIgnoreAim
  + ### joypadIgnoreAimUntilCentered

    private boolean joypadIgnoreAimUntilCentered
  + ### ignoreAimingInput

    private boolean ignoreAimingInput
  + ### allowSprint

    private boolean allowSprint
  + ### allowRun

    private boolean allowRun
  + ### forceAim

    private boolean forceAim
  + ### forceRun

    private boolean forceRun
  + ### forceSprint

    private boolean forceSprint
  + ### melee

    private final zombie.characters.TimedInputHandler melee
  + ### toggleAim

    private final zombie.characters.TimedInputHandler toggleAim
  + ### toggleSprint

    private final zombie.characters.TimedInputHandler toggleSprint
  + ### toggleRun

    private final zombie.characters.TimedInputHandler toggleRun
  + ### toggleCrouch

    private final zombie.characters.TimedInputHandler toggleCrouch
  + ### interact

    private final zombie.characters.TimedInputHandler interact
  + ### reloadWeapon

    private final zombie.characters.TimedInputHandler reloadWeapon
  + ### rackFirearm

    private final zombie.characters.TimedInputHandler rackFirearm
  + ### zoomIn

    private final zombie.characters.TimedInputHandler zoomIn
  + ### zoomOut

    private final zombie.characters.TimedInputHandler zoomOut
  + ### build

    private final zombie.characters.TimedInputHandler build
* Constructor Details
  -------------------

  + ### CharacterInputComponent

    public CharacterInputComponent()
* Method Details
  --------------

  + ### frameStep

    public void frameStep()

    Specified by:
    :   `frameStep` in interface `zombie.characters.ecs.componentmods.ECSFrameStep`
  + ### getJoypadBind

    public int getJoypadBind()
  + ### setJoypadBind

    public void setJoypadBind(int joypadBind)
  + ### getInputMode

    public zombie.characters.CharacterInputMode getInputMode()
  + ### isForceAim

    public boolean isForceAim()
  + ### setForceAim

    public void setForceAim(boolean forceAim)
  + ### toggleForceAim

    public final boolean toggleForceAim()
  + ### isForceSprint

    public boolean isForceSprint()
  + ### setForceSprint

    public void setForceSprint(boolean forceSprint)
  + ### toggleForceSprint

    public final boolean toggleForceSprint()
  + ### isForceRun

    public boolean isForceRun()
  + ### setForceRun

    public void setForceRun(boolean forceRun)
  + ### toggleForceRun

    public final boolean toggleForceRun()
  + ### updateToggleButtons

    public void updateToggleButtons()
  + ### updateToggleToAim

    public void updateToggleToAim()
  + ### updateToggleToSprint

    public void updateToggleToSprint()
  + ### updateToggleToRun

    public void updateToggleToRun()
  + ### shouldAllowForceRunOrSprint

    private boolean shouldAllowForceRunOrSprint()
  + ### isJoypadControllerActive

    public boolean isJoypadControllerActive()
  + ### getInputMoveVector

    public [Vector2](../../iso/Vector2.html "class in zombie.iso") getInputMoveVector([Vector2](../../iso/Vector2.html "class in zombie.iso") out)
  + ### getInputMovementRate

    public float getInputMovementRate()
  + ### isInputMoveAxisApplied

    public boolean isInputMoveAxisApplied()
  + ### getJoypadAimVector

    public [Vector2](../../iso/Vector2.html "class in zombie.iso") getJoypadAimVector([Vector2](../../iso/Vector2.html "class in zombie.iso") out)
  + ### isForwardKeyDown

    public boolean isForwardKeyDown()
  + ### isBackwardKeyDown

    public boolean isBackwardKeyDown()
  + ### isLeftKeyDown

    public boolean isLeftKeyDown()
  + ### isRightKeyDown

    public boolean isRightKeyDown()
  + ### isKeyboardSelectingAll

    public boolean isKeyboardSelectingAll()
  + ### isAimKeyDown

    public boolean isAimKeyDown()
  + ### isPrecisionAimKeyDown

    public boolean isPrecisionAimKeyDown()
  + ### isToggleAimKeyDown

    public boolean isToggleAimKeyDown()
  + ### isToggleAimKeyMouse

    public boolean isToggleAimKeyMouse()
  + ### isToggleSprintButtonDown

    public boolean isToggleSprintButtonDown()
  + ### isToggleRunButtonDown

    public boolean isToggleRunButtonDown()
  + ### isToggleCrouchButtonDown

    public boolean isToggleCrouchButtonDown()
  + ### isAimKeyDownInternal

    public boolean isAimKeyDownInternal()
  + ### isPrecisionAimKeyDownInternal

    public boolean isPrecisionAimKeyDownInternal()
  + ### isAnyAimKeyDown

    public boolean isAnyAimKeyDown()
  + ### isMeleeButtonDown

    public boolean isMeleeButtonDown()
  + ### isMeleeButtonDownInternal

    public boolean isMeleeButtonDownInternal()
  + ### isAttackButtonDown

    public boolean isAttackButtonDown()
  + ### isBuildButtonDown

    public boolean isBuildButtonDown()
  + ### isBuildButtonReleased

    public boolean isBuildButtonReleased()
  + ### isRunButtonDown

    public boolean isRunButtonDown()
  + ### wasRunButtonDown

    public boolean wasRunButtonDown()
  + ### isInteractButtonPressed

    public boolean isInteractButtonPressed()
  + ### isInteractButtonDown

    public boolean isInteractButtonDown()
  + ### isInteractButtonDownInternal

    public boolean isInteractButtonDownInternal()
  + ### isInteractButtonClicked

    public boolean isInteractButtonClicked()
  + ### isWalkToButtonDown

    public boolean isWalkToButtonDown()
  + ### isCrouchButtonDown

    public boolean isCrouchButtonDown()
  + ### isCrouchButtonPressed

    public boolean isCrouchButtonPressed()
  + ### isReloadWeaponButtonPressed

    public boolean isReloadWeaponButtonPressed()
  + ### isRackFirearmButtonPressed

    public boolean isRackFirearmButtonPressed()
  + ### isReloadWeaponButtonDownInternal

    private boolean isReloadWeaponButtonDownInternal()
  + ### isRackFirearmButtonDownInternal

    private boolean isRackFirearmButtonDownInternal()
  + ### isSprintButtonDown

    public boolean isSprintButtonDown()
  + ### wasSprintButtonDown

    public boolean wasSprintButtonDown()
  + ### isCancelActionButtonDown

    public boolean isCancelActionButtonDown()
  + ### isManualFloorAtkButtonDown

    public boolean isManualFloorAtkButtonDown()
  + ### isZoomInButtonDownInternal

    private boolean isZoomInButtonDownInternal()
  + ### isZoomOutButtonDownInternal

    private boolean isZoomOutButtonDownInternal()
  + ### isZoomInButtonPressed

    public boolean isZoomInButtonPressed()
  + ### isZoomOutButtonPressed

    public boolean isZoomOutButtonPressed()
  + ### isLShiftKeyDown

    public boolean isLShiftKeyDown()
  + ### isRShiftKeyDown

    public boolean isRShiftKeyDown()
  + ### isShiftKeyDown

    public boolean isShiftKeyDown()
  + ### isLCtrlKeyDown

    public boolean isLCtrlKeyDown()
  + ### isRCtrlKeyDown

    public boolean isRCtrlKeyDown()
  + ### isCtrlKeyDown

    public boolean isCtrlKeyDown()
  + ### isF12KeyDown

    public boolean isF12KeyDown()
  + ### isChangeCharacterKeyDown

    public boolean isChangeCharacterKeyDown()
  + ### checkJoypadIgnoreAimUntilCentered

    public void checkJoypadIgnoreAimUntilCentered()
  + ### isJoypadMovementAxisApplied

    public boolean isJoypadMovementAxisApplied()
  + ### isJoypadAimingAxisApplied

    public boolean isJoypadAimingAxisApplied()
  + ### isJoypadAimingAxisAppliedInternal

    private boolean isJoypadAimingAxisAppliedInternal()
  + ### isJoypadMovementAxisAppliedInternal

    private boolean isJoypadMovementAxisAppliedInternal()
  + ### isJoypadButtonsActive

    public boolean isJoypadButtonsActive()
  + ### setJoypadButtonsActive

    public void setJoypadButtonsActive(boolean joypadMovementActive)
  + ### isIgnoreInputsForDirection

    public boolean isIgnoreInputsForDirection()
  + ### setIgnoreInputsForDirection

    public void setIgnoreInputsForDirection(boolean ignoreInputsForDirection)
  + ### setJoypadIgnoreAim

    public void setJoypadIgnoreAim(boolean ignore)
  + ### isJoypadIgnoreAim

    public boolean isJoypadIgnoreAim()
  + ### setJoypadIgnoreAimUntilCentered

    public void setJoypadIgnoreAimUntilCentered(boolean ignore)
  + ### isJoypadIgnoreAimUntilCentered

    public boolean isJoypadIgnoreAimUntilCentered()
  + ### setIgnoreAimingInput

    public void setIgnoreAimingInput(boolean b)
  + ### isIgnoringAimingInput

    public boolean isIgnoringAimingInput()
  + ### isAllowSprint

    public boolean isAllowSprint()
  + ### setAllowSprint

    public void setAllowSprint(boolean allowSprint)
  + ### isAllowRun

    public boolean isAllowRun()
  + ### setAllowRun

    public void setAllowRun(boolean allowRun)
  + ### onGameLoadingStateEnter

    public void onGameLoadingStateEnter()

    Specified by:
    :   `onGameLoadingStateEnter` in interface `zombie.characters.ecs.componentmods.ECSGameLoadingStateEnter`
  + ### onInGameStateEnter

    public void onInGameStateEnter()

    Specified by:
    :   `onInGameStateEnter` in interface `zombie.characters.ecs.componentmods.ECSInGameStateEnter`
  + ### logVariablesToRecording

    public void logVariablesToRecording(zombie.core.skinnedmodel.animation.debug.AnimationPlayerRecorder animationRecorder)

    Specified by:
    :   `logVariablesToRecording` in interface `zombie.core.skinnedmodel.advancedanimation.IAnimationVariableLogger`