[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [ServerSettingsManager](ServerSettingsManager.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [settings](#settings)
   3. [suffixes](#suffixes)
   4. [MAX\_FILENAME\_LENGTH](#MAX_FILENAME_LENGTH)
   5. [MAX\_PATH\_LENGTH](#MAX_PATH_LENGTH)
   6. [SEPARATOR\_LENGTH](#SEPARATOR_LENGTH)
   7. [LONGEST\_SUFFIX\_LENGTH](#LONGEST_SUFFIX_LENGTH)
6. [Constructor Details](#constructor-detail)
   1. [ServerSettingsManager()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getSettingsFolder()](#getSettingsFolder())
   2. [settingsFolderPathValidLength(String)](#settingsFolderPathValidLength(java.lang.String))
   3. [settingsFolderNameValidLength(String)](#settingsFolderNameValidLength(java.lang.String))
   4. [settingsFolderValidLengthChecks(String)](#settingsFolderValidLengthChecks(java.lang.String))
   5. [getNameInSettingsFolder(String)](#getNameInSettingsFolder(java.lang.String))
   6. [readAllSettings()](#readAllSettings())
   7. [getSettingsCount()](#getSettingsCount())
   8. [getSettingsByIndex(int)](#getSettingsByIndex(int))
   9. [isValidName(String)](#isValidName(java.lang.String))
   10. [anyFilesExist(String)](#anyFilesExist(java.lang.String))
   11. [isValidNewName(String)](#isValidNewName(java.lang.String))
   12. [getSuffixes()](#getSuffixes())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ServerSettingsManager
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.ServerSettingsManager

---

public class ServerSettingsManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final ServerSettingsManager`

  `instance`

  `private static final int`

  `LONGEST_SUFFIX_LENGTH`

  `private static final int`

  `MAX_FILENAME_LENGTH`

  `private static final int`

  `MAX_PATH_LENGTH`

  `private static final int`

  `SEPARATOR_LENGTH`

  `protected ArrayList<ServerSettings>`

  `settings`

  `protected ArrayList<String>`

  `suffixes`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ServerSettingsManager()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private boolean`

  `anyFilesExist(String name)`

  `String`

  `getNameInSettingsFolder(String name)`

  `ServerSettings`

  `getSettingsByIndex(int index)`

  `int`

  `getSettingsCount()`

  `String`

  `getSettingsFolder()`

  `ArrayList<String>`

  `getSuffixes()`

  `boolean`

  `isValidName(String name)`

  `boolean`

  `isValidNewName(String newName)`

  `void`

  `readAllSettings()`

  `boolean`

  `settingsFolderNameValidLength(String filename)`

  `boolean`

  `settingsFolderPathValidLength(String filename)`

  `boolean`

  `settingsFolderValidLengthChecks(String filename)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [ServerSettingsManager](ServerSettingsManager.html "class in zombie.network") instance
  + ### settings

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ServerSettings](ServerSettings.html "class in zombie.network")> settings
  + ### suffixes

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> suffixes
  + ### MAX\_FILENAME\_LENGTH

    private static final int MAX\_FILENAME\_LENGTH

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.ServerSettingsManager.MAX_FILENAME_LENGTH)
  + ### MAX\_PATH\_LENGTH

    private static final int MAX\_PATH\_LENGTH

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.ServerSettingsManager.MAX_PATH_LENGTH)
  + ### SEPARATOR\_LENGTH

    private static final int SEPARATOR\_LENGTH

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.network.ServerSettingsManager.SEPARATOR_LENGTH)
  + ### LONGEST\_SUFFIX\_LENGTH

    private static final int LONGEST\_SUFFIX\_LENGTH
* Constructor Details
  -------------------

  + ### ServerSettingsManager

    public ServerSettingsManager()
* Method Details
  --------------

  + ### getSettingsFolder

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSettingsFolder()
  + ### settingsFolderPathValidLength

    public boolean settingsFolderPathValidLength([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### settingsFolderNameValidLength

    public boolean settingsFolderNameValidLength([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### settingsFolderValidLengthChecks

    public boolean settingsFolderValidLengthChecks([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filename)
  + ### getNameInSettingsFolder

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNameInSettingsFolder([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### readAllSettings

    public void readAllSettings()
  + ### getSettingsCount

    public int getSettingsCount()
  + ### getSettingsByIndex

    public [ServerSettings](ServerSettings.html "class in zombie.network") getSettingsByIndex(int index)
  + ### isValidName

    public boolean isValidName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### anyFilesExist

    private boolean anyFilesExist([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### isValidNewName

    public boolean isValidNewName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newName)
  + ### getSuffixes

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getSuffixes()