[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [SearchMode](SearchMode.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [fadeTime](#fadeTime)
   3. [plrModes](#plrModes)
7. [Constructor Details](#constructor-detail)
   1. [SearchMode()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getInstance()](#getInstance())
   2. [getSearchModeForPlayer(int)](#getSearchModeForPlayer(int))
   3. [getFadeTime()](#getFadeTime())
   4. [setFadeTime(float)](#setFadeTime(float))
   5. [isOverride(int)](#isOverride(int))
   6. [setOverride(int, boolean)](#setOverride(int,boolean))
   7. [isOverrideSearchManager(int)](#isOverrideSearchManager(int))
   8. [setOverrideSearchManager(int, boolean)](#setOverrideSearchManager(int,boolean))
   9. [getRadius(int)](#getRadius(int))
   10. [getGradientWidth(int)](#getGradientWidth(int))
   11. [getBlur(int)](#getBlur(int))
   12. [getDesat(int)](#getDesat(int))
   13. [getDarkness(int)](#getDarkness(int))
   14. [isEnabled(int)](#isEnabled(int))
   15. [setEnabled(int, boolean)](#setEnabled(int,boolean))
   16. [FadeIn(int)](#FadeIn(int))
   17. [FadeOut(int)](#FadeOut(int))
   18. [update()](#update())
   19. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SearchMode
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.SearchMode

---

public class SearchMode
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `SearchMode.PlayerSearchMode`

  `static class`

  `SearchMode.SearchModeFloat`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `fadeTime`

  `private static SearchMode`

  `instance`

  `private final SearchMode.PlayerSearchMode[]`

  `plrModes`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SearchMode()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `FadeIn(int plrIdx)`

  `private void`

  `FadeOut(int plrIdx)`

  `SearchMode.SearchModeFloat`

  `getBlur(int plrIdx)`

  `SearchMode.SearchModeFloat`

  `getDarkness(int plrIdx)`

  `SearchMode.SearchModeFloat`

  `getDesat(int plrIdx)`

  `float`

  `getFadeTime()`

  `SearchMode.SearchModeFloat`

  `getGradientWidth(int plrIdx)`

  `static SearchMode`

  `getInstance()`

  `SearchMode.SearchModeFloat`

  `getRadius(int plrIdx)`

  `SearchMode.PlayerSearchMode`

  `getSearchModeForPlayer(int index)`

  `boolean`

  `isEnabled(int plrIdx)`

  `boolean`

  `isOverride(int plrIdx)`

  `boolean`

  `isOverrideSearchManager(int plrIdx)`

  `static void`

  `reset()`

  `void`

  `setEnabled(int plrIdx,
  boolean b)`

  `void`

  `setFadeTime(float fadeTime)`

  `void`

  `setOverride(int plrIdx,
  boolean enabled)`

  `void`

  `setOverrideSearchManager(int plrIdx,
  boolean enabled)`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    private static [SearchMode](SearchMode.html "class in zombie.iso") instance
  + ### fadeTime

    private float fadeTime
  + ### plrModes

    private final [SearchMode.PlayerSearchMode](SearchMode.PlayerSearchMode.html "class in zombie.iso")[] plrModes
* Constructor Details
  -------------------

  + ### SearchMode

    private SearchMode()
* Method Details
  --------------

  + ### getInstance

    public static [SearchMode](SearchMode.html "class in zombie.iso") getInstance()
  + ### getSearchModeForPlayer

    public [SearchMode.PlayerSearchMode](SearchMode.PlayerSearchMode.html "class in zombie.iso") getSearchModeForPlayer(int index)
  + ### getFadeTime

    public float getFadeTime()
  + ### setFadeTime

    public void setFadeTime(float fadeTime)
  + ### isOverride

    public boolean isOverride(int plrIdx)
  + ### setOverride

    public void setOverride(int plrIdx,
    boolean enabled)
  + ### isOverrideSearchManager

    public boolean isOverrideSearchManager(int plrIdx)
  + ### setOverrideSearchManager

    public void setOverrideSearchManager(int plrIdx,
    boolean enabled)
  + ### getRadius

    public [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") getRadius(int plrIdx)
  + ### getGradientWidth

    public [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") getGradientWidth(int plrIdx)
  + ### getBlur

    public [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") getBlur(int plrIdx)
  + ### getDesat

    public [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") getDesat(int plrIdx)
  + ### getDarkness

    public [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") getDarkness(int plrIdx)
  + ### isEnabled

    public boolean isEnabled(int plrIdx)
  + ### setEnabled

    public void setEnabled(int plrIdx,
    boolean b)
  + ### FadeIn

    private void FadeIn(int plrIdx)
  + ### FadeOut

    private void FadeOut(int plrIdx)
  + ### update

    public void update()
  + ### reset

    public static void reset()