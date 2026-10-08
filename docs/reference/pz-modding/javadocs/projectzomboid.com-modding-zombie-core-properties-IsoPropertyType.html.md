[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.properties](package-summary.html)
2. [IsoPropertyType](IsoPropertyType.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Enum Constant Summary](#enum-constant-summary)
4. [Field Summary](#field-summary)
5. [Constructor Summary](#constructor-summary)
6. [Method Summary](#method-summary)
7. [Enum Constant Details](#enum-constant-detail)
   1. [ISO\_TYPE](#ISO_TYPE)
   2. [IS\_MOVE\_ABLE](#IS_MOVE_ABLE)
   3. [OPEN\_TILE\_OFFSET](#OPEN_TILE_OFFSET)
   4. [WINDOW\_LOCKED](#WINDOW_LOCKED)
   5. [SMASHED\_TILE\_OFFSET](#SMASHED_TILE_OFFSET)
   6. [GLASS\_REMOVED\_OFFSET](#GLASS_REMOVED_OFFSET)
   7. [GARAGE\_DOOR](#GARAGE_DOOR)
   8. [DOUBLE\_DOOR](#DOUBLE_DOOR)
   9. [ENERGY](#ENERGY)
   10. [LIGHT\_RADIUS](#LIGHT_RADIUS)
   11. [RED\_LIGHT](#RED_LIGHT)
   12. [GREEN\_LIGHT](#GREEN_LIGHT)
   13. [BLUE\_LIGHT](#BLUE_LIGHT)
   14. [CONNECT\_X](#CONNECT_X)
   15. [CONNECT\_Y](#CONNECT_Y)
   16. [CONTAINER](#CONTAINER)
   17. [CUSTOM\_NAME](#CUSTOM_NAME)
   18. [GROUP\_NAME](#GROUP_NAME)
   19. [CONTAINER\_CAPACITY](#CONTAINER_CAPACITY)
   20. [CONTAINER\_POSITION](#CONTAINER_POSITION)
   21. [FACING](#FACING)
   22. [FUEL\_AMOUNT](#FUEL_AMOUNT)
   23. [WATER\_AMOUNT](#WATER_AMOUNT)
   24. [MAXIMUM\_WATER\_AMOUNT](#MAXIMUM_WATER_AMOUNT)
   25. [PROPANE\_TANK](#PROPANE_TANK)
   26. [DAMAGED\_SPRITE](#DAMAGED_SPRITE)
   27. [CAN\_ATTACH\_ANIMAL](#CAN_ATTACH_ANIMAL)
   28. [CONTAINER\_CLOSE\_SOUND](#CONTAINER_CLOSE_SOUND)
   29. [CONTAINER\_OPEN\_SOUND](#CONTAINER_OPEN_SOUND)
   30. [CONTAINER\_PUT\_SOUND](#CONTAINER_PUT_SOUND)
   31. [CONTAINER\_TAKE\_SOUND](#CONTAINER_TAKE_SOUND)
   32. [IS\_FRIDGE](#IS_FRIDGE)
   33. [DOOR\_TRANS](#DOOR_TRANS)
   34. [STREETLIGHT](#STREETLIGHT)
   35. [FOOTSTEP\_MATERIAL](#FOOTSTEP_MATERIAL)
   36. [ENTITY\_SCRIPT\_NAME](#ENTITY_SCRIPT_NAME)
   37. [ATTACHED\_SE](#ATTACHED_SE)
   38. [WINDOW\_W](#WINDOW_W)
   39. [WINDOW\_FRAME\_W](#WINDOW_FRAME_W)
   40. [WINDOW\_N](#WINDOW_N)
   41. [WINDOW\_FRAME\_N](#WINDOW_FRAME_N)
   42. [IGNORE\_SURFACE\_SNAP](#IGNORE_SURFACE_SNAP)
   43. [HOPPABLE\_W](#HOPPABLE_W)
   44. [THUMP\_SOUND](#THUMP_SOUND)
   45. [DOOR\_SOUND](#DOOR_SOUND)
   46. [HOPPABLE\_N](#HOPPABLE_N)
   47. [TIE\_SHEET\_ROPE](#TIE_SHEET_ROPE)
   48. [IS\_PAINTABLE](#IS_PAINTABLE)
   49. [IS\_TABLE](#IS_TABLE)
   50. [FORCE\_SINGLE\_ITEM](#FORCE_SINGLE_ITEM)
   51. [BUSH](#BUSH)
   52. [ROOF\_WALL\_START](#ROOF_WALL_START)
   53. [SLOPED\_SURFACE\_HEIGHT\_MAX](#SLOPED_SURFACE_HEIGHT_MAX)
   54. [IS\_GRID\_EXTENSION\_TILE](#IS_GRID_EXTENSION_TILE)
   55. [SOLID](#SOLID)
   56. [TAINTED\_WATER](#TAINTED_WATER)
   57. [ATTACHED\_SURFACE](#ATTACHED_SURFACE)
   58. [IS\_TABLE\_TOP](#IS_TABLE_TOP)
   59. [ATTACHED\_W](#ATTACHED_W)
   60. [WHEELIE\_BIN](#WHEELIE_BIN)
   61. [WALL\_SE](#WALL_SE)
   62. [WEST\_ROOF\_M](#WEST_ROOF_M)
   63. [MICROWAVE](#MICROWAVE)
   64. [NO\_WALL\_LIGHTING](#NO_WALL_LIGHTING)
   65. [SURFACE](#SURFACE)
   66. [AMBIENT\_SOUND](#AMBIENT_SOUND)
   67. [ATTACHED\_E](#ATTACHED_E)
   68. [ITEM\_HEIGHT](#ITEM_HEIGHT)
   69. [NATURE\_FLOOR](#NATURE_FLOOR)
   70. [BLOCKS\_PLACEMENT](#BLOCKS_PLACEMENT)
   71. [GRIME\_TYPE](#GRIME_TYPE)
   72. [ATTACHED\_N](#ATTACHED_N)
   73. [ATTACHED\_CEILING](#ATTACHED_CEILING)
   74. [SCRAP\_USE\_TOOL](#SCRAP_USE_TOOL)
   75. [ATTACHED\_S](#ATTACHED_S)
   76. [E\_OFFSET](#E_OFFSET)
   77. [WEST\_ROOF\_T](#WEST_ROOF_T)
   78. [CUT\_N](#CUT_N)
   79. [CURTAIN\_W](#CURTAIN_W)
   80. [BED\_TYPE](#BED_TYPE)
   81. [CURTAIN\_S](#CURTAIN_S)
   82. [RENDER\_LAYER](#RENDER_LAYER)
   83. [FORCE\_RENDER](#FORCE_RENDER)
   84. [ATTACHED\_TO\_GLASS](#ATTACHED_TO_GLASS)
   85. [CORNER\_NORTH\_WALL](#CORNER_NORTH_WALL)
   86. [IS\_WATER\_COLLECTOR](#IS_WATER_COLLECTOR)
   87. [WEST\_ROOF\_B](#WEST_ROOF_B)
   88. [SLOPED\_SURFACE\_DIRECTION](#SLOPED_SURFACE_DIRECTION)
   89. [VEGETATION](#VEGETATION)
   90. [MINIMUM\_CAR\_SPEED\_DMG](#MINIMUM_CAR_SPEED_DMG)
   91. [CUT\_W](#CUT_W)
   92. [CORNER\_WEST\_WALL](#CORNER_WEST_WALL)
   93. [BED](#BED)
   94. [TV](#TV)
   95. [FREEZER\_POSITION](#FREEZER_POSITION)
   96. [STAIRS\_MW](#STAIRS_MW)
   97. [GENERATOR\_SOUND](#GENERATOR_SOUND)
   98. [MATERIAL\_TYPE](#MATERIAL_TYPE)
   99. [WALL\_OVERLAY](#WALL_OVERLAY)
   100. [CLIMB\_SHEET\_TOP\_E](#CLIMB_SHEET_TOP_E)
   101. [STAIRS\_MN](#STAIRS_MN)
   102. [SIGNAL](#SIGNAL)
   103. [ATTACHED\_NW](#ATTACHED_NW)
   104. [STACK\_REPLACE\_TILE\_OFFSET](#STACK_REPLACE_TILE_OFFSET)
   105. [CLIMB\_SHEET\_TOP\_S](#CLIMB_SHEET_TOP_S)
   106. [CUTAWAY\_HINT](#CUTAWAY_HINT)
   107. [CLIMB\_SHEET\_TOP\_W](#CLIMB_SHEET_TOP_W)
   108. [CLIMB\_SHEET\_TOP\_N](#CLIMB_SHEET_TOP_N)
   109. [CANT\_CLIMB](#CANT_CLIMB)
   110. [DOOR\_WALL\_W\_TRANS](#DOOR_WALL_W_TRANS)
   111. [WALL\_W\_TRANS](#WALL_W_TRANS)
   112. [DOOR\_WALL\_N](#DOOR_WALL_N)
   113. [STOP\_CAR](#STOP_CAR)
   114. [HAS\_LIGHT\_ON\_SPRITE](#HAS_LIGHT_ON_SPRITE)
   115. [DOOR\_WALL\_W](#DOOR_WALL_W)
   116. [SINK\_TYPE](#SINK_TYPE)
   117. [IS\_TRASH\_CAN](#IS_TRASH_CAN)
   118. [CUSTOM\_ITEM](#CUSTOM_ITEM)
   119. [MOVE\_WITH\_WIND](#MOVE_WITH_WIND)
   120. [FLOOR\_HEIGHT](#FLOOR_HEIGHT)
   121. [PICK\_UP\_TOOL](#PICK_UP_TOOL)
   122. [SOLID\_FLOOR](#SOLID_FLOOR)
   123. [TRANSPARENT\_FLOOR](#TRANSPARENT_FLOOR)
   124. [IS\_FLOOR\_ATTACHED](#IS_FLOOR_ATTACHED)
   125. [WALL\_NW](#WALL_NW)
   126. [BLOCK\_RAIN](#BLOCK_RAIN)
   127. [WIND\_TYPE](#WIND_TYPE)
   128. [FLOOR\_MATERIAL](#FLOOR_MATERIAL)
   129. [W\_OFFSET](#W_OFFSET)
   130. [FLOOR\_ATTACHMENT\_S](#FLOOR_ATTACHMENT_S)
   131. [CHAIR\_W](#CHAIR_W)
   132. [BURNT\_TILE](#BURNT_TILE)
   133. [MATERIAL](#MATERIAL)
   134. [FLOOR\_ATTACHMENT\_W](#FLOOR_ATTACHMENT_W)
   135. [CHAIR\_E](#CHAIR_E)
   136. [FASCIA\_EDGE](#FASCIA_EDGE)
   137. [CHAIR\_S](#CHAIR_S)
   138. [PHYSICS\_SHAPE](#PHYSICS_SHAPE)
   139. [CHAIR\_N](#CHAIR_N)
   140. [IS\_HIGH](#IS_HIGH)
   141. [TALL\_HOPPABLE\_N](#TALL_HOPPABLE_N)
   142. [INVISIBLE](#INVISIBLE)
   143. [FORCE\_FADE](#FORCE_FADE)
   144. [TALL\_HOPPABLE\_W](#TALL_HOPPABLE_W)
   145. [FLOOR\_ATTACHMENT\_E](#FLOOR_ATTACHMENT_E)
   146. [PHYSICS\_MESH](#PHYSICS_MESH)
   147. [IS\_STACKABLE](#IS_STACKABLE)
   148. [FLOOR\_ATTACHMENT\_N](#FLOOR_ATTACHMENT_N)
   149. [IS\_SURFACE\_OFFSET](#IS_SURFACE_OFFSET)
   150. [CAN\_BE\_REMOVED](#CAN_BE_REMOVED)
   151. [LIGHT\_SWITCH](#LIGHT_SWITCH)
   152. [SLOPED\_SURFACE\_HEIGHT\_MIN](#SLOPED_SURFACE_HEIGHT_MIN)
   153. [NO\_FREEZER](#NO_FREEZER)
   154. [PICK\_UP\_LEVEL](#PICK_UP_LEVEL)
   155. [SPEAR\_ONLY\_ATTACK\_THROUGH](#SPEAR_ONLY_ATTACK_THROUGH)
   156. [IS\_EAVE](#IS_EAVE)
   157. [FENCE\_TYPE\_HIGH](#FENCE_TYPE_HIGH)
   158. [DOOR\_WALL\_N\_TRANS](#DOOR_WALL_N_TRANS)
   159. [SEAT\_MATERIAL](#SEAT_MATERIAL)
   160. [N\_OFFSET](#N_OFFSET)
   161. [CURTAIN\_SOUND](#CURTAIN_SOUND)
   162. [PICK\_UP\_WEIGHT](#PICK_UP_WEIGHT)
   163. [WALL\_N](#WALL_N)
   164. [WALL\_W](#WALL_W)
   165. [PLACE\_TOOL](#PLACE_TOOL)
   166. [FENCE\_TYPE\_LOW](#FENCE_TYPE_LOW)
   167. [MOVEMENT](#MOVEMENT)
   168. [ROOF\_GROUP](#ROOF_GROUP)
   169. [MOVE\_TYPE](#MOVE_TYPE)
   170. [WALL\_TYPE](#WALL_TYPE)
   171. [DIAMOND\_FLOOR](#DIAMOND_FLOOR)
   172. [ALWAYS\_DRAW](#ALWAYS_DRAW)
   173. [S\_OFFSET](#S_OFFSET)
   174. [FORCE\_LOCKED](#FORCE_LOCKED)
   175. [COLLIDE\_N](#COLLIDE_N)
   176. [FORCE\_AMBIENT](#FORCE_AMBIENT)
   177. [INTERIOR\_SIDE](#INTERIOR_SIDE)
   178. [GENERIC\_CRAFTING\_SURFACE](#GENERIC_CRAFTING_SURFACE)
   179. [SOLID\_TRANS](#SOLID_TRANS)
   180. [WATER\_PIPED](#WATER_PIPED)
   181. [PAINTING\_TYPE](#PAINTING_TYPE)
   182. [COLLIDE\_W](#COLLIDE_W)
   183. [IS\_LOW](#IS_LOW)
   184. [CURTAIN\_E](#CURTAIN_E)
   185. [WALL\_N\_TRANS](#WALL_N_TRANS)
   186. [CAN\_BREAK](#CAN_BREAK)
   187. [CURTAIN\_N](#CURTAIN_N)
   188. [FREEZER](#FREEZER)
   189. [CAN\_SCRAP](#CAN_SCRAP)
   190. [TREE](#TREE)
   191. [DOUBLE\_DOOR\_1](#DOUBLE_DOOR_1)
   192. [WATER](#WATER)
   193. [IS\_MIRROR](#IS_MIRROR)
   194. [DOUBLE\_DOOR\_2](#DOUBLE_DOOR_2)
   195. [TILE\_OVERLAY](#TILE_OVERLAY)
   196. [STAIRS\_TW](#STAIRS_TW)
   197. [STAIRS\_TN](#STAIRS_TN)
   198. [FREEZER\_CAPACITY](#FREEZER_CAPACITY)
   199. [MATERIAL\_2](#MATERIAL_2)
   200. [FLOOR\_OVERLAY](#FLOOR_OVERLAY)
   201. [HIT\_BY\_CAR](#HIT_BY_CAR)
   202. [EXTERIOR](#EXTERIOR)
   203. [MATERIAL\_3](#MATERIAL_3)
   204. [FIRE\_REQUIREMENT](#FIRE_REQUIREMENT)
   205. [SCRAP\_USE\_SKILL](#SCRAP_USE_SKILL)
   206. [IS\_CLOSED\_STATE](#IS_CLOSED_STATE)
   207. [SPRITE\_GRID\_POS](#SPRITE_GRID_POS)
   208. [DOOR\_N](#DOOR_N)
   209. [NEVER\_CUTAWAY](#NEVER_CUTAWAY)
   210. [CLIMB\_SHEET\_E](#CLIMB_SHEET_E)
   211. [DOOR\_FR\_W](#DOOR_FR_W)
   212. [ATTACHED\_FLOOR](#ATTACHED_FLOOR)
   213. [CAN\_BE\_CUT](#CAN_BE_CUT)
   214. [WALL\_OBJECT\_ALLOW\_DOORFRAME](#WALL_OBJECT_ALLOW_DOORFRAME)
   215. [DOOR\_W](#DOOR_W)
   216. [DOOR\_FR\_N](#DOOR_FR_N)
   217. [CLIMB\_SHEET\_W](#CLIMB_SHEET_W)
   218. [STAIRS\_BW](#STAIRS_BW)
   219. [CLIMB\_SHEET\_S](#CLIMB_SHEET_S)
   220. [CLIMB\_SHEET\_N](#CLIMB_SHEET_N)
   221. [LIVING\_ROOM](#LIVING_ROOM)
   222. [STAIRS\_BN](#STAIRS_BN)
   223. [TREAT\_AS\_WALL\_ORDER](#TREAT_AS_WALL_ORDER)
   224. [WALL\_NW\_TRANS](#WALL_NW_TRANS)
   225. [CLOSE\_SNEAK\_BONUS](#CLOSE_SNEAK_BONUS)
   226. [SCRAP\_SIZE](#SCRAP_SIZE)
   227. [GRASS\_FLOOR](#GRASS_FLOOR)
   228. [SNOW\_TILE](#SNOW_TILE)
   229. [WALL](#WALL)
   230. [MAKE\_WINDOW\_INVINCIBLE](#MAKE_WINDOW_INVINCIBLE)
   231. [COUNTERTOP](#COUNTERTOP)
   232. [COUNTERTOP\_ATTACH](#COUNTERTOP_ATTACH)
   233. [FITS\_BENEATH\_COUNTERTOP](#FITS_BENEATH_COUNTERTOP)
8. [Field Details](#field-detail)
   1. [BY\_NAME](#BY_NAME)
   2. [name](#name)
9. [Constructor Details](#constructor-detail)
   1. [IsoPropertyType(String)](#%3Cinit%3E(java.lang.String))
10. [Method Details](#method-detail)
    1. [values()](#values())
    2. [valueOf(String)](#valueOf(java.lang.String))
    3. [getName()](#getName())
    4. [isProperty(String)](#isProperty(java.lang.String))
    5. [toString()](#toString())
    6. [lookup(String)](#lookup(java.lang.String))
    7. [lookupOrDefaultStr(String)](#lookupOrDefaultStr(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Enum Class IsoPropertyType
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[java.lang.Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties")>

zombie.core.properties.IsoPropertyType

All Implemented Interfaces:
:   `Serializable, Comparable<IsoPropertyType>, Constable`

---

public enum IsoPropertyType
extends [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html "class or interface in java.lang")<[IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties")>

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `IsoPropertyType.IsoPropertyTypeNotFoundException`

  ### Nested classes/interfaces inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#nested-class-summary "class or interface in java.lang")

  `Enum.EnumDesc<E>`
* Enum Constant Summary
  ---------------------

  Enum Constants

  Enum Constant

  Description

  `ALWAYS_DRAW`

  `AMBIENT_SOUND`

  `ATTACHED_CEILING`

  `ATTACHED_E`

  `ATTACHED_FLOOR`

  `ATTACHED_N`

  `ATTACHED_NW`

  `ATTACHED_S`

  `ATTACHED_SE`

  `ATTACHED_SURFACE`

  `ATTACHED_TO_GLASS`

  `ATTACHED_W`

  `BED`

  `BED_TYPE`

  `BLOCK_RAIN`

  `BLOCKS_PLACEMENT`

  `BLUE_LIGHT`

  `BURNT_TILE`

  `BUSH`

  `CAN_ATTACH_ANIMAL`

  `CAN_BE_CUT`

  `CAN_BE_REMOVED`

  `CAN_BREAK`

  `CAN_SCRAP`

  `CANT_CLIMB`

  `CHAIR_E`

  `CHAIR_N`

  `CHAIR_S`

  `CHAIR_W`

  `CLIMB_SHEET_E`

  `CLIMB_SHEET_N`

  `CLIMB_SHEET_S`

  `CLIMB_SHEET_TOP_E`

  `CLIMB_SHEET_TOP_N`

  `CLIMB_SHEET_TOP_S`

  `CLIMB_SHEET_TOP_W`

  `CLIMB_SHEET_W`

  `CLOSE_SNEAK_BONUS`

  `COLLIDE_N`

  `COLLIDE_W`

  `CONNECT_X`

  `CONNECT_Y`

  `CONTAINER`

  `CONTAINER_CAPACITY`

  `CONTAINER_CLOSE_SOUND`

  `CONTAINER_OPEN_SOUND`

  `CONTAINER_POSITION`

  `CONTAINER_PUT_SOUND`

  `CONTAINER_TAKE_SOUND`

  `CORNER_NORTH_WALL`

  `CORNER_WEST_WALL`

  `COUNTERTOP`

  `COUNTERTOP_ATTACH`

  `CURTAIN_E`

  `CURTAIN_N`

  `CURTAIN_S`

  `CURTAIN_SOUND`

  `CURTAIN_W`

  `CUSTOM_ITEM`

  `CUSTOM_NAME`

  `CUT_N`

  `CUT_W`

  `CUTAWAY_HINT`

  `DAMAGED_SPRITE`

  `DIAMOND_FLOOR`

  `DOOR_FR_N`

  `DOOR_FR_W`

  `DOOR_N`

  `DOOR_SOUND`

  `DOOR_TRANS`

  `DOOR_W`

  `DOOR_WALL_N`

  `DOOR_WALL_N_TRANS`

  `DOOR_WALL_W`

  `DOOR_WALL_W_TRANS`

  `DOUBLE_DOOR`

  `DOUBLE_DOOR_1`

  `DOUBLE_DOOR_2`

  `E_OFFSET`

  `ENERGY`

  `ENTITY_SCRIPT_NAME`

  `EXTERIOR`

  `FACING`

  `FASCIA_EDGE`

  `FENCE_TYPE_HIGH`

  `FENCE_TYPE_LOW`

  `FIRE_REQUIREMENT`

  `FITS_BENEATH_COUNTERTOP`

  `FLOOR_ATTACHMENT_E`

  `FLOOR_ATTACHMENT_N`

  `FLOOR_ATTACHMENT_S`

  `FLOOR_ATTACHMENT_W`

  `FLOOR_HEIGHT`

  `FLOOR_MATERIAL`

  `FLOOR_OVERLAY`

  `FOOTSTEP_MATERIAL`

  `FORCE_AMBIENT`

  `FORCE_FADE`

  `FORCE_LOCKED`

  `FORCE_RENDER`

  `FORCE_SINGLE_ITEM`

  `FREEZER`

  `FREEZER_CAPACITY`

  `FREEZER_POSITION`

  `FUEL_AMOUNT`

  `GARAGE_DOOR`

  `GENERATOR_SOUND`

  `GENERIC_CRAFTING_SURFACE`

  `GLASS_REMOVED_OFFSET`

  `GRASS_FLOOR`

  `GREEN_LIGHT`

  `GRIME_TYPE`

  `GROUP_NAME`

  `HAS_LIGHT_ON_SPRITE`

  `HIT_BY_CAR`

  `HOPPABLE_N`

  `HOPPABLE_W`

  `IGNORE_SURFACE_SNAP`

  `INTERIOR_SIDE`

  `INVISIBLE`

  `IS_CLOSED_STATE`

  `IS_EAVE`

  `IS_FLOOR_ATTACHED`

  `IS_FRIDGE`

  `IS_GRID_EXTENSION_TILE`

  `IS_HIGH`

  `IS_LOW`

  `IS_MIRROR`

  `IS_MOVE_ABLE`

  `IS_PAINTABLE`

  `IS_STACKABLE`

  `IS_SURFACE_OFFSET`

  `IS_TABLE`

  `IS_TABLE_TOP`

  `IS_TRASH_CAN`

  `IS_WATER_COLLECTOR`

  `ISO_TYPE`

  `ITEM_HEIGHT`

  `LIGHT_RADIUS`

  `LIGHT_SWITCH`

  `LIVING_ROOM`

  `MAKE_WINDOW_INVINCIBLE`

  `MATERIAL`

  `MATERIAL_2`

  `MATERIAL_3`

  `MATERIAL_TYPE`

  `MAXIMUM_WATER_AMOUNT`

  `MICROWAVE`

  `MINIMUM_CAR_SPEED_DMG`

  `MOVE_TYPE`

  `MOVE_WITH_WIND`

  `MOVEMENT`

  `N_OFFSET`

  `NATURE_FLOOR`

  `NEVER_CUTAWAY`

  `NO_FREEZER`

  `NO_WALL_LIGHTING`

  `OPEN_TILE_OFFSET`

  `PAINTING_TYPE`

  `PHYSICS_MESH`

  `PHYSICS_SHAPE`

  `PICK_UP_LEVEL`

  `PICK_UP_TOOL`

  `PICK_UP_WEIGHT`

  `PLACE_TOOL`

  `PROPANE_TANK`

  `RED_LIGHT`

  `RENDER_LAYER`

  `ROOF_GROUP`

  `ROOF_WALL_START`

  `S_OFFSET`

  `SCRAP_SIZE`

  `SCRAP_USE_SKILL`

  `SCRAP_USE_TOOL`

  `SEAT_MATERIAL`

  `SIGNAL`

  `SINK_TYPE`

  `SLOPED_SURFACE_DIRECTION`

  `SLOPED_SURFACE_HEIGHT_MAX`

  `SLOPED_SURFACE_HEIGHT_MIN`

  `SMASHED_TILE_OFFSET`

  `SNOW_TILE`

  `SOLID`

  `SOLID_FLOOR`

  `SOLID_TRANS`

  `SPEAR_ONLY_ATTACK_THROUGH`

  `SPRITE_GRID_POS`

  `STACK_REPLACE_TILE_OFFSET`

  `STAIRS_BN`

  `STAIRS_BW`

  `STAIRS_MN`

  `STAIRS_MW`

  `STAIRS_TN`

  `STAIRS_TW`

  `STOP_CAR`

  `STREETLIGHT`

  `SURFACE`

  `TAINTED_WATER`

  `TALL_HOPPABLE_N`

  `TALL_HOPPABLE_W`

  `THUMP_SOUND`

  `TIE_SHEET_ROPE`

  `TILE_OVERLAY`

  `TRANSPARENT_FLOOR`

  `TREAT_AS_WALL_ORDER`

  `TREE`

  `TV`

  `VEGETATION`

  `W_OFFSET`

  `WALL`

  `WALL_N`

  `WALL_N_TRANS`

  `WALL_NW`

  `WALL_NW_TRANS`

  `WALL_OBJECT_ALLOW_DOORFRAME`

  `WALL_OVERLAY`

  `WALL_SE`

  `WALL_TYPE`

  `WALL_W`

  `WALL_W_TRANS`

  `WATER`

  `WATER_AMOUNT`

  `WATER_PIPED`

  `WEST_ROOF_B`

  `WEST_ROOF_M`

  `WEST_ROOF_T`

  `WHEELIE_BIN`

  `WIND_TYPE`

  `WINDOW_FRAME_N`

  `WINDOW_FRAME_W`

  `WINDOW_LOCKED`

  `WINDOW_N`

  `WINDOW_W`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final Map<String, IsoPropertyType>`

  `BY_NAME`

  `private final String`

  `name`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `IsoPropertyType(String name)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getName()`

  `boolean`

  `isProperty(String inPropertyName)`

  `static IsoPropertyType`

  `lookup(String name)`

  `static String`

  `lookupOrDefaultStr(String name)`

  `String`

  `toString()`

  `static IsoPropertyType`

  `valueOf(String name)`

  Returns the enum constant of this class with the specified name.

  `static IsoPropertyType[]`

  `values()`

  Returns an array containing the constants of this enum class, in
  the order they are declared.

  ### Methods inherited from class [Enum](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Enum.html#method-summary "class or interface in java.lang")

  `clone, compareTo, describeConstable, equals, finalize, getDeclaringClass, hashCode, name, ordinal, valueOf`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `getClass, notify, notifyAll, wait, wait, wait`

* Enum Constant Details
  ---------------------

  + ### ISO\_TYPE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ISO\_TYPE
  + ### IS\_MOVE\_ABLE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_MOVE\_ABLE
  + ### OPEN\_TILE\_OFFSET

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") OPEN\_TILE\_OFFSET
  + ### WINDOW\_LOCKED

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WINDOW\_LOCKED
  + ### SMASHED\_TILE\_OFFSET

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SMASHED\_TILE\_OFFSET
  + ### GLASS\_REMOVED\_OFFSET

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") GLASS\_REMOVED\_OFFSET
  + ### GARAGE\_DOOR

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") GARAGE\_DOOR
  + ### DOUBLE\_DOOR

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DOUBLE\_DOOR
  + ### ENERGY

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ENERGY
  + ### LIGHT\_RADIUS

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") LIGHT\_RADIUS
  + ### RED\_LIGHT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") RED\_LIGHT
  + ### GREEN\_LIGHT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") GREEN\_LIGHT
  + ### BLUE\_LIGHT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") BLUE\_LIGHT
  + ### CONNECT\_X

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CONNECT\_X
  + ### CONNECT\_Y

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CONNECT\_Y
  + ### CONTAINER

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CONTAINER
  + ### CUSTOM\_NAME

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CUSTOM\_NAME
  + ### GROUP\_NAME

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") GROUP\_NAME
  + ### CONTAINER\_CAPACITY

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CONTAINER\_CAPACITY
  + ### CONTAINER\_POSITION

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CONTAINER\_POSITION
  + ### FACING

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FACING
  + ### FUEL\_AMOUNT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FUEL\_AMOUNT
  + ### WATER\_AMOUNT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WATER\_AMOUNT
  + ### MAXIMUM\_WATER\_AMOUNT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") MAXIMUM\_WATER\_AMOUNT
  + ### PROPANE\_TANK

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") PROPANE\_TANK
  + ### DAMAGED\_SPRITE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DAMAGED\_SPRITE
  + ### CAN\_ATTACH\_ANIMAL

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CAN\_ATTACH\_ANIMAL
  + ### CONTAINER\_CLOSE\_SOUND

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CONTAINER\_CLOSE\_SOUND
  + ### CONTAINER\_OPEN\_SOUND

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CONTAINER\_OPEN\_SOUND
  + ### CONTAINER\_PUT\_SOUND

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CONTAINER\_PUT\_SOUND
  + ### CONTAINER\_TAKE\_SOUND

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CONTAINER\_TAKE\_SOUND
  + ### IS\_FRIDGE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_FRIDGE
  + ### DOOR\_TRANS

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DOOR\_TRANS
  + ### STREETLIGHT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") STREETLIGHT
  + ### FOOTSTEP\_MATERIAL

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FOOTSTEP\_MATERIAL
  + ### ENTITY\_SCRIPT\_NAME

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ENTITY\_SCRIPT\_NAME
  + ### ATTACHED\_SE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ATTACHED\_SE
  + ### WINDOW\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WINDOW\_W
  + ### WINDOW\_FRAME\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WINDOW\_FRAME\_W
  + ### WINDOW\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WINDOW\_N
  + ### WINDOW\_FRAME\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WINDOW\_FRAME\_N
  + ### IGNORE\_SURFACE\_SNAP

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IGNORE\_SURFACE\_SNAP
  + ### HOPPABLE\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") HOPPABLE\_W
  + ### THUMP\_SOUND

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") THUMP\_SOUND
  + ### DOOR\_SOUND

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DOOR\_SOUND
  + ### HOPPABLE\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") HOPPABLE\_N
  + ### TIE\_SHEET\_ROPE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") TIE\_SHEET\_ROPE
  + ### IS\_PAINTABLE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_PAINTABLE
  + ### IS\_TABLE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_TABLE
  + ### FORCE\_SINGLE\_ITEM

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FORCE\_SINGLE\_ITEM
  + ### BUSH

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") BUSH
  + ### ROOF\_WALL\_START

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ROOF\_WALL\_START
  + ### SLOPED\_SURFACE\_HEIGHT\_MAX

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SLOPED\_SURFACE\_HEIGHT\_MAX
  + ### IS\_GRID\_EXTENSION\_TILE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_GRID\_EXTENSION\_TILE
  + ### SOLID

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SOLID
  + ### TAINTED\_WATER

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") TAINTED\_WATER
  + ### ATTACHED\_SURFACE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ATTACHED\_SURFACE
  + ### IS\_TABLE\_TOP

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_TABLE\_TOP
  + ### ATTACHED\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ATTACHED\_W
  + ### WHEELIE\_BIN

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WHEELIE\_BIN
  + ### WALL\_SE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WALL\_SE
  + ### WEST\_ROOF\_M

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WEST\_ROOF\_M
  + ### MICROWAVE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") MICROWAVE
  + ### NO\_WALL\_LIGHTING

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") NO\_WALL\_LIGHTING
  + ### SURFACE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SURFACE
  + ### AMBIENT\_SOUND

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") AMBIENT\_SOUND
  + ### ATTACHED\_E

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ATTACHED\_E
  + ### ITEM\_HEIGHT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ITEM\_HEIGHT
  + ### NATURE\_FLOOR

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") NATURE\_FLOOR
  + ### BLOCKS\_PLACEMENT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") BLOCKS\_PLACEMENT
  + ### GRIME\_TYPE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") GRIME\_TYPE
  + ### ATTACHED\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ATTACHED\_N
  + ### ATTACHED\_CEILING

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ATTACHED\_CEILING
  + ### SCRAP\_USE\_TOOL

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SCRAP\_USE\_TOOL
  + ### ATTACHED\_S

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ATTACHED\_S
  + ### E\_OFFSET

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") E\_OFFSET
  + ### WEST\_ROOF\_T

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WEST\_ROOF\_T
  + ### CUT\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CUT\_N
  + ### CURTAIN\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CURTAIN\_W
  + ### BED\_TYPE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") BED\_TYPE
  + ### CURTAIN\_S

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CURTAIN\_S
  + ### RENDER\_LAYER

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") RENDER\_LAYER
  + ### FORCE\_RENDER

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FORCE\_RENDER
  + ### ATTACHED\_TO\_GLASS

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ATTACHED\_TO\_GLASS
  + ### CORNER\_NORTH\_WALL

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CORNER\_NORTH\_WALL
  + ### IS\_WATER\_COLLECTOR

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_WATER\_COLLECTOR
  + ### WEST\_ROOF\_B

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WEST\_ROOF\_B
  + ### SLOPED\_SURFACE\_DIRECTION

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SLOPED\_SURFACE\_DIRECTION
  + ### VEGETATION

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") VEGETATION
  + ### MINIMUM\_CAR\_SPEED\_DMG

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") MINIMUM\_CAR\_SPEED\_DMG
  + ### CUT\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CUT\_W
  + ### CORNER\_WEST\_WALL

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CORNER\_WEST\_WALL
  + ### BED

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") BED
  + ### TV

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") TV
  + ### FREEZER\_POSITION

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FREEZER\_POSITION
  + ### STAIRS\_MW

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") STAIRS\_MW
  + ### GENERATOR\_SOUND

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") GENERATOR\_SOUND
  + ### MATERIAL\_TYPE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") MATERIAL\_TYPE
  + ### WALL\_OVERLAY

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WALL\_OVERLAY
  + ### CLIMB\_SHEET\_TOP\_E

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CLIMB\_SHEET\_TOP\_E
  + ### STAIRS\_MN

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") STAIRS\_MN
  + ### SIGNAL

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SIGNAL
  + ### ATTACHED\_NW

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ATTACHED\_NW
  + ### STACK\_REPLACE\_TILE\_OFFSET

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") STACK\_REPLACE\_TILE\_OFFSET
  + ### CLIMB\_SHEET\_TOP\_S

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CLIMB\_SHEET\_TOP\_S
  + ### CUTAWAY\_HINT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CUTAWAY\_HINT
  + ### CLIMB\_SHEET\_TOP\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CLIMB\_SHEET\_TOP\_W
  + ### CLIMB\_SHEET\_TOP\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CLIMB\_SHEET\_TOP\_N
  + ### CANT\_CLIMB

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CANT\_CLIMB
  + ### DOOR\_WALL\_W\_TRANS

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DOOR\_WALL\_W\_TRANS
  + ### WALL\_W\_TRANS

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WALL\_W\_TRANS
  + ### DOOR\_WALL\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DOOR\_WALL\_N
  + ### STOP\_CAR

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") STOP\_CAR
  + ### HAS\_LIGHT\_ON\_SPRITE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") HAS\_LIGHT\_ON\_SPRITE
  + ### DOOR\_WALL\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DOOR\_WALL\_W
  + ### SINK\_TYPE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SINK\_TYPE
  + ### IS\_TRASH\_CAN

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_TRASH\_CAN
  + ### CUSTOM\_ITEM

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CUSTOM\_ITEM
  + ### MOVE\_WITH\_WIND

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") MOVE\_WITH\_WIND
  + ### FLOOR\_HEIGHT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FLOOR\_HEIGHT
  + ### PICK\_UP\_TOOL

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") PICK\_UP\_TOOL
  + ### SOLID\_FLOOR

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SOLID\_FLOOR
  + ### TRANSPARENT\_FLOOR

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") TRANSPARENT\_FLOOR
  + ### IS\_FLOOR\_ATTACHED

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_FLOOR\_ATTACHED
  + ### WALL\_NW

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WALL\_NW
  + ### BLOCK\_RAIN

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") BLOCK\_RAIN
  + ### WIND\_TYPE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WIND\_TYPE
  + ### FLOOR\_MATERIAL

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FLOOR\_MATERIAL
  + ### W\_OFFSET

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") W\_OFFSET
  + ### FLOOR\_ATTACHMENT\_S

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FLOOR\_ATTACHMENT\_S
  + ### CHAIR\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CHAIR\_W
  + ### BURNT\_TILE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") BURNT\_TILE
  + ### MATERIAL

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") MATERIAL
  + ### FLOOR\_ATTACHMENT\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FLOOR\_ATTACHMENT\_W
  + ### CHAIR\_E

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CHAIR\_E
  + ### FASCIA\_EDGE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FASCIA\_EDGE
  + ### CHAIR\_S

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CHAIR\_S
  + ### PHYSICS\_SHAPE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") PHYSICS\_SHAPE
  + ### CHAIR\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CHAIR\_N
  + ### IS\_HIGH

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_HIGH
  + ### TALL\_HOPPABLE\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") TALL\_HOPPABLE\_N
  + ### INVISIBLE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") INVISIBLE
  + ### FORCE\_FADE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FORCE\_FADE
  + ### TALL\_HOPPABLE\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") TALL\_HOPPABLE\_W
  + ### FLOOR\_ATTACHMENT\_E

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FLOOR\_ATTACHMENT\_E
  + ### PHYSICS\_MESH

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") PHYSICS\_MESH
  + ### IS\_STACKABLE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_STACKABLE
  + ### FLOOR\_ATTACHMENT\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FLOOR\_ATTACHMENT\_N
  + ### IS\_SURFACE\_OFFSET

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_SURFACE\_OFFSET
  + ### CAN\_BE\_REMOVED

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CAN\_BE\_REMOVED
  + ### LIGHT\_SWITCH

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") LIGHT\_SWITCH
  + ### SLOPED\_SURFACE\_HEIGHT\_MIN

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SLOPED\_SURFACE\_HEIGHT\_MIN
  + ### NO\_FREEZER

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") NO\_FREEZER
  + ### PICK\_UP\_LEVEL

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") PICK\_UP\_LEVEL
  + ### SPEAR\_ONLY\_ATTACK\_THROUGH

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SPEAR\_ONLY\_ATTACK\_THROUGH
  + ### IS\_EAVE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_EAVE
  + ### FENCE\_TYPE\_HIGH

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FENCE\_TYPE\_HIGH
  + ### DOOR\_WALL\_N\_TRANS

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DOOR\_WALL\_N\_TRANS
  + ### SEAT\_MATERIAL

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SEAT\_MATERIAL
  + ### N\_OFFSET

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") N\_OFFSET
  + ### CURTAIN\_SOUND

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CURTAIN\_SOUND
  + ### PICK\_UP\_WEIGHT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") PICK\_UP\_WEIGHT
  + ### WALL\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WALL\_N
  + ### WALL\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WALL\_W
  + ### PLACE\_TOOL

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") PLACE\_TOOL
  + ### FENCE\_TYPE\_LOW

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FENCE\_TYPE\_LOW
  + ### MOVEMENT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") MOVEMENT
  + ### ROOF\_GROUP

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ROOF\_GROUP
  + ### MOVE\_TYPE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") MOVE\_TYPE
  + ### WALL\_TYPE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WALL\_TYPE
  + ### DIAMOND\_FLOOR

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DIAMOND\_FLOOR
  + ### ALWAYS\_DRAW

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ALWAYS\_DRAW
  + ### S\_OFFSET

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") S\_OFFSET
  + ### FORCE\_LOCKED

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FORCE\_LOCKED
  + ### COLLIDE\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") COLLIDE\_N
  + ### FORCE\_AMBIENT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FORCE\_AMBIENT
  + ### INTERIOR\_SIDE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") INTERIOR\_SIDE
  + ### GENERIC\_CRAFTING\_SURFACE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") GENERIC\_CRAFTING\_SURFACE
  + ### SOLID\_TRANS

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SOLID\_TRANS
  + ### WATER\_PIPED

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WATER\_PIPED
  + ### PAINTING\_TYPE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") PAINTING\_TYPE
  + ### COLLIDE\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") COLLIDE\_W
  + ### IS\_LOW

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_LOW
  + ### CURTAIN\_E

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CURTAIN\_E
  + ### WALL\_N\_TRANS

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WALL\_N\_TRANS
  + ### CAN\_BREAK

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CAN\_BREAK
  + ### CURTAIN\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CURTAIN\_N
  + ### FREEZER

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FREEZER
  + ### CAN\_SCRAP

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CAN\_SCRAP
  + ### TREE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") TREE
  + ### DOUBLE\_DOOR\_1

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DOUBLE\_DOOR\_1
  + ### WATER

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WATER
  + ### IS\_MIRROR

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_MIRROR
  + ### DOUBLE\_DOOR\_2

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DOUBLE\_DOOR\_2
  + ### TILE\_OVERLAY

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") TILE\_OVERLAY
  + ### STAIRS\_TW

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") STAIRS\_TW
  + ### STAIRS\_TN

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") STAIRS\_TN
  + ### FREEZER\_CAPACITY

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FREEZER\_CAPACITY
  + ### MATERIAL\_2

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") MATERIAL\_2
  + ### FLOOR\_OVERLAY

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FLOOR\_OVERLAY
  + ### HIT\_BY\_CAR

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") HIT\_BY\_CAR
  + ### EXTERIOR

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") EXTERIOR
  + ### MATERIAL\_3

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") MATERIAL\_3
  + ### FIRE\_REQUIREMENT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FIRE\_REQUIREMENT
  + ### SCRAP\_USE\_SKILL

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SCRAP\_USE\_SKILL
  + ### IS\_CLOSED\_STATE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") IS\_CLOSED\_STATE
  + ### SPRITE\_GRID\_POS

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SPRITE\_GRID\_POS
  + ### DOOR\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DOOR\_N
  + ### NEVER\_CUTAWAY

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") NEVER\_CUTAWAY
  + ### CLIMB\_SHEET\_E

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CLIMB\_SHEET\_E
  + ### DOOR\_FR\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DOOR\_FR\_W
  + ### ATTACHED\_FLOOR

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") ATTACHED\_FLOOR
  + ### CAN\_BE\_CUT

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CAN\_BE\_CUT
  + ### WALL\_OBJECT\_ALLOW\_DOORFRAME

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WALL\_OBJECT\_ALLOW\_DOORFRAME
  + ### DOOR\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DOOR\_W
  + ### DOOR\_FR\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") DOOR\_FR\_N
  + ### CLIMB\_SHEET\_W

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CLIMB\_SHEET\_W
  + ### STAIRS\_BW

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") STAIRS\_BW
  + ### CLIMB\_SHEET\_S

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CLIMB\_SHEET\_S
  + ### CLIMB\_SHEET\_N

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CLIMB\_SHEET\_N
  + ### LIVING\_ROOM

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") LIVING\_ROOM
  + ### STAIRS\_BN

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") STAIRS\_BN
  + ### TREAT\_AS\_WALL\_ORDER

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") TREAT\_AS\_WALL\_ORDER
  + ### WALL\_NW\_TRANS

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WALL\_NW\_TRANS
  + ### CLOSE\_SNEAK\_BONUS

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") CLOSE\_SNEAK\_BONUS
  + ### SCRAP\_SIZE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SCRAP\_SIZE
  + ### GRASS\_FLOOR

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") GRASS\_FLOOR
  + ### SNOW\_TILE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") SNOW\_TILE
  + ### WALL

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") WALL
  + ### MAKE\_WINDOW\_INVINCIBLE

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") MAKE\_WINDOW\_INVINCIBLE
  + ### COUNTERTOP

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") COUNTERTOP
  + ### COUNTERTOP\_ATTACH

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") COUNTERTOP\_ATTACH
  + ### FITS\_BENEATH\_COUNTERTOP

    public static final [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") FITS\_BENEATH\_COUNTERTOP
* Field Details
  -------------

  + ### BY\_NAME

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties")> BY\_NAME
  + ### name

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
* Constructor Details
  -------------------

  + ### IsoPropertyType

    private IsoPropertyType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### values

    public static [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties")[] values()

    Returns an array containing the constants of this enum class, in
    the order they are declared.

    Returns:
    :   an array containing the constants of this enum class, in the order they are declared
  + ### valueOf

    public static [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") valueOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)

    Returns the enum constant of this class with the specified name.
    The string must match *exactly* an identifier used to declare an
    enum constant in this class. (Extraneous whitespace characters are
    not permitted.)

    Parameters:
    :   `name` - the name of the enum constant to be returned.

    Returns:
    :   the enum constant with the specified name

    Throws:
    :   `IllegalArgumentException` - if this enum class has no constant with the specified name
    :   `NullPointerException` - if the argument is null
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### isProperty

    public boolean isProperty([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") inPropertyName)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Enum<IsoPropertyType>`
  + ### lookup

    public static [IsoPropertyType](IsoPropertyType.html "enum class in zombie.core.properties") lookup([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### lookupOrDefaultStr

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") lookupOrDefaultStr([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)