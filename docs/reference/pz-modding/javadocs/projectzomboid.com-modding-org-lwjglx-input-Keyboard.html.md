[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [org.lwjglx.input](package-summary.html)
2. [Keyboard](Keyboard.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [CHAR\_NONE](#CHAR_NONE)
   2. [KEY\_NONE](#KEY_NONE)
   3. [KEY\_ESCAPE](#KEY_ESCAPE)
   4. [KEY\_1](#KEY_1)
   5. [KEY\_2](#KEY_2)
   6. [KEY\_3](#KEY_3)
   7. [KEY\_4](#KEY_4)
   8. [KEY\_5](#KEY_5)
   9. [KEY\_6](#KEY_6)
   10. [KEY\_7](#KEY_7)
   11. [KEY\_8](#KEY_8)
   12. [KEY\_9](#KEY_9)
   13. [KEY\_0](#KEY_0)
   14. [KEY\_MINUS](#KEY_MINUS)
   15. [KEY\_EQUALS](#KEY_EQUALS)
   16. [KEY\_BACK](#KEY_BACK)
   17. [KEY\_TAB](#KEY_TAB)
   18. [KEY\_Q](#KEY_Q)
   19. [KEY\_W](#KEY_W)
   20. [KEY\_E](#KEY_E)
   21. [KEY\_R](#KEY_R)
   22. [KEY\_T](#KEY_T)
   23. [KEY\_Y](#KEY_Y)
   24. [KEY\_U](#KEY_U)
   25. [KEY\_I](#KEY_I)
   26. [KEY\_O](#KEY_O)
   27. [KEY\_P](#KEY_P)
   28. [KEY\_LBRACKET](#KEY_LBRACKET)
   29. [KEY\_RBRACKET](#KEY_RBRACKET)
   30. [KEY\_RETURN](#KEY_RETURN)
   31. [KEY\_LCONTROL](#KEY_LCONTROL)
   32. [KEY\_A](#KEY_A)
   33. [KEY\_S](#KEY_S)
   34. [KEY\_D](#KEY_D)
   35. [KEY\_F](#KEY_F)
   36. [KEY\_G](#KEY_G)
   37. [KEY\_H](#KEY_H)
   38. [KEY\_J](#KEY_J)
   39. [KEY\_K](#KEY_K)
   40. [KEY\_L](#KEY_L)
   41. [KEY\_SEMICOLON](#KEY_SEMICOLON)
   42. [KEY\_APOSTROPHE](#KEY_APOSTROPHE)
   43. [KEY\_GRAVE](#KEY_GRAVE)
   44. [KEY\_LSHIFT](#KEY_LSHIFT)
   45. [KEY\_BACKSLASH](#KEY_BACKSLASH)
   46. [KEY\_Z](#KEY_Z)
   47. [KEY\_X](#KEY_X)
   48. [KEY\_C](#KEY_C)
   49. [KEY\_V](#KEY_V)
   50. [KEY\_B](#KEY_B)
   51. [KEY\_N](#KEY_N)
   52. [KEY\_M](#KEY_M)
   53. [KEY\_COMMA](#KEY_COMMA)
   54. [KEY\_PERIOD](#KEY_PERIOD)
   55. [KEY\_SLASH](#KEY_SLASH)
   56. [KEY\_RSHIFT](#KEY_RSHIFT)
   57. [KEY\_MULTIPLY](#KEY_MULTIPLY)
   58. [KEY\_LMENU](#KEY_LMENU)
   59. [KEY\_SPACE](#KEY_SPACE)
   60. [KEY\_CAPITAL](#KEY_CAPITAL)
   61. [KEY\_F1](#KEY_F1)
   62. [KEY\_F2](#KEY_F2)
   63. [KEY\_F3](#KEY_F3)
   64. [KEY\_F4](#KEY_F4)
   65. [KEY\_F5](#KEY_F5)
   66. [KEY\_F6](#KEY_F6)
   67. [KEY\_F7](#KEY_F7)
   68. [KEY\_F8](#KEY_F8)
   69. [KEY\_F9](#KEY_F9)
   70. [KEY\_F10](#KEY_F10)
   71. [KEY\_NUMLOCK](#KEY_NUMLOCK)
   72. [KEY\_SCROLL](#KEY_SCROLL)
   73. [KEY\_NUMPAD7](#KEY_NUMPAD7)
   74. [KEY\_NUMPAD8](#KEY_NUMPAD8)
   75. [KEY\_NUMPAD9](#KEY_NUMPAD9)
   76. [KEY\_SUBTRACT](#KEY_SUBTRACT)
   77. [KEY\_NUMPAD4](#KEY_NUMPAD4)
   78. [KEY\_NUMPAD5](#KEY_NUMPAD5)
   79. [KEY\_NUMPAD6](#KEY_NUMPAD6)
   80. [KEY\_ADD](#KEY_ADD)
   81. [KEY\_NUMPAD1](#KEY_NUMPAD1)
   82. [KEY\_NUMPAD2](#KEY_NUMPAD2)
   83. [KEY\_NUMPAD3](#KEY_NUMPAD3)
   84. [KEY\_NUMPAD0](#KEY_NUMPAD0)
   85. [KEY\_DECIMAL](#KEY_DECIMAL)
   86. [KEY\_F11](#KEY_F11)
   87. [KEY\_F12](#KEY_F12)
   88. [KEY\_F13](#KEY_F13)
   89. [KEY\_F14](#KEY_F14)
   90. [KEY\_F15](#KEY_F15)
   91. [KEY\_F16](#KEY_F16)
   92. [KEY\_F17](#KEY_F17)
   93. [KEY\_F18](#KEY_F18)
   94. [KEY\_KANA](#KEY_KANA)
   95. [KEY\_F19](#KEY_F19)
   96. [KEY\_CONVERT](#KEY_CONVERT)
   97. [KEY\_NOCONVERT](#KEY_NOCONVERT)
   98. [KEY\_YEN](#KEY_YEN)
   99. [KEY\_NUMPADEQUALS](#KEY_NUMPADEQUALS)
   100. [KEY\_CIRCUMFLEX](#KEY_CIRCUMFLEX)
   101. [KEY\_AT](#KEY_AT)
   102. [KEY\_COLON](#KEY_COLON)
   103. [KEY\_UNDERLINE](#KEY_UNDERLINE)
   104. [KEY\_KANJI](#KEY_KANJI)
   105. [KEY\_STOP](#KEY_STOP)
   106. [KEY\_AX](#KEY_AX)
   107. [KEY\_UNLABELED](#KEY_UNLABELED)
   108. [KEY\_NUMPADENTER](#KEY_NUMPADENTER)
   109. [KEY\_RCONTROL](#KEY_RCONTROL)
   110. [KEY\_SECTION](#KEY_SECTION)
   111. [KEY\_NUMPADCOMMA](#KEY_NUMPADCOMMA)
   112. [KEY\_DIVIDE](#KEY_DIVIDE)
   113. [KEY\_SYSRQ](#KEY_SYSRQ)
   114. [KEY\_RMENU](#KEY_RMENU)
   115. [KEY\_FUNCTION](#KEY_FUNCTION)
   116. [KEY\_PAUSE](#KEY_PAUSE)
   117. [KEY\_HOME](#KEY_HOME)
   118. [KEY\_UP](#KEY_UP)
   119. [KEY\_PRIOR](#KEY_PRIOR)
   120. [KEY\_LEFT](#KEY_LEFT)
   121. [KEY\_RIGHT](#KEY_RIGHT)
   122. [KEY\_END](#KEY_END)
   123. [KEY\_DOWN](#KEY_DOWN)
   124. [KEY\_NEXT](#KEY_NEXT)
   125. [KEY\_INSERT](#KEY_INSERT)
   126. [KEY\_DELETE](#KEY_DELETE)
   127. [KEY\_CLEAR](#KEY_CLEAR)
   128. [KEY\_LMETA](#KEY_LMETA)
   129. [KEY\_LWIN](#KEY_LWIN)
   130. [KEY\_RMETA](#KEY_RMETA)
   131. [KEY\_RWIN](#KEY_RWIN)
   132. [KEY\_APPS](#KEY_APPS)
   133. [KEY\_POWER](#KEY_POWER)
   134. [KEY\_SLEEP](#KEY_SLEEP)
   135. [repeatEvents](#repeatEvents)
   136. [KEYBOARD\_SIZE](#KEYBOARD_SIZE)
   137. [keyName](#keyName)
   138. [keyMap](#keyMap)
6. [Constructor Details](#constructor-detail)
   1. [Keyboard()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [addKeyEvent(int, int)](#addKeyEvent(int,int))
   2. [addCharEvent(char)](#addCharEvent(char))
   3. [create()](#create())
   4. [initKeyNames()](#initKeyNames())
   5. [isKeyDown(int)](#isKeyDown(int))
   6. [poll()](#poll())
   7. [enableRepeatEvents(boolean)](#enableRepeatEvents(boolean))
   8. [areRepeatEventsEnabled()](#areRepeatEventsEnabled())
   9. [isRepeatEvent()](#isRepeatEvent())
   10. [next()](#next())
   11. [getEventKey()](#getEventKey())
   12. [getEventCharacter()](#getEventCharacter())
   13. [getEventKeyState()](#getEventKeyState())
   14. [getEventNanoseconds()](#getEventNanoseconds())
   15. [getKeyName(int)](#getKeyName(int))
   16. [getKeyIndex(String)](#getKeyIndex(java.lang.String))
   17. [isCreated()](#isCreated())
   18. [destroy()](#destroy())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Keyboard
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

org.lwjglx.input.Keyboard

---

public class Keyboard
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final int`

  `CHAR_NONE`

  The special character meaning that no
  character was translated for the event.

  `static final int`

  `KEY_0`

  `static final int`

  `KEY_1`

  `static final int`

  `KEY_2`

  `static final int`

  `KEY_3`

  `static final int`

  `KEY_4`

  `static final int`

  `KEY_5`

  `static final int`

  `KEY_6`

  `static final int`

  `KEY_7`

  `static final int`

  `KEY_8`

  `static final int`

  `KEY_9`

  `static final int`

  `KEY_A`

  `static final int`

  `KEY_ADD`

  `static final int`

  `KEY_APOSTROPHE`

  `static final int`

  `KEY_APPS`

  `static final int`

  `KEY_AT`

  `static final int`

  `KEY_AX`

  `static final int`

  `KEY_B`

  `static final int`

  `KEY_BACK`

  `static final int`

  `KEY_BACKSLASH`

  `static final int`

  `KEY_C`

  `static final int`

  `KEY_CAPITAL`

  `static final int`

  `KEY_CIRCUMFLEX`

  `static final int`

  `KEY_CLEAR`

  `static final int`

  `KEY_COLON`

  `static final int`

  `KEY_COMMA`

  `static final int`

  `KEY_CONVERT`

  `static final int`

  `KEY_D`

  `static final int`

  `KEY_DECIMAL`

  `static final int`

  `KEY_DELETE`

  `static final int`

  `KEY_DIVIDE`

  `static final int`

  `KEY_DOWN`

  `static final int`

  `KEY_E`

  `static final int`

  `KEY_END`

  `static final int`

  `KEY_EQUALS`

  `static final int`

  `KEY_ESCAPE`

  `static final int`

  `KEY_F`

  `static final int`

  `KEY_F1`

  `static final int`

  `KEY_F10`

  `static final int`

  `KEY_F11`

  `static final int`

  `KEY_F12`

  `static final int`

  `KEY_F13`

  `static final int`

  `KEY_F14`

  `static final int`

  `KEY_F15`

  `static final int`

  `KEY_F16`

  `static final int`

  `KEY_F17`

  `static final int`

  `KEY_F18`

  `static final int`

  `KEY_F19`

  `static final int`

  `KEY_F2`

  `static final int`

  `KEY_F3`

  `static final int`

  `KEY_F4`

  `static final int`

  `KEY_F5`

  `static final int`

  `KEY_F6`

  `static final int`

  `KEY_F7`

  `static final int`

  `KEY_F8`

  `static final int`

  `KEY_F9`

  `static final int`

  `KEY_FUNCTION`

  `static final int`

  `KEY_G`

  `static final int`

  `KEY_GRAVE`

  `static final int`

  `KEY_H`

  `static final int`

  `KEY_HOME`

  `static final int`

  `KEY_I`

  `static final int`

  `KEY_INSERT`

  `static final int`

  `KEY_J`

  `static final int`

  `KEY_K`

  `static final int`

  `KEY_KANA`

  `static final int`

  `KEY_KANJI`

  `static final int`

  `KEY_L`

  `static final int`

  `KEY_LBRACKET`

  `static final int`

  `KEY_LCONTROL`

  `static final int`

  `KEY_LEFT`

  `static final int`

  `KEY_LMENU`

  `static final int`

  `KEY_LMETA`

  `static final int`

  `KEY_LSHIFT`

  `static final int`

  `KEY_LWIN`

  `static final int`

  `KEY_M`

  `static final int`

  `KEY_MINUS`

  `static final int`

  `KEY_MULTIPLY`

  `static final int`

  `KEY_N`

  `static final int`

  `KEY_NEXT`

  `static final int`

  `KEY_NOCONVERT`

  `static final int`

  `KEY_NONE`

  The special keycode meaning that only the
  translated character is valid.

  `static final int`

  `KEY_NUMLOCK`

  `static final int`

  `KEY_NUMPAD0`

  `static final int`

  `KEY_NUMPAD1`

  `static final int`

  `KEY_NUMPAD2`

  `static final int`

  `KEY_NUMPAD3`

  `static final int`

  `KEY_NUMPAD4`

  `static final int`

  `KEY_NUMPAD5`

  `static final int`

  `KEY_NUMPAD6`

  `static final int`

  `KEY_NUMPAD7`

  `static final int`

  `KEY_NUMPAD8`

  `static final int`

  `KEY_NUMPAD9`

  `static final int`

  `KEY_NUMPADCOMMA`

  `static final int`

  `KEY_NUMPADENTER`

  `static final int`

  `KEY_NUMPADEQUALS`

  `static final int`

  `KEY_O`

  `static final int`

  `KEY_P`

  `static final int`

  `KEY_PAUSE`

  `static final int`

  `KEY_PERIOD`

  `static final int`

  `KEY_POWER`

  `static final int`

  `KEY_PRIOR`

  `static final int`

  `KEY_Q`

  `static final int`

  `KEY_R`

  `static final int`

  `KEY_RBRACKET`

  `static final int`

  `KEY_RCONTROL`

  `static final int`

  `KEY_RETURN`

  `static final int`

  `KEY_RIGHT`

  `static final int`

  `KEY_RMENU`

  `static final int`

  `KEY_RMETA`

  `static final int`

  `KEY_RSHIFT`

  `static final int`

  `KEY_RWIN`

  `static final int`

  `KEY_S`

  `static final int`

  `KEY_SCROLL`

  `static final int`

  `KEY_SECTION`

  `static final int`

  `KEY_SEMICOLON`

  `static final int`

  `KEY_SLASH`

  `static final int`

  `KEY_SLEEP`

  `static final int`

  `KEY_SPACE`

  `static final int`

  `KEY_STOP`

  `static final int`

  `KEY_SUBTRACT`

  `static final int`

  `KEY_SYSRQ`

  `static final int`

  `KEY_T`

  `static final int`

  `KEY_TAB`

  `static final int`

  `KEY_U`

  `static final int`

  `KEY_UNDERLINE`

  `static final int`

  `KEY_UNLABELED`

  `static final int`

  `KEY_UP`

  `static final int`

  `KEY_V`

  `static final int`

  `KEY_W`

  `static final int`

  `KEY_X`

  `static final int`

  `KEY_Y`

  `static final int`

  `KEY_YEN`

  `static final int`

  `KEY_Z`

  `static final int`

  `KEYBOARD_SIZE`

  `private static final Map<String,Integer>`

  `keyMap`

  `private static final String[]`

  `keyName`

  `private static boolean`

  `repeatEvents`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Keyboard()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `addCharEvent(char c)`

  `static void`

  `addKeyEvent(int key,
  int status)`

  `static boolean`

  `areRepeatEventsEnabled()`

  `static void`

  `create()`

  `static void`

  `destroy()`

  `static void`

  `enableRepeatEvents(boolean enable)`

  `static char`

  `getEventCharacter()`

  `static int`

  `getEventKey()`

  `static boolean`

  `getEventKeyState()`

  `static long`

  `getEventNanoseconds()`

  `static int`

  `getKeyIndex(String keyName)`

  `static String`

  `getKeyName(int key)`

  `static void`

  `initKeyNames()`

  `static boolean`

  `isCreated()`

  `static boolean`

  `isKeyDown(int key)`

  `static boolean`

  `isRepeatEvent()`

  `static boolean`

  `next()`

  `static void`

  `poll()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### CHAR\_NONE

    public static final int CHAR\_NONE

    The special character meaning that no
    character was translated for the event.

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.CHAR_NONE)
  + ### KEY\_NONE

    public static final int KEY\_NONE

    The special keycode meaning that only the
    translated character is valid.

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NONE)
  + ### KEY\_ESCAPE

    public static final int KEY\_ESCAPE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_ESCAPE)
  + ### KEY\_1

    public static final int KEY\_1

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_1)
  + ### KEY\_2

    public static final int KEY\_2

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_2)
  + ### KEY\_3

    public static final int KEY\_3

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_3)
  + ### KEY\_4

    public static final int KEY\_4

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_4)
  + ### KEY\_5

    public static final int KEY\_5

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_5)
  + ### KEY\_6

    public static final int KEY\_6

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_6)
  + ### KEY\_7

    public static final int KEY\_7

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_7)
  + ### KEY\_8

    public static final int KEY\_8

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_8)
  + ### KEY\_9

    public static final int KEY\_9

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_9)
  + ### KEY\_0

    public static final int KEY\_0

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_0)
  + ### KEY\_MINUS

    public static final int KEY\_MINUS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_MINUS)
  + ### KEY\_EQUALS

    public static final int KEY\_EQUALS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_EQUALS)
  + ### KEY\_BACK

    public static final int KEY\_BACK

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_BACK)
  + ### KEY\_TAB

    public static final int KEY\_TAB

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_TAB)
  + ### KEY\_Q

    public static final int KEY\_Q

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_Q)
  + ### KEY\_W

    public static final int KEY\_W

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_W)
  + ### KEY\_E

    public static final int KEY\_E

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_E)
  + ### KEY\_R

    public static final int KEY\_R

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_R)
  + ### KEY\_T

    public static final int KEY\_T

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_T)
  + ### KEY\_Y

    public static final int KEY\_Y

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_Y)
  + ### KEY\_U

    public static final int KEY\_U

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_U)
  + ### KEY\_I

    public static final int KEY\_I

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_I)
  + ### KEY\_O

    public static final int KEY\_O

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_O)
  + ### KEY\_P

    public static final int KEY\_P

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_P)
  + ### KEY\_LBRACKET

    public static final int KEY\_LBRACKET

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_LBRACKET)
  + ### KEY\_RBRACKET

    public static final int KEY\_RBRACKET

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_RBRACKET)
  + ### KEY\_RETURN

    public static final int KEY\_RETURN

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_RETURN)
  + ### KEY\_LCONTROL

    public static final int KEY\_LCONTROL

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_LCONTROL)
  + ### KEY\_A

    public static final int KEY\_A

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_A)
  + ### KEY\_S

    public static final int KEY\_S

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_S)
  + ### KEY\_D

    public static final int KEY\_D

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_D)
  + ### KEY\_F

    public static final int KEY\_F

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F)
  + ### KEY\_G

    public static final int KEY\_G

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_G)
  + ### KEY\_H

    public static final int KEY\_H

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_H)
  + ### KEY\_J

    public static final int KEY\_J

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_J)
  + ### KEY\_K

    public static final int KEY\_K

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_K)
  + ### KEY\_L

    public static final int KEY\_L

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_L)
  + ### KEY\_SEMICOLON

    public static final int KEY\_SEMICOLON

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_SEMICOLON)
  + ### KEY\_APOSTROPHE

    public static final int KEY\_APOSTROPHE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_APOSTROPHE)
  + ### KEY\_GRAVE

    public static final int KEY\_GRAVE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_GRAVE)
  + ### KEY\_LSHIFT

    public static final int KEY\_LSHIFT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_LSHIFT)
  + ### KEY\_BACKSLASH

    public static final int KEY\_BACKSLASH

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_BACKSLASH)
  + ### KEY\_Z

    public static final int KEY\_Z

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_Z)
  + ### KEY\_X

    public static final int KEY\_X

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_X)
  + ### KEY\_C

    public static final int KEY\_C

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_C)
  + ### KEY\_V

    public static final int KEY\_V

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_V)
  + ### KEY\_B

    public static final int KEY\_B

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_B)
  + ### KEY\_N

    public static final int KEY\_N

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_N)
  + ### KEY\_M

    public static final int KEY\_M

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_M)
  + ### KEY\_COMMA

    public static final int KEY\_COMMA

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_COMMA)
  + ### KEY\_PERIOD

    public static final int KEY\_PERIOD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_PERIOD)
  + ### KEY\_SLASH

    public static final int KEY\_SLASH

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_SLASH)
  + ### KEY\_RSHIFT

    public static final int KEY\_RSHIFT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_RSHIFT)
  + ### KEY\_MULTIPLY

    public static final int KEY\_MULTIPLY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_MULTIPLY)
  + ### KEY\_LMENU

    public static final int KEY\_LMENU

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_LMENU)
  + ### KEY\_SPACE

    public static final int KEY\_SPACE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_SPACE)
  + ### KEY\_CAPITAL

    public static final int KEY\_CAPITAL

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_CAPITAL)
  + ### KEY\_F1

    public static final int KEY\_F1

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F1)
  + ### KEY\_F2

    public static final int KEY\_F2

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F2)
  + ### KEY\_F3

    public static final int KEY\_F3

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F3)
  + ### KEY\_F4

    public static final int KEY\_F4

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F4)
  + ### KEY\_F5

    public static final int KEY\_F5

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F5)
  + ### KEY\_F6

    public static final int KEY\_F6

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F6)
  + ### KEY\_F7

    public static final int KEY\_F7

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F7)
  + ### KEY\_F8

    public static final int KEY\_F8

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F8)
  + ### KEY\_F9

    public static final int KEY\_F9

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F9)
  + ### KEY\_F10

    public static final int KEY\_F10

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F10)
  + ### KEY\_NUMLOCK

    public static final int KEY\_NUMLOCK

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NUMLOCK)
  + ### KEY\_SCROLL

    public static final int KEY\_SCROLL

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_SCROLL)
  + ### KEY\_NUMPAD7

    public static final int KEY\_NUMPAD7

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NUMPAD7)
  + ### KEY\_NUMPAD8

    public static final int KEY\_NUMPAD8

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NUMPAD8)
  + ### KEY\_NUMPAD9

    public static final int KEY\_NUMPAD9

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NUMPAD9)
  + ### KEY\_SUBTRACT

    public static final int KEY\_SUBTRACT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_SUBTRACT)
  + ### KEY\_NUMPAD4

    public static final int KEY\_NUMPAD4

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NUMPAD4)
  + ### KEY\_NUMPAD5

    public static final int KEY\_NUMPAD5

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NUMPAD5)
  + ### KEY\_NUMPAD6

    public static final int KEY\_NUMPAD6

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NUMPAD6)
  + ### KEY\_ADD

    public static final int KEY\_ADD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_ADD)
  + ### KEY\_NUMPAD1

    public static final int KEY\_NUMPAD1

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NUMPAD1)
  + ### KEY\_NUMPAD2

    public static final int KEY\_NUMPAD2

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NUMPAD2)
  + ### KEY\_NUMPAD3

    public static final int KEY\_NUMPAD3

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NUMPAD3)
  + ### KEY\_NUMPAD0

    public static final int KEY\_NUMPAD0

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NUMPAD0)
  + ### KEY\_DECIMAL

    public static final int KEY\_DECIMAL

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_DECIMAL)
  + ### KEY\_F11

    public static final int KEY\_F11

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F11)
  + ### KEY\_F12

    public static final int KEY\_F12

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F12)
  + ### KEY\_F13

    public static final int KEY\_F13

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F13)
  + ### KEY\_F14

    public static final int KEY\_F14

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F14)
  + ### KEY\_F15

    public static final int KEY\_F15

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F15)
  + ### KEY\_F16

    public static final int KEY\_F16

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F16)
  + ### KEY\_F17

    public static final int KEY\_F17

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F17)
  + ### KEY\_F18

    public static final int KEY\_F18

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F18)
  + ### KEY\_KANA

    public static final int KEY\_KANA

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_KANA)
  + ### KEY\_F19

    public static final int KEY\_F19

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_F19)
  + ### KEY\_CONVERT

    public static final int KEY\_CONVERT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_CONVERT)
  + ### KEY\_NOCONVERT

    public static final int KEY\_NOCONVERT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NOCONVERT)
  + ### KEY\_YEN

    public static final int KEY\_YEN

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_YEN)
  + ### KEY\_NUMPADEQUALS

    public static final int KEY\_NUMPADEQUALS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NUMPADEQUALS)
  + ### KEY\_CIRCUMFLEX

    public static final int KEY\_CIRCUMFLEX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_CIRCUMFLEX)
  + ### KEY\_AT

    public static final int KEY\_AT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_AT)
  + ### KEY\_COLON

    public static final int KEY\_COLON

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_COLON)
  + ### KEY\_UNDERLINE

    public static final int KEY\_UNDERLINE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_UNDERLINE)
  + ### KEY\_KANJI

    public static final int KEY\_KANJI

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_KANJI)
  + ### KEY\_STOP

    public static final int KEY\_STOP

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_STOP)
  + ### KEY\_AX

    public static final int KEY\_AX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_AX)
  + ### KEY\_UNLABELED

    public static final int KEY\_UNLABELED

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_UNLABELED)
  + ### KEY\_NUMPADENTER

    public static final int KEY\_NUMPADENTER

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NUMPADENTER)
  + ### KEY\_RCONTROL

    public static final int KEY\_RCONTROL

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_RCONTROL)
  + ### KEY\_SECTION

    public static final int KEY\_SECTION

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_SECTION)
  + ### KEY\_NUMPADCOMMA

    public static final int KEY\_NUMPADCOMMA

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NUMPADCOMMA)
  + ### KEY\_DIVIDE

    public static final int KEY\_DIVIDE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_DIVIDE)
  + ### KEY\_SYSRQ

    public static final int KEY\_SYSRQ

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_SYSRQ)
  + ### KEY\_RMENU

    public static final int KEY\_RMENU

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_RMENU)
  + ### KEY\_FUNCTION

    public static final int KEY\_FUNCTION

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_FUNCTION)
  + ### KEY\_PAUSE

    public static final int KEY\_PAUSE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_PAUSE)
  + ### KEY\_HOME

    public static final int KEY\_HOME

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_HOME)
  + ### KEY\_UP

    public static final int KEY\_UP

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_UP)
  + ### KEY\_PRIOR

    public static final int KEY\_PRIOR

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_PRIOR)
  + ### KEY\_LEFT

    public static final int KEY\_LEFT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_LEFT)
  + ### KEY\_RIGHT

    public static final int KEY\_RIGHT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_RIGHT)
  + ### KEY\_END

    public static final int KEY\_END

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_END)
  + ### KEY\_DOWN

    public static final int KEY\_DOWN

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_DOWN)
  + ### KEY\_NEXT

    public static final int KEY\_NEXT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_NEXT)
  + ### KEY\_INSERT

    public static final int KEY\_INSERT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_INSERT)
  + ### KEY\_DELETE

    public static final int KEY\_DELETE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_DELETE)
  + ### KEY\_CLEAR

    public static final int KEY\_CLEAR

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_CLEAR)
  + ### KEY\_LMETA

    public static final int KEY\_LMETA

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_LMETA)
  + ### KEY\_LWIN

    public static final int KEY\_LWIN

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_LWIN)
  + ### KEY\_RMETA

    public static final int KEY\_RMETA

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_RMETA)
  + ### KEY\_RWIN

    public static final int KEY\_RWIN

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_RWIN)
  + ### KEY\_APPS

    public static final int KEY\_APPS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_APPS)
  + ### KEY\_POWER

    public static final int KEY\_POWER

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_POWER)
  + ### KEY\_SLEEP

    public static final int KEY\_SLEEP

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEY_SLEEP)
  + ### repeatEvents

    private static boolean repeatEvents
  + ### KEYBOARD\_SIZE

    public static final int KEYBOARD\_SIZE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#org.lwjglx.input.Keyboard.KEYBOARD_SIZE)
  + ### keyName

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")[] keyName
  + ### keyMap

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> keyMap
* Constructor Details
  -------------------

  + ### Keyboard

    public Keyboard()
* Method Details
  --------------

  + ### addKeyEvent

    public static void addKeyEvent(int key,
    int status)
  + ### addCharEvent

    public static void addCharEvent(char c)
  + ### create

    public static void create()
  + ### initKeyNames

    public static void initKeyNames()
  + ### isKeyDown

    public static boolean isKeyDown(int key)
  + ### poll

    public static void poll()
  + ### enableRepeatEvents

    public static void enableRepeatEvents(boolean enable)
  + ### areRepeatEventsEnabled

    public static boolean areRepeatEventsEnabled()
  + ### isRepeatEvent

    public static boolean isRepeatEvent()
  + ### next

    public static boolean next()
  + ### getEventKey

    public static int getEventKey()
  + ### getEventCharacter

    public static char getEventCharacter()
  + ### getEventKeyState

    public static boolean getEventKeyState()
  + ### getEventNanoseconds

    public static long getEventNanoseconds()
  + ### getKeyName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getKeyName(int key)
  + ### getKeyIndex

    public static int getKeyIndex([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") keyName)
  + ### isCreated

    public static boolean isCreated()
  + ### destroy

    public static void destroy()