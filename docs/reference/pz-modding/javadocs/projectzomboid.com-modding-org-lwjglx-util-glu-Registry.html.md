[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [org.lwjglx.util.glu](package-summary.html)
2. [Registry](Registry.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [versionString](#versionString)
   2. [extensionString](#extensionString)
6. [Constructor Details](#constructor-detail)
   1. [Registry()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [gluGetString(int)](#gluGetString(int))
   2. [gluCheckExtension(String, String)](#gluCheckExtension(java.lang.String,java.lang.String))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class Registry
==============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

org.lwjglx.util.glu.Util

org.lwjglx.util.glu.Registry

---

public class Registry
extends org.lwjglx.util.glu.Util

Registry.java

Created 11-jan-2004

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final String`

  `extensionString`

  `private static final String`

  `versionString`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Registry()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static boolean`

  `gluCheckExtension(String extName,
  String extString)`

  Method gluCheckExtension

  `static String`

  `gluGetString(int name)`

  Method gluGetString

  ### Methods inherited from class org.lwjglx.util.glu.Util

  `bytesPerPixel, ceil, compPerPix, cross, nearestPower, normalize`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### versionString

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") versionString

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#org.lwjglx.util.glu.Registry.versionString)
  + ### extensionString

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") extensionString

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#org.lwjglx.util.glu.Registry.extensionString)
* Constructor Details
  -------------------

  + ### Registry

    public Registry()
* Method Details
  --------------

  + ### gluGetString

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") gluGetString(int name)

    Method gluGetString

    Returns:
    :   String
  + ### gluCheckExtension

    public static boolean gluCheckExtension([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") extName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") extString)

    Method gluCheckExtension

    Parameters:
    :   `extName` - is an extension name.
    :   `extString` - is a string of extensions separated by blank(s). There may or
        may not be leading or trailing blank(s) in extString.
        This works in cases of extensions being prefixes of another like
        GL\_EXT\_texture and GL\_EXT\_texture3D.

    Returns:
    :   boolean true if extName is found otherwise it returns false.