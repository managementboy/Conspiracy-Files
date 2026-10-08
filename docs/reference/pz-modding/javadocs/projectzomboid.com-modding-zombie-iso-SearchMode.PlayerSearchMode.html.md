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
3. [PlayerSearchMode](SearchMode.PlayerSearchMode.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [plrIndex](#plrIndex)
   2. [parent](#parent)
   3. [override](#override)
   4. [overrideSearchManager](#overrideSearchManager)
   5. [enabled](#enabled)
   6. [radius](#radius)
   7. [gradientWidth](#gradientWidth)
   8. [blur](#blur)
   9. [desat](#desat)
   10. [darkness](#darkness)
   11. [timer](#timer)
   12. [doFadeOut](#doFadeOut)
   13. [doFadeIn](#doFadeIn)
6. [Constructor Details](#constructor-detail)
   1. [PlayerSearchMode(int, SearchMode)](#%3Cinit%3E(int,zombie.iso.SearchMode))
7. [Method Details](#method-detail)
   1. [isShaderEnabled()](#isShaderEnabled())
   2. [isPlayerExterior()](#isPlayerExterior())
   3. [getShaderBlur()](#getShaderBlur())
   4. [getShaderDesat()](#getShaderDesat())
   5. [getShaderRadius()](#getShaderRadius())
   6. [getShaderGradientWidth()](#getShaderGradientWidth())
   7. [getShaderDarkness()](#getShaderDarkness())
   8. [getBlur()](#getBlur())
   9. [getDesat()](#getDesat())
   10. [getRadius()](#getRadius())
   11. [getGradientWidth()](#getGradientWidth())
   12. [getDarkness()](#getDarkness())
   13. [update()](#update())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SearchMode.PlayerSearchMode
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.SearchMode.PlayerSearchMode

Enclosing class:
:   `SearchMode`

---

public static class SearchMode.PlayerSearchMode
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final SearchMode.SearchModeFloat`

  `blur`

  `private final SearchMode.SearchModeFloat`

  `darkness`

  `private final SearchMode.SearchModeFloat`

  `desat`

  `private boolean`

  `doFadeIn`

  `private boolean`

  `doFadeOut`

  `private boolean`

  `enabled`

  `private final SearchMode.SearchModeFloat`

  `gradientWidth`

  `private boolean`

  `override`

  `private boolean`

  `overrideSearchManager`

  `private final SearchMode`

  `parent`

  `private final int`

  `plrIndex`

  `private final SearchMode.SearchModeFloat`

  `radius`

  `private float`

  `timer`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PlayerSearchMode(int index,
  SearchMode sm)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `SearchMode.SearchModeFloat`

  `getBlur()`

  `SearchMode.SearchModeFloat`

  `getDarkness()`

  `SearchMode.SearchModeFloat`

  `getDesat()`

  `SearchMode.SearchModeFloat`

  `getGradientWidth()`

  `SearchMode.SearchModeFloat`

  `getRadius()`

  `float`

  `getShaderBlur()`

  `float`

  `getShaderDarkness()`

  `float`

  `getShaderDesat()`

  `float`

  `getShaderGradientWidth()`

  `float`

  `getShaderRadius()`

  `private boolean`

  `isPlayerExterior()`

  `boolean`

  `isShaderEnabled()`

  `private void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### plrIndex

    private final int plrIndex
  + ### parent

    private final [SearchMode](SearchMode.html "class in zombie.iso") parent
  + ### override

    private boolean override
  + ### overrideSearchManager

    private boolean overrideSearchManager
  + ### enabled

    private boolean enabled
  + ### radius

    private final [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") radius
  + ### gradientWidth

    private final [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") gradientWidth
  + ### blur

    private final [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") blur
  + ### desat

    private final [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") desat
  + ### darkness

    private final [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") darkness
  + ### timer

    private float timer
  + ### doFadeOut

    private boolean doFadeOut
  + ### doFadeIn

    private boolean doFadeIn
* Constructor Details
  -------------------

  + ### PlayerSearchMode

    public PlayerSearchMode(int index,
    [SearchMode](SearchMode.html "class in zombie.iso") sm)
* Method Details
  --------------

  + ### isShaderEnabled

    public boolean isShaderEnabled()
  + ### isPlayerExterior

    private boolean isPlayerExterior()
  + ### getShaderBlur

    public float getShaderBlur()
  + ### getShaderDesat

    public float getShaderDesat()
  + ### getShaderRadius

    public float getShaderRadius()
  + ### getShaderGradientWidth

    public float getShaderGradientWidth()
  + ### getShaderDarkness

    public float getShaderDarkness()
  + ### getBlur

    public [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") getBlur()
  + ### getDesat

    public [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") getDesat()
  + ### getRadius

    public [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") getRadius()
  + ### getGradientWidth

    public [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") getGradientWidth()
  + ### getDarkness

    public [SearchMode.SearchModeFloat](SearchMode.SearchModeFloat.html "class in zombie.iso") getDarkness()
  + ### update

    private void update()