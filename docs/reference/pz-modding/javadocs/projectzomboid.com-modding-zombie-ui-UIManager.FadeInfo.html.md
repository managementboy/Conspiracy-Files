[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [UIManager](UIManager.html)
3. [FadeInfo](UIManager.FadeInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [playerIndex](#playerIndex)
   2. [fadeBeforeUi](#fadeBeforeUi)
   3. [fadeAlpha](#fadeAlpha)
   4. [fadeTime](#fadeTime)
   5. [fadeTimeMax](#fadeTimeMax)
   6. [fadingOut](#fadingOut)
6. [Constructor Details](#constructor-detail)
   1. [FadeInfo(int)](#%3Cinit%3E(int))
7. [Method Details](#method-detail)
   1. [isFadeBeforeUI()](#isFadeBeforeUI())
   2. [setFadeBeforeUI(boolean)](#setFadeBeforeUI(boolean))
   3. [getFadeAlpha()](#getFadeAlpha())
   4. [setFadeAlpha(float)](#setFadeAlpha(float))
   5. [getFadeTime()](#getFadeTime())
   6. [setFadeTime(int)](#setFadeTime(int))
   7. [getFadeTimeMax()](#getFadeTimeMax())
   8. [setFadeTimeMax(int)](#setFadeTimeMax(int))
   9. [isFadingOut()](#isFadingOut())
   10. [setFadingOut(boolean)](#setFadingOut(boolean))
   11. [FadeIn(int)](#FadeIn(int))
   12. [FadeOut(int)](#FadeOut(int))
   13. [update()](#update())
   14. [render()](#render())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UIManager.FadeInfo
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.ui.UIManager.FadeInfo

Enclosing class:
:   `UIManager`

---

private static class UIManager.FadeInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `fadeAlpha`

  `boolean`

  `fadeBeforeUi`

  `int`

  `fadeTime`

  `int`

  `fadeTimeMax`

  `boolean`

  `fadingOut`

  `int`

  `playerIndex`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FadeInfo(int playerIndex)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `FadeIn(int seconds)`

  `void`

  `FadeOut(int seconds)`

  `float`

  `getFadeAlpha()`

  `int`

  `getFadeTime()`

  `int`

  `getFadeTimeMax()`

  `boolean`

  `isFadeBeforeUI()`

  `boolean`

  `isFadingOut()`

  `void`

  `render()`

  `void`

  `setFadeAlpha(float fadeAlpha)`

  `void`

  `setFadeBeforeUI(boolean bFadeBeforeUI)`

  `void`

  `setFadeTime(int fadeTime)`

  `void`

  `setFadeTimeMax(int fadeTimeMax)`

  `void`

  `setFadingOut(boolean fadingOut)`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### playerIndex

    public int playerIndex
  + ### fadeBeforeUi

    public boolean fadeBeforeUi
  + ### fadeAlpha

    public float fadeAlpha
  + ### fadeTime

    public int fadeTime
  + ### fadeTimeMax

    public int fadeTimeMax
  + ### fadingOut

    public boolean fadingOut
* Constructor Details
  -------------------

  + ### FadeInfo

    public FadeInfo(int playerIndex)
* Method Details
  --------------

  + ### isFadeBeforeUI

    public boolean isFadeBeforeUI()
  + ### setFadeBeforeUI

    public void setFadeBeforeUI(boolean bFadeBeforeUI)
  + ### getFadeAlpha

    public float getFadeAlpha()
  + ### setFadeAlpha

    public void setFadeAlpha(float fadeAlpha)
  + ### getFadeTime

    public int getFadeTime()
  + ### setFadeTime

    public void setFadeTime(int fadeTime)
  + ### getFadeTimeMax

    public int getFadeTimeMax()
  + ### setFadeTimeMax

    public void setFadeTimeMax(int fadeTimeMax)
  + ### isFadingOut

    public boolean isFadingOut()
  + ### setFadingOut

    public void setFadingOut(boolean fadingOut)
  + ### FadeIn

    public void FadeIn(int seconds)
  + ### FadeOut

    public void FadeOut(int seconds)
  + ### update

    public void update()
  + ### render

    public void render()