[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.radio](package-summary.html)
2. [RadioData](RadioData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [PRINTDEBUG](#PRINTDEBUG)
   2. [isVanilla](#isVanilla)
   3. [guid](#guid)
   4. [version](#version)
   5. [xmlFilePath](#xmlFilePath)
   6. [radioChannels](#radioChannels)
   7. [translationDataList](#translationDataList)
   8. [currentTranslation](#currentTranslation)
   9. [rootNode](#rootNode)
   10. [advertQue](#advertQue)
   11. [fieldStart](#fieldStart)
   12. [fieldEnd](#fieldEnd)
   13. [regex](#regex)
   14. [pattern](#pattern)
6. [Constructor Details](#constructor-detail)
   1. [RadioData(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [getRadioChannels()](#getRadioChannels())
   2. [isVanilla()](#isVanilla())
   3. [getTranslatorNames(Language)](#getTranslatorNames(zombie.core.Language))
   4. [fetchRadioData(boolean)](#fetchRadioData(boolean))
   5. [fetchRadioData(boolean, boolean)](#fetchRadioData(boolean,boolean))
   6. [fetchAllRadioData()](#fetchAllRadioData())
   7. [searchForFiles(File, String, ArrayList)](#searchForFiles(java.io.File,java.lang.String,java.util.ArrayList))
   8. [ReadFile(String)](#ReadFile(java.lang.String))
   9. [print(String)](#print(java.lang.String))
   10. [getChildNodes(Node)](#getChildNodes(org.w3c.dom.Node))
   11. [toLowerLocaleSafe(String)](#toLowerLocaleSafe(java.lang.String))
   12. [nodeNameIs(Node, String)](#nodeNameIs(org.w3c.dom.Node,java.lang.String))
   13. [getAttrib(Node, String, boolean)](#getAttrib(org.w3c.dom.Node,java.lang.String,boolean))
   14. [getAttrib(Node, String)](#getAttrib(org.w3c.dom.Node,java.lang.String))
   15. [getAttrib(Node, String, boolean, boolean)](#getAttrib(org.w3c.dom.Node,java.lang.String,boolean,boolean))
   16. [loadRootInfo()](#loadRootInfo())
   17. [loadRadioScripts()](#loadRadioScripts())
   18. [loadAdverts(Node)](#loadAdverts(org.w3c.dom.Node))
   19. [loadChannels(Node)](#loadChannels(org.w3c.dom.Node))
   20. [loadScripts(Node, ArrayList, boolean)](#loadScripts(org.w3c.dom.Node,java.util.ArrayList,boolean))
   21. [loadBroadcast(Node, RadioScript)](#loadBroadcast(org.w3c.dom.Node,zombie.radio.scripting.RadioScript))
   22. [checkForTranslation(String, String)](#checkForTranslation(java.lang.String,java.lang.String))
   23. [loadExitOptions(Node, RadioScript)](#loadExitOptions(org.w3c.dom.Node,zombie.radio.scripting.RadioScript))
   24. [checkForCustomAirTimer(String, RadioLine)](#checkForCustomAirTimer(java.lang.String,zombie.radio.scripting.RadioLine))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RadioData
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.radio.RadioData

---

public final class RadioData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Map<String, RadioScript>`

  `advertQue`

  `private zombie.radio.RadioTranslationData`

  `currentTranslation`

  `private static final String`

  `fieldEnd`

  `private static final String`

  `fieldStart`

  `private String`

  `guid`

  `private boolean`

  `isVanilla`

  `private static final Pattern`

  `pattern`

  `private static final boolean`

  `PRINTDEBUG`

  `private final ArrayList<RadioChannel>`

  `radioChannels`

  `private static final String`

  `regex`

  `private Node`

  `rootNode`

  `private final ArrayList<zombie.radio.RadioTranslationData>`

  `translationDataList`

  `private int`

  `version`

  `private final String`

  `xmlFilePath`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RadioData(String xmlFile)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private String`

  `checkForCustomAirTimer(String line,
  RadioLine radioLine)`

  `private String`

  `checkForTranslation(String id,
  String text)`

  `static ArrayList<RadioData>`

  `fetchAllRadioData()`

  `private static ArrayList<RadioData>`

  `fetchRadioData(boolean loadMods)`

  `private static ArrayList<RadioData>`

  `fetchRadioData(boolean loadMods,
  boolean printStuff)`

  `private String`

  `getAttrib(Node node,
  String name)`

  `private String`

  `getAttrib(Node node,
  String name,
  boolean trim)`

  `private String`

  `getAttrib(Node node,
  String name,
  boolean trim,
  boolean tolower)`

  `private ArrayList<Node>`

  `getChildNodes(Node parent)`

  `ArrayList<RadioChannel>`

  `getRadioChannels()`

  `static ArrayList<String>`

  `getTranslatorNames(Language language)`

  `boolean`

  `isVanilla()`

  `private void`

  `loadAdverts(Node parent)`

  `private RadioBroadCast`

  `loadBroadcast(Node broadcast,
  RadioScript script)`

  `private void`

  `loadChannels(Node parent)`

  `private void`

  `loadExitOptions(Node exitOptions,
  RadioScript script)`

  `private boolean`

  `loadRadioScripts()`

  `private boolean`

  `loadRootInfo()`

  `private ArrayList<RadioScript>`

  `loadScripts(Node parent,
  ArrayList<RadioScript> scripts,
  boolean advertScript)`

  `private boolean`

  `nodeNameIs(Node node,
  String name)`

  `private void`

  `print(String line)`

  `private static RadioData`

  `ReadFile(String filePath)`

  `private static void`

  `searchForFiles(File path,
  String extension,
  ArrayList<String> files)`

  `private String`

  `toLowerLocaleSafe(String str)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### PRINTDEBUG

    private static final boolean PRINTDEBUG

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.radio.RadioData.PRINTDEBUG)
  + ### isVanilla

    private boolean isVanilla
  + ### guid

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") guid
  + ### version

    private int version
  + ### xmlFilePath

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xmlFilePath
  + ### radioChannels

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioChannel](scripting/RadioChannel.html "class in zombie.radio.scripting")> radioChannels
  + ### translationDataList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.radio.RadioTranslationData> translationDataList
  + ### currentTranslation

    private zombie.radio.RadioTranslationData currentTranslation
  + ### rootNode

    private [Node](https://docs.oracle.com/en/java/javase/25/docs/api/java.xml/org/w3c/dom/Node.html "class or interface in org.w3c.dom") rootNode
  + ### advertQue

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [RadioScript](scripting/RadioScript.html "class in zombie.radio.scripting")> advertQue
  + ### fieldStart

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fieldStart

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.radio.RadioData.fieldStart)
  + ### fieldEnd

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fieldEnd

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.radio.RadioData.fieldEnd)
  + ### regex

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") regex

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.radio.RadioData.regex)
  + ### pattern

    private static final [Pattern](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/regex/Pattern.html "class or interface in java.util.regex") pattern
* Constructor Details
  -------------------

  + ### RadioData

    public RadioData([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xmlFile)
* Method Details
  --------------

  + ### getRadioChannels

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioChannel](scripting/RadioChannel.html "class in zombie.radio.scripting")> getRadioChannels()
  + ### isVanilla

    public boolean isVanilla()
  + ### getTranslatorNames

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getTranslatorNames([Language](../core/Language.html "class in zombie.core") language)
  + ### fetchRadioData

    private static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioData](RadioData.html "class in zombie.radio")> fetchRadioData(boolean loadMods)
  + ### fetchRadioData

    private static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioData](RadioData.html "class in zombie.radio")> fetchRadioData(boolean loadMods,
    boolean printStuff)
  + ### fetchAllRadioData

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioData](RadioData.html "class in zombie.radio")> fetchAllRadioData()
  + ### searchForFiles

    private static void searchForFiles([File](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/File.html "class or interface in java.io") path,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") extension,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> files)
  + ### ReadFile

    private static [RadioData](RadioData.html "class in zombie.radio") ReadFile([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") filePath)
  + ### print

    private void print([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line)
  + ### getChildNodes

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Node](https://docs.oracle.com/en/java/javase/25/docs/api/java.xml/org/w3c/dom/Node.html "class or interface in org.w3c.dom")> getChildNodes([Node](https://docs.oracle.com/en/java/javase/25/docs/api/java.xml/org/w3c/dom/Node.html "class or interface in org.w3c.dom") parent)
  + ### toLowerLocaleSafe

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toLowerLocaleSafe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### nodeNameIs

    private boolean nodeNameIs([Node](https://docs.oracle.com/en/java/javase/25/docs/api/java.xml/org/w3c/dom/Node.html "class or interface in org.w3c.dom") node,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAttrib

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttrib([Node](https://docs.oracle.com/en/java/javase/25/docs/api/java.xml/org/w3c/dom/Node.html "class or interface in org.w3c.dom") node,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean trim)
  + ### getAttrib

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttrib([Node](https://docs.oracle.com/en/java/javase/25/docs/api/java.xml/org/w3c/dom/Node.html "class or interface in org.w3c.dom") node,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getAttrib

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttrib([Node](https://docs.oracle.com/en/java/javase/25/docs/api/java.xml/org/w3c/dom/Node.html "class or interface in org.w3c.dom") node,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean trim,
    boolean tolower)
  + ### loadRootInfo

    private boolean loadRootInfo()
  + ### loadRadioScripts

    private boolean loadRadioScripts()
  + ### loadAdverts

    private void loadAdverts([Node](https://docs.oracle.com/en/java/javase/25/docs/api/java.xml/org/w3c/dom/Node.html "class or interface in org.w3c.dom") parent)
  + ### loadChannels

    private void loadChannels([Node](https://docs.oracle.com/en/java/javase/25/docs/api/java.xml/org/w3c/dom/Node.html "class or interface in org.w3c.dom") parent)
  + ### loadScripts

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioScript](scripting/RadioScript.html "class in zombie.radio.scripting")> loadScripts([Node](https://docs.oracle.com/en/java/javase/25/docs/api/java.xml/org/w3c/dom/Node.html "class or interface in org.w3c.dom") parent,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RadioScript](scripting/RadioScript.html "class in zombie.radio.scripting")> scripts,
    boolean advertScript)
  + ### loadBroadcast

    private [RadioBroadCast](scripting/RadioBroadCast.html "class in zombie.radio.scripting") loadBroadcast([Node](https://docs.oracle.com/en/java/javase/25/docs/api/java.xml/org/w3c/dom/Node.html "class or interface in org.w3c.dom") broadcast,
    [RadioScript](scripting/RadioScript.html "class in zombie.radio.scripting") script)
  + ### checkForTranslation

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") checkForTranslation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### loadExitOptions

    private void loadExitOptions([Node](https://docs.oracle.com/en/java/javase/25/docs/api/java.xml/org/w3c/dom/Node.html "class or interface in org.w3c.dom") exitOptions,
    [RadioScript](scripting/RadioScript.html "class in zombie.radio.scripting") script)
  + ### checkForCustomAirTimer

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") checkForCustomAirTimer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") line,
    [RadioLine](scripting/RadioLine.html "class in zombie.radio.scripting") radioLine)