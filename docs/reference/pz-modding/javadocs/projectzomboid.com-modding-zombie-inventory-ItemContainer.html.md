[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.inventory](package-summary.html)
2. [ItemContainer](ItemContainer.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [tempList](#tempList)
   2. [s\_tempObjects](#s_tempObjects)
   3. [active](#active)
   4. [dirty](#dirty)
   5. [isdevice](#isdevice)
   6. [ageFactor](#ageFactor)
   7. [cookingFactor](#cookingFactor)
   8. [capacity](#capacity)
   9. [containingItem](#containingItem)
   10. [items](#items)
   11. [includingObsoleteItems](#includingObsoleteItems)
   12. [parent](#parent)
   13. [sourceGrid](#sourceGrid)
   14. [vehiclePart](#vehiclePart)
   15. [inventoryContainer](#inventoryContainer)
   16. [explored](#explored)
   17. [type](#type)
   18. [id](#id)
   19. [drawDirty](#drawDirty)
   20. [customTemperature](#customTemperature)
   21. [hasBeenLooted](#hasBeenLooted)
   22. [openSound](#openSound)
   23. [closeSound](#closeSound)
   24. [putSound](#putSound)
   25. [takeSound](#takeSound)
   26. [onlyAcceptCategory](#onlyAcceptCategory)
   27. [acceptItemFunction](#acceptItemFunction)
   28. [weightReduction](#weightReduction)
   29. [containerPosition](#containerPosition)
   30. [freezerPosition](#freezerPosition)
   31. [MAX\_CAPACITY](#MAX_CAPACITY)
   32. [MAX\_CAPACITY\_BAG](#MAX_CAPACITY_BAG)
   33. [MAX\_CAPACITY\_VEHICLE](#MAX_CAPACITY_VEHICLE)
   34. [TYPE\_FRIDGE](#TYPE_FRIDGE)
   35. [TYPE\_FREEZER](#TYPE_FREEZER)
   36. [TL\_comparators](#TL_comparators)
   37. [TL\_itemListPool](#TL_itemListPool)
   38. [TL\_predicates](#TL_predicates)
7. [Constructor Details](#constructor-detail)
   1. [ItemContainer(int, String, IsoGridSquare, IsoObject)](#%3Cinit%3E(int,java.lang.String,zombie.iso.IsoGridSquare,zombie.iso.IsoObject))
   2. [ItemContainer(String, IsoGridSquare, IsoObject)](#%3Cinit%3E(java.lang.String,zombie.iso.IsoGridSquare,zombie.iso.IsoObject))
   3. [ItemContainer(int)](#%3Cinit%3E(int))
   4. [ItemContainer()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [floatingPointCorrection(float)](#floatingPointCorrection(float))
   2. [getCapacity()](#getCapacity())
   3. [setCapacity(int)](#setCapacity(int))
   4. [FindAndReturnWaterItem(int)](#FindAndReturnWaterItem(int))
   5. [getItemFromTypeRecurse(String)](#getItemFromTypeRecurse(java.lang.String))
   6. [getEffectiveCapacity(IsoGameCharacter)](#getEffectiveCapacity(zombie.characters.IsoGameCharacter))
   7. [hasRoomFor(IsoGameCharacter, InventoryItem)](#hasRoomFor(zombie.characters.IsoGameCharacter,zombie.inventory.InventoryItem))
   8. [hasRoomFor(IsoGameCharacter, float)](#hasRoomFor(zombie.characters.IsoGameCharacter,float))
   9. [hasRoomFor(IsoGameCharacter, float, float)](#hasRoomFor(zombie.characters.IsoGameCharacter,float,float))
   10. [getFreeCapacity(IsoGameCharacter)](#getFreeCapacity(zombie.characters.IsoGameCharacter))
   11. [isFull(IsoGameCharacter)](#isFull(zombie.characters.IsoGameCharacter))
   12. [isInvalidClothingRackItem(InventoryItem)](#isInvalidClothingRackItem(zombie.inventory.InventoryItem))
   13. [isItemAllowed(InventoryItem)](#isItemAllowed(zombie.inventory.InventoryItem))
   14. [isRemoveItemAllowed(InventoryItem)](#isRemoveItemAllowed(zombie.inventory.InventoryItem))
   15. [isExplored()](#isExplored())
   16. [setExplored(boolean)](#setExplored(boolean))
   17. [isInCharacterInventory(IsoGameCharacter)](#isInCharacterInventory(zombie.characters.IsoGameCharacter))
   18. [isInside(InventoryItem)](#isInside(zombie.inventory.InventoryItem))
   19. [getContainingItem()](#getContainingItem())
   20. [DoAddItem(InventoryItem)](#DoAddItem(zombie.inventory.InventoryItem))
   21. [DoAddItemBlind(InventoryItem)](#DoAddItemBlind(zombie.inventory.InventoryItem))
   22. [AddItems(String, int)](#AddItems(java.lang.String,int))
   23. [addItem(ItemKey)](#addItem(zombie.scripting.objects.ItemKey))
   24. [addItems(ItemKey, int)](#addItems(zombie.scripting.objects.ItemKey,int))
   25. [AddItems(InventoryItem, int)](#AddItems(zombie.inventory.InventoryItem,int))
   26. [AddItems(ArrayList)](#AddItems(java.util.ArrayList))
   27. [getNumberOfItem(String, boolean)](#getNumberOfItem(java.lang.String,boolean))
   28. [getNumberOfItem(String)](#getNumberOfItem(java.lang.String))
   29. [getNumberOfItem(String, boolean, ArrayList)](#getNumberOfItem(java.lang.String,boolean,java.util.ArrayList))
   30. [getNumberOfItem(String, boolean, boolean)](#getNumberOfItem(java.lang.String,boolean,boolean))
   31. [addItem(InventoryItem)](#addItem(zombie.inventory.InventoryItem))
   32. [AddItem(InventoryItem)](#AddItem(zombie.inventory.InventoryItem))
   33. [SpawnItem(InventoryItem)](#SpawnItem(zombie.inventory.InventoryItem))
   34. [AddItemBlind(InventoryItem)](#AddItemBlind(zombie.inventory.InventoryItem))
   35. [SpawnItem(String)](#SpawnItem(java.lang.String))
   36. [AddItem(String)](#AddItem(java.lang.String))
   37. [SpawnItem(String, float)](#SpawnItem(java.lang.String,float))
   38. [AddItem(String, float)](#AddItem(java.lang.String,float))
   39. [AddItem(String, float, boolean)](#AddItem(java.lang.String,float,boolean))
   40. [contains(InventoryItem)](#contains(zombie.inventory.InventoryItem))
   41. [containsWithModule(String)](#containsWithModule(java.lang.String))
   42. [containsWithModule(String, boolean)](#containsWithModule(java.lang.String,boolean))
   43. [removeItemOnServer(InventoryItem)](#removeItemOnServer(zombie.inventory.InventoryItem))
   44. [contains(InventoryItem, boolean)](#contains(zombie.inventory.InventoryItem,boolean))
   45. [contains(Invokers.Params2.Boolean.IParam2, boolean)](#contains(zombie.util.lambda.Invokers.Params2.Boolean.IParam2,boolean))
   46. [contains(T, Invokers.Params2.Boolean.ICallback, boolean)](#contains(T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback,boolean))
   47. [findItem(Invokers.Params2.Boolean.IParam2, boolean)](#findItem(zombie.util.lambda.Invokers.Params2.Boolean.IParam2,boolean))
   48. [findItem(T, Invokers.Params2.Boolean.ICallback, boolean)](#findItem(T,zombie.util.lambda.Invokers.Params2.Boolean.ICallback,boolean))
   49. [findItem(String, boolean, boolean)](#findItem(java.lang.String,boolean,boolean))
   50. [findHumanCorpseItem()](#findHumanCorpseItem())
   51. [containsHumanCorpse()](#containsHumanCorpse())
   52. [contains(String, boolean)](#contains(java.lang.String,boolean))
   53. [containsType(String)](#containsType(java.lang.String))
   54. [containsTypeRecurse(ItemKey)](#containsTypeRecurse(zombie.scripting.objects.ItemKey))
   55. [containsTypeRecurse(String)](#containsTypeRecurse(java.lang.String))
   56. [testBroken(boolean, InventoryItem)](#testBroken(boolean,zombie.inventory.InventoryItem))
   57. [contains(String, boolean, boolean)](#contains(java.lang.String,boolean,boolean))
   58. [contains(String)](#contains(java.lang.String))
   59. [getAnimalInventoryItem(IsoAnimal)](#getAnimalInventoryItem(zombie.characters.animals.IsoAnimal))
   60. [canHumanCorpseFit(IsoGameCharacter)](#canHumanCorpseFit(zombie.characters.IsoGameCharacter))
   61. [canItemFit(InventoryItem, IsoGameCharacter)](#canItemFit(zombie.inventory.InventoryItem,zombie.characters.IsoGameCharacter))
   62. [isVehiclePart()](#isVehiclePart())
   63. [isVehicleSeat()](#isVehicleSeat())
   64. [isOccupiedVehicleSeat()](#isOccupiedVehicleSeat())
   65. [getBestOf(ItemContainer.InventoryItemList, Comparator)](#getBestOf(zombie.inventory.ItemContainer.InventoryItemList,java.util.Comparator))
   66. [getBest(Predicate, Comparator)](#getBest(java.util.function.Predicate,java.util.Comparator))
   67. [getBestRecurse(Predicate, Comparator)](#getBestRecurse(java.util.function.Predicate,java.util.Comparator))
   68. [getBestType(String, Comparator)](#getBestType(java.lang.String,java.util.Comparator))
   69. [getBestTypeRecurse(String, Comparator)](#getBestTypeRecurse(java.lang.String,java.util.Comparator))
   70. [getBestEval(LuaClosure, LuaClosure)](#getBestEval(se.krka.kahlua.vm.LuaClosure,se.krka.kahlua.vm.LuaClosure))
   71. [getBestEvalRecurse(LuaClosure, LuaClosure)](#getBestEvalRecurse(se.krka.kahlua.vm.LuaClosure,se.krka.kahlua.vm.LuaClosure))
   72. [getBestEvalArg(LuaClosure, LuaClosure, Object)](#getBestEvalArg(se.krka.kahlua.vm.LuaClosure,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   73. [getBestEvalArgRecurse(LuaClosure, LuaClosure, Object)](#getBestEvalArgRecurse(se.krka.kahlua.vm.LuaClosure,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   74. [getBestTypeEval(String, LuaClosure)](#getBestTypeEval(java.lang.String,se.krka.kahlua.vm.LuaClosure))
   75. [getBestTypeEvalRecurse(String, LuaClosure)](#getBestTypeEvalRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure))
   76. [getBestTypeEvalArg(String, LuaClosure, Object)](#getBestTypeEvalArg(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   77. [getBestTypeEvalArgRecurse(String, LuaClosure, Object)](#getBestTypeEvalArgRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   78. [getBestCondition(Predicate)](#getBestCondition(java.util.function.Predicate))
   79. [getBestConditionRecurse(Predicate)](#getBestConditionRecurse(java.util.function.Predicate))
   80. [getBestCondition(String)](#getBestCondition(java.lang.String))
   81. [getBestConditionRecurse(String)](#getBestConditionRecurse(java.lang.String))
   82. [getBestConditionEval(LuaClosure)](#getBestConditionEval(se.krka.kahlua.vm.LuaClosure))
   83. [getBestConditionEvalRecurse(LuaClosure)](#getBestConditionEvalRecurse(se.krka.kahlua.vm.LuaClosure))
   84. [getBestConditionEvalArg(LuaClosure, Object)](#getBestConditionEvalArg(se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   85. [getBestConditionEvalArgRecurse(LuaClosure, Object)](#getBestConditionEvalArgRecurse(se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   86. [getFirstEval(LuaClosure)](#getFirstEval(se.krka.kahlua.vm.LuaClosure))
   87. [getFirstEvalArg(LuaClosure, Object)](#getFirstEvalArg(se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   88. [containsEval(LuaClosure)](#containsEval(se.krka.kahlua.vm.LuaClosure))
   89. [containsEvalArg(LuaClosure, Object)](#containsEvalArg(se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   90. [containsEvalRecurse(LuaClosure)](#containsEvalRecurse(se.krka.kahlua.vm.LuaClosure))
   91. [containsEvalArgRecurse(LuaClosure, Object)](#containsEvalArgRecurse(se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   92. [containsTag(ItemTag)](#containsTag(zombie.scripting.objects.ItemTag))
   93. [containsTagEval(ItemTag, LuaClosure)](#containsTagEval(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure))
   94. [containsTagRecurse(ItemTag)](#containsTagRecurse(zombie.scripting.objects.ItemTag))
   95. [containsTagEvalRecurse(ItemTag, LuaClosure)](#containsTagEvalRecurse(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure))
   96. [containsTagEvalArgRecurse(ItemTag, LuaClosure, Object)](#containsTagEvalArgRecurse(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   97. [containsTypeEvalRecurse(String, LuaClosure)](#containsTypeEvalRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure))
   98. [containsTypeEvalArgRecurse(String, LuaClosure, Object)](#containsTypeEvalArgRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   99. [compareType(String, String)](#compareType(java.lang.String,java.lang.String))
   100. [compareType(String, InventoryItem)](#compareType(java.lang.String,zombie.inventory.InventoryItem))
   101. [getFirst(Predicate)](#getFirst(java.util.function.Predicate))
   102. [getFirstRecurse(Predicate)](#getFirstRecurse(java.util.function.Predicate))
   103. [getSome(Predicate, int, ArrayList)](#getSome(java.util.function.Predicate,int,java.util.ArrayList))
   104. [getSomeRecurse(Predicate, int, ArrayList)](#getSomeRecurse(java.util.function.Predicate,int,java.util.ArrayList))
   105. [getAll(Predicate, ArrayList)](#getAll(java.util.function.Predicate,java.util.ArrayList))
   106. [getAllRecurse(Predicate, ArrayList)](#getAllRecurse(java.util.function.Predicate,java.util.ArrayList))
   107. [getAllRecurse(Predicate)](#getAllRecurse(java.util.function.Predicate))
   108. [getCount(Predicate)](#getCount(java.util.function.Predicate))
   109. [getCountRecurse(Predicate)](#getCountRecurse(java.util.function.Predicate))
   110. [getCountTag(ItemTag)](#getCountTag(zombie.scripting.objects.ItemTag))
   111. [getCountTagEval(ItemTag, LuaClosure)](#getCountTagEval(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure))
   112. [getCountTagEvalArg(ItemTag, LuaClosure, Object)](#getCountTagEvalArg(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   113. [getCountTagRecurse(ItemTag)](#getCountTagRecurse(zombie.scripting.objects.ItemTag))
   114. [getCountTagEvalRecurse(ItemTag, LuaClosure)](#getCountTagEvalRecurse(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure))
   115. [getCountTagEvalArgRecurse(ItemTag, LuaClosure, Object)](#getCountTagEvalArgRecurse(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   116. [getCountType(String)](#getCountType(java.lang.String))
   117. [getCountTypeEval(String, LuaClosure)](#getCountTypeEval(java.lang.String,se.krka.kahlua.vm.LuaClosure))
   118. [getCountTypeEvalArg(String, LuaClosure, Object)](#getCountTypeEvalArg(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   119. [getCountTypeRecurse(String)](#getCountTypeRecurse(java.lang.String))
   120. [getCountTypeEvalRecurse(String, LuaClosure)](#getCountTypeEvalRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure))
   121. [getCountTypeEvalArgRecurse(String, LuaClosure, Object)](#getCountTypeEvalArgRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   122. [getCountEval(LuaClosure)](#getCountEval(se.krka.kahlua.vm.LuaClosure))
   123. [getCountEvalArg(LuaClosure, Object)](#getCountEvalArg(se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   124. [getCountEvalRecurse(LuaClosure)](#getCountEvalRecurse(se.krka.kahlua.vm.LuaClosure))
   125. [getCountEvalArgRecurse(LuaClosure, Object)](#getCountEvalArgRecurse(se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   126. [getFirstCategory(String)](#getFirstCategory(java.lang.String))
   127. [getFirstCategoryRecurse(String)](#getFirstCategoryRecurse(java.lang.String))
   128. [getFirstEvalRecurse(LuaClosure)](#getFirstEvalRecurse(se.krka.kahlua.vm.LuaClosure))
   129. [getFirstEvalArgRecurse(LuaClosure, Object)](#getFirstEvalArgRecurse(se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   130. [getFirstTag(ItemTag)](#getFirstTag(zombie.scripting.objects.ItemTag))
   131. [getFirstTagRecurse(ItemTag)](#getFirstTagRecurse(zombie.scripting.objects.ItemTag))
   132. [getFirstTagEval(ItemTag, LuaClosure)](#getFirstTagEval(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure))
   133. [getFirstTagEvalRecurse(ItemTag, LuaClosure)](#getFirstTagEvalRecurse(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure))
   134. [getFirstTagEvalArgRecurse(ItemTag, LuaClosure, Object)](#getFirstTagEvalArgRecurse(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   135. [getFirstType(String)](#getFirstType(java.lang.String))
   136. [getFirstTypeRecurse(ItemKey)](#getFirstTypeRecurse(zombie.scripting.objects.ItemKey))
   137. [getFirstTypeRecurse(String)](#getFirstTypeRecurse(java.lang.String))
   138. [getFirstTypeEval(String, LuaClosure)](#getFirstTypeEval(java.lang.String,se.krka.kahlua.vm.LuaClosure))
   139. [getFirstTypeEvalRecurse(ItemKey, LuaClosure)](#getFirstTypeEvalRecurse(zombie.scripting.objects.ItemKey,se.krka.kahlua.vm.LuaClosure))
   140. [getFirstTypeEvalRecurse(String, LuaClosure)](#getFirstTypeEvalRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure))
   141. [getFirstTypeEvalArgRecurse(String, LuaClosure, Object)](#getFirstTypeEvalArgRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   142. [getSomeCategory(String, int, ArrayList)](#getSomeCategory(java.lang.String,int,java.util.ArrayList))
   143. [getSomeCategoryRecurse(String, int, ArrayList)](#getSomeCategoryRecurse(java.lang.String,int,java.util.ArrayList))
   144. [getSomeTag(ItemTag, int, ArrayList)](#getSomeTag(zombie.scripting.objects.ItemTag,int,java.util.ArrayList))
   145. [getSomeTagEval(ItemTag, LuaClosure, int, ArrayList)](#getSomeTagEval(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,int,java.util.ArrayList))
   146. [getSomeTagEvalArg(ItemTag, LuaClosure, Object, int, ArrayList)](#getSomeTagEvalArg(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,java.lang.Object,int,java.util.ArrayList))
   147. [getSomeTagRecurse(ItemTag, int, ArrayList)](#getSomeTagRecurse(zombie.scripting.objects.ItemTag,int,java.util.ArrayList))
   148. [getSomeTagEvalRecurse(ItemTag, LuaClosure, int, ArrayList)](#getSomeTagEvalRecurse(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,int,java.util.ArrayList))
   149. [getSomeTagEvalArgRecurse(ItemTag, LuaClosure, Object, int, ArrayList)](#getSomeTagEvalArgRecurse(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,java.lang.Object,int,java.util.ArrayList))
   150. [getSomeType(String, int, ArrayList)](#getSomeType(java.lang.String,int,java.util.ArrayList))
   151. [getSomeTypeEval(String, LuaClosure, int, ArrayList)](#getSomeTypeEval(java.lang.String,se.krka.kahlua.vm.LuaClosure,int,java.util.ArrayList))
   152. [getSomeTypeEvalArg(String, LuaClosure, Object, int, ArrayList)](#getSomeTypeEvalArg(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.lang.Object,int,java.util.ArrayList))
   153. [getSomeTypeRecurse(String, int, ArrayList)](#getSomeTypeRecurse(java.lang.String,int,java.util.ArrayList))
   154. [getSomeTypeEvalRecurse(String, LuaClosure, int, ArrayList)](#getSomeTypeEvalRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure,int,java.util.ArrayList))
   155. [getSomeTypeEvalArgRecurse(String, LuaClosure, Object, int, ArrayList)](#getSomeTypeEvalArgRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.lang.Object,int,java.util.ArrayList))
   156. [getSomeEval(LuaClosure, int, ArrayList)](#getSomeEval(se.krka.kahlua.vm.LuaClosure,int,java.util.ArrayList))
   157. [getSomeEvalArg(LuaClosure, Object, int, ArrayList)](#getSomeEvalArg(se.krka.kahlua.vm.LuaClosure,java.lang.Object,int,java.util.ArrayList))
   158. [getSomeEvalRecurse(LuaClosure, int, ArrayList)](#getSomeEvalRecurse(se.krka.kahlua.vm.LuaClosure,int,java.util.ArrayList))
   159. [getSomeEvalArgRecurse(LuaClosure, Object, int, ArrayList)](#getSomeEvalArgRecurse(se.krka.kahlua.vm.LuaClosure,java.lang.Object,int,java.util.ArrayList))
   160. [getAllCategory(String, ArrayList)](#getAllCategory(java.lang.String,java.util.ArrayList))
   161. [getAllCategoryRecurse(String, ArrayList)](#getAllCategoryRecurse(java.lang.String,java.util.ArrayList))
   162. [getAllTag(ItemTag)](#getAllTag(zombie.scripting.objects.ItemTag))
   163. [getAllTag(ItemTag, ArrayList)](#getAllTag(zombie.scripting.objects.ItemTag,java.util.ArrayList))
   164. [getAllTagEval(ItemTag, LuaClosure, ArrayList)](#getAllTagEval(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,java.util.ArrayList))
   165. [getAllTagEvalArg(ItemTag, LuaClosure, Object, ArrayList)](#getAllTagEvalArg(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,java.lang.Object,java.util.ArrayList))
   166. [getAllTagRecurse(ItemTag, ArrayList)](#getAllTagRecurse(zombie.scripting.objects.ItemTag,java.util.ArrayList))
   167. [getAllTagEvalRecurse(ItemTag, LuaClosure, ArrayList)](#getAllTagEvalRecurse(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,java.util.ArrayList))
   168. [getAllTagEvalArgRecurse(ItemTag, LuaClosure, Object, ArrayList)](#getAllTagEvalArgRecurse(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,java.lang.Object,java.util.ArrayList))
   169. [getAllType(String, ArrayList)](#getAllType(java.lang.String,java.util.ArrayList))
   170. [getAllTypeEval(String, LuaClosure, ArrayList)](#getAllTypeEval(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.util.ArrayList))
   171. [getAllTypeEvalArg(String, LuaClosure, Object, ArrayList)](#getAllTypeEvalArg(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.lang.Object,java.util.ArrayList))
   172. [getAllTypeRecurse(String, ArrayList)](#getAllTypeRecurse(java.lang.String,java.util.ArrayList))
   173. [getAllTypeEvalRecurse(String, LuaClosure, ArrayList)](#getAllTypeEvalRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.util.ArrayList))
   174. [getAllTypeEvalArgRecurse(String, LuaClosure, Object, ArrayList)](#getAllTypeEvalArgRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.lang.Object,java.util.ArrayList))
   175. [getAllEval(LuaClosure, ArrayList)](#getAllEval(se.krka.kahlua.vm.LuaClosure,java.util.ArrayList))
   176. [getAllEvalArg(LuaClosure, Object, ArrayList)](#getAllEvalArg(se.krka.kahlua.vm.LuaClosure,java.lang.Object,java.util.ArrayList))
   177. [getAllEvalRecurse(LuaClosure, ArrayList)](#getAllEvalRecurse(se.krka.kahlua.vm.LuaClosure,java.util.ArrayList))
   178. [getAllEvalArgRecurse(LuaClosure, Object, ArrayList)](#getAllEvalArgRecurse(se.krka.kahlua.vm.LuaClosure,java.lang.Object,java.util.ArrayList))
   179. [getSomeCategory(String, int)](#getSomeCategory(java.lang.String,int))
   180. [getSomeEval(LuaClosure, int)](#getSomeEval(se.krka.kahlua.vm.LuaClosure,int))
   181. [getSomeEvalArg(LuaClosure, Object, int)](#getSomeEvalArg(se.krka.kahlua.vm.LuaClosure,java.lang.Object,int))
   182. [getSomeTypeEval(String, LuaClosure, int)](#getSomeTypeEval(java.lang.String,se.krka.kahlua.vm.LuaClosure,int))
   183. [getSomeTypeEvalArg(String, LuaClosure, Object, int)](#getSomeTypeEvalArg(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.lang.Object,int))
   184. [getSomeEvalRecurse(LuaClosure, int)](#getSomeEvalRecurse(se.krka.kahlua.vm.LuaClosure,int))
   185. [getSomeEvalArgRecurse(LuaClosure, Object, int)](#getSomeEvalArgRecurse(se.krka.kahlua.vm.LuaClosure,java.lang.Object,int))
   186. [getSomeTag(ItemTag, int)](#getSomeTag(zombie.scripting.objects.ItemTag,int))
   187. [getSomeTagRecurse(ItemTag, int)](#getSomeTagRecurse(zombie.scripting.objects.ItemTag,int))
   188. [getSomeTagEvalRecurse(ItemTag, LuaClosure, int)](#getSomeTagEvalRecurse(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,int))
   189. [getSomeTagEvalArgRecurse(ItemTag, LuaClosure, Object, int)](#getSomeTagEvalArgRecurse(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,java.lang.Object,int))
   190. [getSomeType(String, int)](#getSomeType(java.lang.String,int))
   191. [getSomeTypeRecurse(String, int)](#getSomeTypeRecurse(java.lang.String,int))
   192. [getSomeTypeEvalRecurse(String, LuaClosure, int)](#getSomeTypeEvalRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure,int))
   193. [getSomeTypeEvalArgRecurse(String, LuaClosure, Object, int)](#getSomeTypeEvalArgRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.lang.Object,int))
   194. [getAll(Predicate)](#getAll(java.util.function.Predicate))
   195. [getAllCategory(String)](#getAllCategory(java.lang.String))
   196. [getAllEval(LuaClosure)](#getAllEval(se.krka.kahlua.vm.LuaClosure))
   197. [getAllEvalArg(LuaClosure, Object)](#getAllEvalArg(se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   198. [getAllTagEval(ItemTag, LuaClosure)](#getAllTagEval(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure))
   199. [getAllTagEvalArg(ItemTag, LuaClosure, Object)](#getAllTagEvalArg(zombie.scripting.objects.ItemTag,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   200. [getAllTypeEval(String, LuaClosure)](#getAllTypeEval(java.lang.String,se.krka.kahlua.vm.LuaClosure))
   201. [getAllTypeEvalArg(String, LuaClosure, Object)](#getAllTypeEvalArg(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   202. [getAllEvalRecurse(LuaClosure)](#getAllEvalRecurse(se.krka.kahlua.vm.LuaClosure))
   203. [getAllEvalArgRecurse(LuaClosure, Object)](#getAllEvalArgRecurse(se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   204. [getAllType(String)](#getAllType(java.lang.String))
   205. [getAllTypeRecurse(String)](#getAllTypeRecurse(java.lang.String))
   206. [getAllTypeEvalRecurse(String, LuaClosure)](#getAllTypeEvalRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure))
   207. [getAllTypeEvalArgRecurse(String, LuaClosure, Object)](#getAllTypeEvalArgRecurse(java.lang.String,se.krka.kahlua.vm.LuaClosure,java.lang.Object))
   208. [FindAndReturnCategory(String)](#FindAndReturnCategory(java.lang.String))
   209. [FindAndReturn(String, int)](#FindAndReturn(java.lang.String,int))
   210. [FindAndReturn(String, ArrayList)](#FindAndReturn(java.lang.String,java.util.ArrayList))
   211. [FindAndReturn(String)](#FindAndReturn(java.lang.String))
   212. [FindAll(String)](#FindAll(java.lang.String))
   213. [FindAndReturnStack(String)](#FindAndReturnStack(java.lang.String))
   214. [FindAndReturnStack(InventoryItem)](#FindAndReturnStack(zombie.inventory.InventoryItem))
   215. [HasType(ItemType)](#HasType(zombie.scripting.objects.ItemType))
   216. [Remove(InventoryItem)](#Remove(zombie.inventory.InventoryItem))
   217. [DoRemoveItem(InventoryItem)](#DoRemoveItem(zombie.inventory.InventoryItem))
   218. [Remove(String)](#Remove(java.lang.String))
   219. [Remove(ItemType)](#Remove(zombie.scripting.objects.ItemType))
   220. [Find(String)](#Find(java.lang.String))
   221. [Find(ItemType)](#Find(zombie.scripting.objects.ItemType))
   222. [RemoveAll(String)](#RemoveAll(java.lang.String))
   223. [RemoveAll(String, int)](#RemoveAll(java.lang.String,int))
   224. [RemoveOneOf(String, boolean)](#RemoveOneOf(java.lang.String,boolean))
   225. [RemoveOneOf(String)](#RemoveOneOf(java.lang.String))
   226. [getContentsWeight()](#getContentsWeight())
   227. [getMaxWeight()](#getMaxWeight())
   228. [getCapacityWeight()](#getCapacityWeight())
   229. [getAvailableWeightCapacity()](#getAvailableWeightCapacity())
   230. [isEmpty()](#isEmpty())
   231. [isEmptyOrUnwanted(IsoPlayer)](#isEmptyOrUnwanted(zombie.characters.IsoPlayer))
   232. [isMicrowave()](#isMicrowave())
   233. [isSquareInRoom(IsoGridSquare)](#isSquareInRoom(zombie.iso.IsoGridSquare))
   234. [isSquarePowered(IsoGridSquare, boolean)](#isSquarePowered(zombie.iso.IsoGridSquare,boolean))
   235. [isPowered()](#isPowered())
   236. [isObjectPowered(IsoObject, boolean)](#isObjectPowered(zombie.iso.IsoObject,boolean))
   237. [getTemprature()](#getTemprature())
   238. [isTemperatureChanging()](#isTemperatureChanging())
   239. [save(ByteBuffer, IsoGameCharacter)](#save(java.nio.ByteBuffer,zombie.characters.IsoGameCharacter))
   240. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   241. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   242. [isDrawDirty()](#isDrawDirty())
   243. [setDrawDirty(boolean)](#setDrawDirty(boolean))
   244. [getBestWeapon(SurvivorDesc)](#getBestWeapon(zombie.characters.SurvivorDesc))
   245. [getBestWeapon()](#getBestWeapon())
   246. [getTotalFoodScore(SurvivorDesc)](#getTotalFoodScore(zombie.characters.SurvivorDesc))
   247. [getTotalWeaponScore(SurvivorDesc)](#getTotalWeaponScore(zombie.characters.SurvivorDesc))
   248. [getBestFood(SurvivorDesc)](#getBestFood(zombie.characters.SurvivorDesc))
   249. [getBestBandage(SurvivorDesc)](#getBestBandage(zombie.characters.SurvivorDesc))
   250. [getNumItems(String)](#getNumItems(java.lang.String))
   251. [isActive()](#isActive())
   252. [setActive(boolean)](#setActive(boolean))
   253. [isDirty()](#isDirty())
   254. [setDirty(boolean)](#setDirty(boolean))
   255. [isIsDevice()](#isIsDevice())
   256. [setIsDevice(boolean)](#setIsDevice(boolean))
   257. [getAgeFactor()](#getAgeFactor())
   258. [setAgeFactor(float)](#setAgeFactor(float))
   259. [getCookingFactor()](#getCookingFactor())
   260. [setCookingFactor(float)](#setCookingFactor(float))
   261. [getItems()](#getItems())
   262. [setItems(ArrayList)](#setItems(java.util.ArrayList))
   263. [takeItemsFrom(ItemContainer)](#takeItemsFrom(zombie.inventory.ItemContainer))
   264. [getParent()](#getParent())
   265. [setParent(IsoObject)](#setParent(zombie.iso.IsoObject))
   266. [getSourceGrid()](#getSourceGrid())
   267. [setSourceGrid(IsoGridSquare)](#setSourceGrid(zombie.iso.IsoGridSquare))
   268. [getType()](#getType())
   269. [setType(String)](#setType(java.lang.String))
   270. [clear()](#clear())
   271. [getWaterContainerCount()](#getWaterContainerCount())
   272. [FindWaterSource()](#FindWaterSource())
   273. [getAllWaterFillables()](#getAllWaterFillables())
   274. [getFirstWaterFluidSources(boolean)](#getFirstWaterFluidSources(boolean))
   275. [getFirstWaterFluidSources(boolean, boolean)](#getFirstWaterFluidSources(boolean,boolean))
   276. [getFirstFluidContainer(String)](#getFirstFluidContainer(java.lang.String))
   277. [getAvailableFluidContainer(String)](#getAvailableFluidContainer(java.lang.String))
   278. [getAvailableFluidContainersCapacity(String)](#getAvailableFluidContainersCapacity(java.lang.String))
   279. [getFirstAvailableFluidContainer(String)](#getFirstAvailableFluidContainer(java.lang.String))
   280. [getAllWaterFluidSources(boolean)](#getAllWaterFluidSources(boolean))
   281. [getFirstCleaningFluidSources()](#getFirstCleaningFluidSources())
   282. [getAllCleaningFluidSources()](#getAllCleaningFluidSources())
   283. [getItemCount(String)](#getItemCount(java.lang.String))
   284. [getItemCount(ItemKey)](#getItemCount(zombie.scripting.objects.ItemKey))
   285. [getItemCountRecurse(ItemKey)](#getItemCountRecurse(zombie.scripting.objects.ItemKey))
   286. [getItemCountRecurse(String)](#getItemCountRecurse(java.lang.String))
   287. [getItemCount(String, boolean)](#getItemCount(java.lang.String,boolean))
   288. [getUses(ItemContainer.InventoryItemList)](#getUses(zombie.inventory.ItemContainer.InventoryItemList))
   289. [getUsesRecurse(Predicate)](#getUsesRecurse(java.util.function.Predicate))
   290. [getUsesType(String)](#getUsesType(java.lang.String))
   291. [getUsesTypeRecurse(String)](#getUsesTypeRecurse(java.lang.String))
   292. [getWeightReduction()](#getWeightReduction())
   293. [setWeightReduction(int)](#setWeightReduction(int))
   294. [removeAllItems()](#removeAllItems())
   295. [containsRecursive(InventoryItem)](#containsRecursive(zombie.inventory.InventoryItem))
   296. [getItemCountFromTypeRecurse(String)](#getItemCountFromTypeRecurse(java.lang.String))
   297. [getCustomTemperature()](#getCustomTemperature())
   298. [setCustomTemperature(float)](#setCustomTemperature(float))
   299. [getItemFromType(String, IsoGameCharacter, boolean, boolean, boolean)](#getItemFromType(java.lang.String,zombie.characters.IsoGameCharacter,boolean,boolean,boolean))
   300. [getItemFromTag(ItemTag, IsoGameCharacter, boolean, boolean, boolean)](#getItemFromTag(zombie.scripting.objects.ItemTag,zombie.characters.IsoGameCharacter,boolean,boolean,boolean))
   301. [getItemFromType(String, boolean, boolean)](#getItemFromType(java.lang.String,boolean,boolean))
   302. [getItemFromTag(ItemTag, boolean, boolean)](#getItemFromTag(zombie.scripting.objects.ItemTag,boolean,boolean))
   303. [getItemFromType(String)](#getItemFromType(java.lang.String))
   304. [getItemsFromType(String)](#getItemsFromType(java.lang.String))
   305. [getItemsFromFullType(String)](#getItemsFromFullType(java.lang.String))
   306. [getItemsFromFullType(String, boolean)](#getItemsFromFullType(java.lang.String,boolean))
   307. [getItemsFromType(String, boolean)](#getItemsFromType(java.lang.String,boolean))
   308. [getItemsFromCategory(String)](#getItemsFromCategory(java.lang.String))
   309. [requestSync()](#requestSync())
   310. [requestServerItemsForContainer()](#requestServerItemsForContainer())
   311. [getItemWithIDRecursiv(int)](#getItemWithIDRecursiv(int))
   312. [getItemWithID(int)](#getItemWithID(int))
   313. [removeItemWithID(int)](#removeItemWithID(int))
   314. [containsID(int)](#containsID(int))
   315. [removeItemWithIDRecurse(int)](#removeItemWithIDRecurse(int))
   316. [isHasBeenLooted()](#isHasBeenLooted())
   317. [setHasBeenLooted(boolean)](#setHasBeenLooted(boolean))
   318. [getOpenSound()](#getOpenSound())
   319. [setOpenSound(String)](#setOpenSound(java.lang.String))
   320. [getCloseSound()](#getCloseSound())
   321. [setCloseSound(String)](#setCloseSound(java.lang.String))
   322. [getPutSound()](#getPutSound())
   323. [setPutSound(String)](#setPutSound(java.lang.String))
   324. [getTakeSound()](#getTakeSound())
   325. [setTakeSound(String)](#setTakeSound(java.lang.String))
   326. [haveThisKeyId(int)](#haveThisKeyId(int))
   327. [getOnlyAcceptCategory()](#getOnlyAcceptCategory())
   328. [setOnlyAcceptCategory(String)](#setOnlyAcceptCategory(java.lang.String))
   329. [getAcceptItemFunction()](#getAcceptItemFunction())
   330. [setAcceptItemFunction(String)](#setAcceptItemFunction(java.lang.String))
   331. [toString()](#toString())
   332. [getCharacter()](#getCharacter())
   333. [emptyIt()](#emptyIt())
   334. [getItems4Admin()](#getItems4Admin())
   335. [getAllFoodsForAnimals()](#getAllFoodsForAnimals())
   336. [getAllItems(LinkedHashMap, boolean)](#getAllItems(java.util.LinkedHashMap,boolean))
   337. [getItemById(long)](#getItemById(long))
   338. [addItemsToProcessItems()](#addItemsToProcessItems())
   339. [removeItemsFromProcessItems()](#removeItemsFromProcessItems())
   340. [isExistYet()](#isExistYet())
   341. [getContainerPosition()](#getContainerPosition())
   342. [setContainerPosition(String)](#setContainerPosition(java.lang.String))
   343. [getFreezerPosition()](#getFreezerPosition())
   344. [setFreezerPosition(String)](#setFreezerPosition(java.lang.String))
   345. [getVehiclePart()](#getVehiclePart())
   346. [getVehiclePartOwner()](#getVehiclePartOwner())
   347. [getVehicle()](#getVehicle())
   348. [getVehicleDoorPart()](#getVehicleDoorPart())
   349. [getVehicleSeatDoorPart()](#getVehicleSeatDoorPart())
   350. [getVehicleSeatDoor()](#getVehicleSeatDoor())
   351. [getVehicleDoor()](#getVehicleDoor())
   352. [doesVehicleDoorNeedOpening()](#doesVehicleDoorNeedOpening())
   353. [canCharacterOpenVehicleDoor(IsoGameCharacter)](#canCharacterOpenVehicleDoor(zombie.characters.IsoGameCharacter))
   354. [canCharacterUnlockVehicleDoor(IsoGameCharacter)](#canCharacterUnlockVehicleDoor(zombie.characters.IsoGameCharacter))
   355. [reset()](#reset())
   356. [getOutermostContainer()](#getOutermostContainer())
   357. [getSquare()](#getSquare())
   358. [getWorldItem()](#getWorldItem())
   359. [hasWorldItem()](#hasWorldItem())
   360. [getWorldPosition(Vector2)](#getWorldPosition(zombie.iso.Vector2))
   361. [isStove()](#isStove())
   362. [isShop()](#isShop())
   363. [isCorpse()](#isCorpse())
   364. [hasRecipe(String, IsoGameCharacter)](#hasRecipe(java.lang.String,zombie.characters.IsoGameCharacter))
   365. [hasRecipe(String, IsoGameCharacter, boolean)](#hasRecipe(java.lang.String,zombie.characters.IsoGameCharacter,boolean))
   366. [getRecipeItem(String, IsoGameCharacter, boolean)](#getRecipeItem(java.lang.String,zombie.characters.IsoGameCharacter,boolean))
   367. [dumpContentsInSquare(IsoGridSquare)](#dumpContentsInSquare(zombie.iso.IsoGridSquare))
   368. [getCustomName()](#getCustomName())
   369. [setCustomName(String)](#setCustomName(java.lang.String))
   370. [getSoapList(List, boolean)](#getSoapList(java.util.List,boolean))
   371. [isFreezer()](#isFreezer())
   372. [isFridge()](#isFridge())
   373. [isLockedToCharacter(IsoGameCharacter)](#isLockedToCharacter(zombie.characters.IsoGameCharacter))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ItemContainer
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.inventory.ItemContainer

---

public final class ItemContainer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `ItemContainer.CategoryPredicate`

  `private static final class`

  `ItemContainer.Comparators`

  `private static final class`

  `ItemContainer.ConditionComparator`

  `private static final class`

  `ItemContainer.EvalArgComparator`

  `private static final class`

  `ItemContainer.EvalArgPredicate`

  `private static final class`

  `ItemContainer.EvalComparator`

  `private static final class`

  `ItemContainer.EvalPredicate`

  `private static final class`

  `ItemContainer.InventoryItemList`

  `private static final class`

  `ItemContainer.InventoryItemListPool`

  `private static final class`

  `ItemContainer.Predicates`

  `private static final class`

  `ItemContainer.TagEvalArgPredicate`

  `private static final class`

  `ItemContainer.TagEvalPredicate`

  `private static final class`

  `ItemContainer.TagPredicate`

  `private static final class`

  `ItemContainer.TypeEvalArgPredicate`

  `private static final class`

  `ItemContainer.TypeEvalPredicate`

  `private static final class`

  `ItemContainer.TypePredicate`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `acceptItemFunction`

  `boolean`

  `active`

  `float`

  `ageFactor`

  `int`

  `capacity`

  `private String`

  `closeSound`

  `private String`

  `containerPosition`

  `InventoryItem`

  `containingItem`

  `float`

  `cookingFactor`

  `private float`

  `customTemperature`

  `private boolean`

  `dirty`

  `private boolean`

  `drawDirty`

  `boolean`

  `explored`

  `private String`

  `freezerPosition`

  `private boolean`

  `hasBeenLooted`

  `int`

  `id`

  `ArrayList<InventoryItem>`

  `includingObsoleteItems`

  `InventoryContainer`

  `inventoryContainer`

  `boolean`

  `isdevice`

  `ArrayList<InventoryItem>`

  `items`

  `private static final int`

  `MAX_CAPACITY`

  `private static final int`

  `MAX_CAPACITY_BAG`

  `private static final int`

  `MAX_CAPACITY_VEHICLE`

  `private String`

  `onlyAcceptCategory`

  `private String`

  `openSound`

  `IsoObject`

  `parent`

  `private String`

  `putSound`

  `private static final ThreadLocal<ArrayList<IsoObject>>`

  `s_tempObjects`

  `IsoGridSquare`

  `sourceGrid`

  `private String`

  `takeSound`

  `private static final ArrayList<InventoryItem>`

  `tempList`

  `private static final ThreadLocal<ItemContainer.Comparators>`

  `TL_comparators`

  `private static final ThreadLocal<ItemContainer.InventoryItemListPool>`

  `TL_itemListPool`

  `private static final ThreadLocal<ItemContainer.Predicates>`

  `TL_predicates`

  `String`

  `type`

  `private static final String`

  `TYPE_FREEZER`

  `private static final String`

  `TYPE_FRIDGE`

  `VehiclePart`

  `vehiclePart`

  `private int`

  `weightReduction`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ItemContainer()`

  `ItemContainer(int id)`

  `ItemContainer(int id,
  String containerName,
  IsoGridSquare square,
  IsoObject parent)`

  `ItemContainer(String containerName,
  IsoGridSquare square,
  IsoObject parent)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `InventoryItem`

  `addItem(InventoryItem item)`

  `<T extends InventoryItem>  
  T`

  `addItem(ItemKey item)`

  `InventoryItem`

  `AddItem(String type)`

  `boolean`

  `AddItem(String type,
  float useDelta)`

  `boolean`

  `AddItem(String type,
  float useDelta,
  boolean synchSpawn)`

  `InventoryItem`

  `AddItem(InventoryItem item)`

  `InventoryItem`

  `AddItemBlind(InventoryItem item)`

  `List<InventoryItem>`

  `addItems(ItemKey item,
  int count)`

  `ArrayList<InventoryItem>`

  `AddItems(String type,
  int count)`

  `ArrayList<InventoryItem>`

  `AddItems(ArrayList<InventoryItem> items)`

  `ArrayList<InventoryItem>`

  `AddItems(InventoryItem item,
  int count)`

  `void`

  `addItemsToProcessItems()`

  `boolean`

  `canCharacterOpenVehicleDoor(IsoGameCharacter playerObj)`

  `boolean`

  `canCharacterUnlockVehicleDoor(IsoGameCharacter playerObj)`

  `boolean`

  `canHumanCorpseFit(IsoGameCharacter chr)`

  `boolean`

  `canItemFit(InventoryItem item,
  IsoGameCharacter chr)`

  `void`

  `clear()`

  `private static boolean`

  `compareType(String type1,
  String type2)`

  `private static boolean`

  `compareType(String type,
  InventoryItem item)`

  `boolean`

  `contains(String type)`

  `boolean`

  `contains(String type,
  boolean doInv)`

  `boolean`

  `contains(String type,
  boolean doInv,
  boolean ignoreBroken)`

  `<T> boolean`

  `contains(T itemToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, InventoryItem> predicate,
  boolean doInv)`

  `boolean`

  `contains(InventoryItem item)`

  `boolean`

  `contains(InventoryItem itemToFind,
  boolean doInv)`

  `boolean`

  `contains(zombie.util.lambda.Invokers.Params2.Boolean.IParam2<InventoryItem> predicate,
  boolean doInv)`

  `boolean`

  `containsEval(se.krka.kahlua.vm.LuaClosure functionObj)`

  `boolean`

  `containsEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `boolean`

  `containsEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `boolean`

  `containsEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj)`

  `boolean`

  `containsHumanCorpse()`

  `boolean`

  `containsID(int id)`

  `boolean`

  `containsRecursive(InventoryItem item)`

  `boolean`

  `containsTag(ItemTag itemTag)`

  `boolean`

  `containsTagEval(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `boolean`

  `containsTagEvalArgRecurse(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `boolean`

  `containsTagEvalRecurse(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `boolean`

  `containsTagRecurse(ItemTag itemTag)`

  `boolean`

  `containsType(String type)`

  `boolean`

  `containsTypeEvalArgRecurse(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `boolean`

  `containsTypeEvalRecurse(String type,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `boolean`

  `containsTypeRecurse(String type)`

  `boolean`

  `containsTypeRecurse(ItemKey type)`

  `boolean`

  `containsWithModule(String moduleType)`

  `boolean`

  `containsWithModule(String moduleType,
  boolean withDeltaLeft)`

  `InventoryItem`

  `DoAddItem(InventoryItem item)`

  `InventoryItem`

  `DoAddItemBlind(InventoryItem item)`

  `boolean`

  `doesVehicleDoorNeedOpening()`

  `void`

  `DoRemoveItem(InventoryItem item)`

  `void`

  `dumpContentsInSquare(IsoGridSquare sq)`

  `void`

  `emptyIt()`

  `InventoryItem`

  `Find(String itemType)`

  `InventoryItem`

  `Find(ItemType itemType)`

  `ArrayList<InventoryItem>`

  `FindAll(String type)`

  `InventoryItem`

  `FindAndReturn(String type)`

  `ArrayList<InventoryItem>`

  `FindAndReturn(String type,
  int count)`

  `InventoryItem`

  `FindAndReturn(String type,
  ArrayList<InventoryItem> itemToCheck)`

  `InventoryItem`

  `FindAndReturnCategory(String category)`

  `InventoryItem`

  `FindAndReturnStack(String type)`

  `InventoryItem`

  `FindAndReturnStack(InventoryItem itemlike)`

  `InventoryItem`

  `FindAndReturnWaterItem(int uses)`

  `InventoryItem`

  `findHumanCorpseItem()`

  `InventoryItem`

  `findItem(String type,
  boolean doInv,
  boolean ignoreBroken)`

  `<T> InventoryItem`

  `findItem(T itemToCompare,
  zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, InventoryItem> predicate,
  boolean doInv)`

  `InventoryItem`

  `findItem(zombie.util.lambda.Invokers.Params2.Boolean.IParam2<InventoryItem> predicate,
  boolean doInv)`

  `InventoryItem`

  `FindWaterSource()`

  `static float`

  `floatingPointCorrection(float val)`

  `String`

  `getAcceptItemFunction()`

  `float`

  `getAgeFactor()`

  `ArrayList<InventoryItem>`

  `getAll(Predicate<InventoryItem> predicate)`

  `ArrayList<InventoryItem>`

  `getAll(Predicate<InventoryItem> predicate,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllCategory(String category)`

  `ArrayList<InventoryItem>`

  `getAllCategory(String category,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllCategoryRecurse(String category,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllCleaningFluidSources()`

  `ArrayList<InventoryItem>`

  `getAllEval(se.krka.kahlua.vm.LuaClosure functionObj)`

  `ArrayList<InventoryItem>`

  `getAllEval(se.krka.kahlua.vm.LuaClosure functionObj,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `ArrayList<InventoryItem>`

  `getAllEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `ArrayList<InventoryItem>`

  `getAllEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj)`

  `ArrayList<InventoryItem>`

  `getAllEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllFoodsForAnimals()`

  `LinkedHashMap<String, InventoryItem>`

  `getAllItems(LinkedHashMap<String, InventoryItem> items,
  boolean inInv)`

  `ArrayList<InventoryItem>`

  `getAllRecurse(Predicate<InventoryItem> predicate)`

  `ArrayList<InventoryItem>`

  `getAllRecurse(Predicate<InventoryItem> predicate,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllTag(ItemTag itemTag)`

  `ArrayList<InventoryItem>`

  `getAllTag(ItemTag itemTag,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllTagEval(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `ArrayList<InventoryItem>`

  `getAllTagEval(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllTagEvalArg(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `ArrayList<InventoryItem>`

  `getAllTagEvalArg(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllTagEvalArgRecurse(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllTagEvalRecurse(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllTagRecurse(ItemTag itemTag,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllType(String type)`

  `ArrayList<InventoryItem>`

  `getAllType(String type,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllTypeEval(String type,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `ArrayList<InventoryItem>`

  `getAllTypeEval(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllTypeEvalArg(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `ArrayList<InventoryItem>`

  `getAllTypeEvalArg(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllTypeEvalArgRecurse(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `ArrayList<InventoryItem>`

  `getAllTypeEvalArgRecurse(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllTypeEvalRecurse(String type,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `ArrayList<InventoryItem>`

  `getAllTypeEvalRecurse(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllTypeRecurse(String type)`

  `ArrayList<InventoryItem>`

  `getAllTypeRecurse(String type,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getAllWaterFillables()`

  `ArrayList<InventoryItem>`

  `getAllWaterFluidSources(boolean includeTainted)`

  `AnimalInventoryItem`

  `getAnimalInventoryItem(IsoAnimal animal)`

  `ArrayList<InventoryItem>`

  `getAvailableFluidContainer(String type)`

  `float`

  `getAvailableFluidContainersCapacity(String type)`

  `float`

  `getAvailableWeightCapacity()`

  `InventoryItem`

  `getBest(Predicate<InventoryItem> predicate,
  Comparator<InventoryItem> comparator)`

  `InventoryItem`

  `getBestBandage(SurvivorDesc descriptor)`

  `InventoryItem`

  `getBestCondition(String type)`

  `InventoryItem`

  `getBestCondition(Predicate<InventoryItem> predicate)`

  `InventoryItem`

  `getBestConditionEval(se.krka.kahlua.vm.LuaClosure functionObj)`

  `InventoryItem`

  `getBestConditionEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `InventoryItem`

  `getBestConditionEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `InventoryItem`

  `getBestConditionEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj)`

  `InventoryItem`

  `getBestConditionRecurse(String type)`

  `InventoryItem`

  `getBestConditionRecurse(Predicate<InventoryItem> predicate)`

  `InventoryItem`

  `getBestEval(se.krka.kahlua.vm.LuaClosure predicateObj,
  se.krka.kahlua.vm.LuaClosure comparatorObj)`

  `InventoryItem`

  `getBestEvalArg(se.krka.kahlua.vm.LuaClosure predicateObj,
  se.krka.kahlua.vm.LuaClosure comparatorObj,
  Object arg)`

  `InventoryItem`

  `getBestEvalArgRecurse(se.krka.kahlua.vm.LuaClosure predicateObj,
  se.krka.kahlua.vm.LuaClosure comparatorObj,
  Object arg)`

  `InventoryItem`

  `getBestEvalRecurse(se.krka.kahlua.vm.LuaClosure predicateObj,
  se.krka.kahlua.vm.LuaClosure comparatorObj)`

  `InventoryItem`

  `getBestFood(SurvivorDesc descriptor)`

  `private static InventoryItem`

  `getBestOf(ItemContainer.InventoryItemList items,
  Comparator<InventoryItem> comparator)`

  `InventoryItem`

  `getBestRecurse(Predicate<InventoryItem> predicate,
  Comparator<InventoryItem> comparator)`

  `InventoryItem`

  `getBestType(String type,
  Comparator<InventoryItem> comparator)`

  `InventoryItem`

  `getBestTypeEval(String type,
  se.krka.kahlua.vm.LuaClosure comparatorObj)`

  `InventoryItem`

  `getBestTypeEvalArg(String type,
  se.krka.kahlua.vm.LuaClosure comparatorObj,
  Object arg)`

  `InventoryItem`

  `getBestTypeEvalArgRecurse(String type,
  se.krka.kahlua.vm.LuaClosure comparatorObj,
  Object arg)`

  `InventoryItem`

  `getBestTypeEvalRecurse(String type,
  se.krka.kahlua.vm.LuaClosure comparatorObj)`

  `InventoryItem`

  `getBestTypeRecurse(String type,
  Comparator<InventoryItem> comparator)`

  `InventoryItem`

  `getBestWeapon()`

  `InventoryItem`

  `getBestWeapon(SurvivorDesc desc)`

  `int`

  `getCapacity()`

  `float`

  `getCapacityWeight()`

  `IsoGameCharacter`

  `getCharacter()`

  `String`

  `getCloseSound()`

  `String`

  `getContainerPosition()`

  `InventoryItem`

  `getContainingItem()`

  `float`

  `getContentsWeight()`

  `float`

  `getCookingFactor()`

  `int`

  `getCount(Predicate<InventoryItem> predicate)`

  `int`

  `getCountEval(se.krka.kahlua.vm.LuaClosure functionObj)`

  `int`

  `getCountEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `int`

  `getCountEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `int`

  `getCountEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj)`

  `int`

  `getCountRecurse(Predicate<InventoryItem> predicate)`

  `int`

  `getCountTag(ItemTag itemTag)`

  `int`

  `getCountTagEval(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `int`

  `getCountTagEvalArg(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `int`

  `getCountTagEvalArgRecurse(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `int`

  `getCountTagEvalRecurse(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `int`

  `getCountTagRecurse(ItemTag itemTag)`

  `int`

  `getCountType(String type)`

  `int`

  `getCountTypeEval(String type,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `int`

  `getCountTypeEvalArg(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `int`

  `getCountTypeEvalArgRecurse(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `int`

  `getCountTypeEvalRecurse(String type,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `int`

  `getCountTypeRecurse(String type)`

  `String`

  `getCustomName()`

  `float`

  `getCustomTemperature()`

  `int`

  `getEffectiveCapacity(IsoGameCharacter chr)`

  `InventoryItem`

  `getFirst(Predicate<InventoryItem> predicate)`

  `InventoryItem`

  `getFirstAvailableFluidContainer(String type)`

  `InventoryItem`

  `getFirstCategory(String category)`

  `InventoryItem`

  `getFirstCategoryRecurse(String category)`

  `InventoryItem`

  `getFirstCleaningFluidSources()`

  `InventoryItem`

  `getFirstEval(se.krka.kahlua.vm.LuaClosure functionObj)`

  `InventoryItem`

  `getFirstEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `InventoryItem`

  `getFirstEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `InventoryItem`

  `getFirstEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj)`

  `InventoryItem`

  `getFirstFluidContainer(String type)`

  `InventoryItem`

  `getFirstRecurse(Predicate<InventoryItem> predicate)`

  `InventoryItem`

  `getFirstTag(ItemTag itemTag)`

  `InventoryItem`

  `getFirstTagEval(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `InventoryItem`

  `getFirstTagEvalArgRecurse(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `InventoryItem`

  `getFirstTagEvalRecurse(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `InventoryItem`

  `getFirstTagRecurse(ItemTag itemTag)`

  `InventoryItem`

  `getFirstType(String type)`

  `InventoryItem`

  `getFirstTypeEval(String type,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `InventoryItem`

  `getFirstTypeEvalArgRecurse(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg)`

  `InventoryItem`

  `getFirstTypeEvalRecurse(String type,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `InventoryItem`

  `getFirstTypeEvalRecurse(ItemKey key,
  se.krka.kahlua.vm.LuaClosure functionObj)`

  `InventoryItem`

  `getFirstTypeRecurse(String type)`

  `InventoryItem`

  `getFirstTypeRecurse(ItemKey key)`

  `InventoryItem`

  `getFirstWaterFluidSources(boolean includeTainted)`

  `InventoryItem`

  `getFirstWaterFluidSources(boolean includeTainted,
  boolean taintedPriority)`

  `float`

  `getFreeCapacity(IsoGameCharacter chr)`

  `String`

  `getFreezerPosition()`

  `InventoryItem`

  `getItemById(long id)`

  Deprecated.

  `int`

  `getItemCount(String type)`

  `int`

  `getItemCount(String type,
  boolean doBags)`

  `int`

  `getItemCount(ItemKey type)`

  `int`

  `getItemCountFromTypeRecurse(String type)`

  `int`

  `getItemCountRecurse(String type)`

  `int`

  `getItemCountRecurse(ItemKey type)`

  `InventoryItem`

  `getItemFromTag(ItemTag itemTag,
  boolean ignoreBroken,
  boolean includeInv)`

  `InventoryItem`

  `getItemFromTag(ItemTag itemTag,
  IsoGameCharacter chr,
  boolean notEquipped,
  boolean ignoreBroken,
  boolean includeInv)`

  `InventoryItem`

  `getItemFromType(String type)`

  `InventoryItem`

  `getItemFromType(String type,
  boolean ignoreBroken,
  boolean includeInv)`

  `InventoryItem`

  `getItemFromType(String type,
  IsoGameCharacter chr,
  boolean notEquipped,
  boolean ignoreBroken,
  boolean includeInv)`

  `InventoryItem`

  `getItemFromTypeRecurse(String type)`

  `ArrayList<InventoryItem>`

  `getItems()`

  `LinkedHashMap<String, InventoryItem>`

  `getItems4Admin()`

  `ArrayList<InventoryItem>`

  `getItemsFromCategory(String category)`

  `ArrayList<InventoryItem>`

  `getItemsFromFullType(String type)`

  `ArrayList<InventoryItem>`

  `getItemsFromFullType(String type,
  boolean includeInv)`

  `ArrayList<InventoryItem>`

  `getItemsFromType(String type)`

  `ArrayList<InventoryItem>`

  `getItemsFromType(String type,
  boolean includeInv)`

  `InventoryItem`

  `getItemWithID(int id)`

  `InventoryItem`

  `getItemWithIDRecursiv(int id)`

  `float`

  `getMaxWeight()`

  `int`

  `getNumberOfItem(String findItem)`

  `int`

  `getNumberOfItem(String findItem,
  boolean includeReplaceOnDeplete)`

  `int`

  `getNumberOfItem(String findItem,
  boolean includeReplaceOnDeplete,
  boolean insideInv)`

  `int`

  `getNumberOfItem(String findItem,
  boolean includeReplaceOnDeplete,
  ArrayList<ItemContainer> containers)`

  `int`

  `getNumItems(String itemLike)`

  `String`

  `getOnlyAcceptCategory()`

  `String`

  `getOpenSound()`

  `ItemContainer`

  `getOutermostContainer()`

  `IsoObject`

  `getParent()`

  `String`

  `getPutSound()`

  `InventoryItem`

  `getRecipeItem(String recipe,
  IsoGameCharacter chr,
  boolean recursive)`

  `List<InventoryItem>`

  `getSoapList(List<InventoryItem> result,
  boolean includeLiquidSoap)`

  `ArrayList<InventoryItem>`

  `getSome(Predicate<InventoryItem> predicate,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeCategory(String category,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeCategory(String category,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeCategoryRecurse(String category,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeEval(se.krka.kahlua.vm.LuaClosure functionObj,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeEval(se.krka.kahlua.vm.LuaClosure functionObj,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeRecurse(Predicate<InventoryItem> predicate,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeTag(ItemTag itemTag,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeTag(ItemTag itemTag,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeTagEval(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeTagEvalArg(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeTagEvalArgRecurse(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeTagEvalArgRecurse(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeTagEvalRecurse(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeTagEvalRecurse(ItemTag itemTag,
  se.krka.kahlua.vm.LuaClosure functionObj,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeTagRecurse(ItemTag itemTag,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeTagRecurse(ItemTag itemTag,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeType(String type,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeType(String type,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeTypeEval(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeTypeEval(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeTypeEvalArg(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeTypeEvalArg(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeTypeEvalArgRecurse(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeTypeEvalArgRecurse(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  Object arg,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeTypeEvalRecurse(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeTypeEvalRecurse(String type,
  se.krka.kahlua.vm.LuaClosure functionObj,
  int count,
  ArrayList<InventoryItem> result)`

  `ArrayList<InventoryItem>`

  `getSomeTypeRecurse(String type,
  int count)`

  `ArrayList<InventoryItem>`

  `getSomeTypeRecurse(String type,
  int count,
  ArrayList<InventoryItem> result)`

  `IsoGridSquare`

  `getSourceGrid()`

  `IsoGridSquare`

  `getSquare()`

  `String`

  `getTakeSound()`

  `float`

  `getTemprature()`

  `float`

  `getTotalFoodScore(SurvivorDesc desc)`

  `float`

  `getTotalWeaponScore(SurvivorDesc desc)`

  `String`

  `getType()`

  `private static int`

  `getUses(ItemContainer.InventoryItemList items)`

  `int`

  `getUsesRecurse(Predicate<InventoryItem> predicate)`

  `int`

  `getUsesType(String type)`

  `int`

  `getUsesTypeRecurse(String type)`

  `BaseVehicle`

  `getVehicle()`

  `VehicleDoor`

  `getVehicleDoor()`

  `VehiclePart`

  `getVehicleDoorPart()`

  `VehiclePart`

  `getVehiclePart()`

  `zombie.vehicles.VehiclePartOwner`

  `getVehiclePartOwner()`

  `VehicleDoor`

  `getVehicleSeatDoor()`

  `VehiclePart`

  `getVehicleSeatDoorPart()`

  `int`

  `getWaterContainerCount()`

  `int`

  `getWeightReduction()`

  `IsoWorldInventoryObject`

  `getWorldItem()`

  `Vector2`

  `getWorldPosition(Vector2 result)`

  `boolean`

  `hasRecipe(String recipe,
  IsoGameCharacter chr)`

  `boolean`

  `hasRecipe(String recipe,
  IsoGameCharacter chr,
  boolean recursive)`

  `boolean`

  `hasRoomFor(IsoGameCharacter chr,
  float weightVal)`

  `boolean`

  `hasRoomFor(IsoGameCharacter chr,
  float weightVal,
  float weightAddedToFloor)`

  `boolean`

  `hasRoomFor(IsoGameCharacter chr,
  InventoryItem item)`

  `boolean`

  `HasType(ItemType itemType)`

  `boolean`

  `hasWorldItem()`

  `InventoryItem`

  `haveThisKeyId(int keyId)`

  `boolean`

  `isActive()`

  `boolean`

  `isCorpse()`

  `boolean`

  `isDirty()`

  `boolean`

  `isDrawDirty()`

  `boolean`

  `isEmpty()`

  `boolean`

  `isEmptyOrUnwanted(IsoPlayer player)`

  `boolean`

  `isExistYet()`

  `boolean`

  `isExplored()`

  `boolean`

  `isFreezer()`

  `boolean`

  `isFridge()`

  `boolean`

  `isFull(IsoGameCharacter chr)`

  `boolean`

  `isHasBeenLooted()`

  `boolean`

  `isInCharacterInventory(IsoGameCharacter chr)`

  `boolean`

  `isInside(InventoryItem item)`

  `private boolean`

  `isInvalidClothingRackItem(InventoryItem item)`

  `boolean`

  `isIsDevice()`

  `boolean`

  `isItemAllowed(InventoryItem item)`

  `boolean`

  `isLockedToCharacter(IsoGameCharacter chr)`

  `boolean`

  `isMicrowave()`

  `static boolean`

  `isObjectPowered(IsoObject parent,
  boolean includeGenerators)`

  `boolean`

  `isOccupiedVehicleSeat()`

  `boolean`

  `isPowered()`

  `boolean`

  `isRemoveItemAllowed(InventoryItem item)`

  `boolean`

  `isShop()`

  `private static boolean`

  `isSquareInRoom(IsoGridSquare square)`

  `private static boolean`

  `isSquarePowered(IsoGridSquare square,
  boolean includeGenerators)`

  `boolean`

  `isStove()`

  `boolean`

  `isTemperatureChanging()`

  `boolean`

  `isVehiclePart()`

  `boolean`

  `isVehicleSeat()`

  `ArrayList<InventoryItem>`

  `load(ByteBuffer input,
  int worldVersion)`

  `void`

  `Remove(String itemTypes)`

  `void`

  `Remove(InventoryItem item)`

  `InventoryItem`

  `Remove(ItemType itemType)`

  `ArrayList<InventoryItem>`

  `RemoveAll(String itemType)`

  `ArrayList<InventoryItem>`

  `RemoveAll(String itemType,
  int count)`

  `void`

  `removeAllItems()`

  `void`

  `removeItemOnServer(InventoryItem item)`

  Deprecated.

  `void`

  `removeItemsFromProcessItems()`

  `boolean`

  `removeItemWithID(int id)`

  `boolean`

  `removeItemWithIDRecurse(int id)`

  `void`

  `RemoveOneOf(String string)`

  `InventoryItem`

  `RemoveOneOf(String string,
  boolean insideInv)`

  `void`

  `requestServerItemsForContainer()`

  `void`

  `requestSync()`

  `void`

  `reset()`

  `ArrayList<InventoryItem>`

  `save(ByteBuffer output)`

  `ArrayList<InventoryItem>`

  `save(ByteBuffer output,
  IsoGameCharacter noCompress)`

  `void`

  `setAcceptItemFunction(String functionName)`

  `void`

  `setActive(boolean active)`

  `void`

  `setAgeFactor(float ageFactor)`

  `void`

  `setCapacity(int capacity)`

  `void`

  `setCloseSound(String closeSound)`

  `void`

  `setContainerPosition(String containerPosition)`

  `void`

  `setCookingFactor(float cookingFactor)`

  `void`

  `setCustomName(String name)`

  `void`

  `setCustomTemperature(float newTemp)`

  `void`

  `setDirty(boolean dirty)`

  `void`

  `setDrawDirty(boolean b)`

  `void`

  `setExplored(boolean b)`

  `void`

  `setFreezerPosition(String freezerPosition)`

  `void`

  `setHasBeenLooted(boolean hasBeenLooted)`

  `void`

  `setIsDevice(boolean isDevice)`

  `void`

  `setItems(ArrayList<InventoryItem> items)`

  `void`

  `setOnlyAcceptCategory(String onlyAcceptCategory)`

  `void`

  `setOpenSound(String openSound)`

  `void`

  `setParent(IsoObject parent)`

  `void`

  `setPutSound(String putSound)`

  `void`

  `setSourceGrid(IsoGridSquare sourceGrid)`

  `void`

  `setTakeSound(String takeSound)`

  `void`

  `setType(String type)`

  `void`

  `setWeightReduction(int weightReduction)`

  `InventoryItem`

  `SpawnItem(String type)`

  `boolean`

  `SpawnItem(String type,
  float useDelta)`

  `void`

  `SpawnItem(InventoryItem item)`

  `void`

  `takeItemsFrom(ItemContainer other)`

  `private boolean`

  `testBroken(boolean test,
  InventoryItem item)`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### tempList

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> tempList
  + ### s\_tempObjects

    private static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../iso/IsoObject.html "class in zombie.iso")>> s\_tempObjects
  + ### active

    public boolean active
  + ### dirty

    private boolean dirty
  + ### isdevice

    public boolean isdevice
  + ### ageFactor

    public float ageFactor
  + ### cookingFactor

    public float cookingFactor
  + ### capacity

    public int capacity
  + ### containingItem

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") containingItem
  + ### items

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> items
  + ### includingObsoleteItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> includingObsoleteItems
  + ### parent

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") parent
  + ### sourceGrid

    public [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sourceGrid
  + ### vehiclePart

    public [VehiclePart](../vehicles/VehiclePart.html "class in zombie.vehicles") vehiclePart
  + ### inventoryContainer

    public [InventoryContainer](types/InventoryContainer.html "class in zombie.inventory.types") inventoryContainer
  + ### explored

    public boolean explored
  + ### type

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### id

    public int id
  + ### drawDirty

    private boolean drawDirty
  + ### customTemperature

    private float customTemperature
  + ### hasBeenLooted

    private boolean hasBeenLooted
  + ### openSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") openSound
  + ### closeSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") closeSound
  + ### putSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") putSound
  + ### takeSound

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") takeSound
  + ### onlyAcceptCategory

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onlyAcceptCategory
  + ### acceptItemFunction

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") acceptItemFunction
  + ### weightReduction

    private int weightReduction
  + ### containerPosition

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") containerPosition
  + ### freezerPosition

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") freezerPosition
  + ### MAX\_CAPACITY

    private static final int MAX\_CAPACITY

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemContainer.MAX_CAPACITY)
  + ### MAX\_CAPACITY\_BAG

    private static final int MAX\_CAPACITY\_BAG

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemContainer.MAX_CAPACITY_BAG)
  + ### MAX\_CAPACITY\_VEHICLE

    private static final int MAX\_CAPACITY\_VEHICLE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemContainer.MAX_CAPACITY_VEHICLE)
  + ### TYPE\_FRIDGE

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TYPE\_FRIDGE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemContainer.TYPE_FRIDGE)
  + ### TYPE\_FREEZER

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") TYPE\_FREEZER

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.inventory.ItemContainer.TYPE_FREEZER)
  + ### TL\_comparators

    private static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[ItemContainer.Comparators](ItemContainer.Comparators.html "class in zombie.inventory")> TL\_comparators
  + ### TL\_itemListPool

    private static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[ItemContainer.InventoryItemListPool](ItemContainer.InventoryItemListPool.html "class in zombie.inventory")> TL\_itemListPool
  + ### TL\_predicates

    private static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<[ItemContainer.Predicates](ItemContainer.Predicates.html "class in zombie.inventory")> TL\_predicates
* Constructor Details
  -------------------

  + ### ItemContainer

    public ItemContainer(int id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") containerName,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") parent)
  + ### ItemContainer

    public ItemContainer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") containerName,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") parent)
  + ### ItemContainer

    public ItemContainer(int id)
  + ### ItemContainer

    public ItemContainer()
* Method Details
  --------------

  + ### floatingPointCorrection

    public static float floatingPointCorrection(float val)
  + ### getCapacity

    public int getCapacity()
  + ### setCapacity

    public void setCapacity(int capacity)
  + ### FindAndReturnWaterItem

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") FindAndReturnWaterItem(int uses)
  + ### getItemFromTypeRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getItemFromTypeRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getEffectiveCapacity

    public int getEffectiveCapacity([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### hasRoomFor

    public boolean hasRoomFor([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### hasRoomFor

    public boolean hasRoomFor([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    float weightVal)
  + ### hasRoomFor

    public boolean hasRoomFor([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    float weightVal,
    float weightAddedToFloor)
  + ### getFreeCapacity

    public float getFreeCapacity([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### isFull

    public boolean isFull([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### isInvalidClothingRackItem

    private boolean isInvalidClothingRackItem([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### isItemAllowed

    public boolean isItemAllowed([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### isRemoveItemAllowed

    public boolean isRemoveItemAllowed([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### isExplored

    public boolean isExplored()
  + ### setExplored

    public void setExplored(boolean b)
  + ### isInCharacterInventory

    public boolean isInCharacterInventory([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### isInside

    public boolean isInside([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### getContainingItem

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getContainingItem()
  + ### DoAddItem

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") DoAddItem([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### DoAddItemBlind

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") DoAddItemBlind([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### AddItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> AddItems([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int count)
  + ### addItem

    public <T extends [InventoryItem](InventoryItem.html "class in zombie.inventory")> T addItem([ItemKey](../scripting/objects/ItemKey.html "class in zombie.scripting.objects") item)
  + ### addItems

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> addItems([ItemKey](../scripting/objects/ItemKey.html "class in zombie.scripting.objects") item,
    int count)
  + ### AddItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> AddItems([InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    int count)
  + ### AddItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> AddItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> items)
  + ### getNumberOfItem

    public int getNumberOfItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") findItem,
    boolean includeReplaceOnDeplete)
  + ### getNumberOfItem

    public int getNumberOfItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") findItem)
  + ### getNumberOfItem

    public int getNumberOfItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") findItem,
    boolean includeReplaceOnDeplete,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ItemContainer](ItemContainer.html "class in zombie.inventory")> containers)
  + ### getNumberOfItem

    public int getNumberOfItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") findItem,
    boolean includeReplaceOnDeplete,
    boolean insideInv)
  + ### addItem

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") addItem([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### AddItem

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") AddItem([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### SpawnItem

    public void SpawnItem([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### AddItemBlind

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") AddItemBlind([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### SpawnItem

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") SpawnItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### AddItem

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") AddItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### SpawnItem

    public boolean SpawnItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    float useDelta)
  + ### AddItem

    public boolean AddItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    float useDelta)
  + ### AddItem

    public boolean AddItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    float useDelta,
    boolean synchSpawn)
  + ### contains

    public boolean contains([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### containsWithModule

    public boolean containsWithModule([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") moduleType)
  + ### containsWithModule

    public boolean containsWithModule([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") moduleType,
    boolean withDeltaLeft)
  + ### removeItemOnServer

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public void removeItemOnServer([InventoryItem](InventoryItem.html "class in zombie.inventory") item)

    Deprecated.
  + ### contains

    public boolean contains([InventoryItem](InventoryItem.html "class in zombie.inventory") itemToFind,
    boolean doInv)
  + ### contains

    public boolean contains(zombie.util.lambda.Invokers.Params2.Boolean.IParam2<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate,
    boolean doInv)
  + ### contains

    public <T> boolean contains(T itemToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate,
    boolean doInv)
  + ### findItem

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") findItem(zombie.util.lambda.Invokers.Params2.Boolean.IParam2<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate,
    boolean doInv)
  + ### findItem

    public <T> [InventoryItem](InventoryItem.html "class in zombie.inventory") findItem(T itemToCompare,
    zombie.util.lambda.Invokers.Params2.Boolean.ICallback<T, [InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate,
    boolean doInv)
  + ### findItem

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") findItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    boolean doInv,
    boolean ignoreBroken)
  + ### findHumanCorpseItem

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") findHumanCorpseItem()
  + ### containsHumanCorpse

    public boolean containsHumanCorpse()
  + ### contains

    public boolean contains([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    boolean doInv)
  + ### containsType

    public boolean containsType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### containsTypeRecurse

    public boolean containsTypeRecurse([ItemKey](../scripting/objects/ItemKey.html "class in zombie.scripting.objects") type)
  + ### containsTypeRecurse

    public boolean containsTypeRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### testBroken

    private boolean testBroken(boolean test,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### contains

    public boolean contains([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    boolean doInv,
    boolean ignoreBroken)
  + ### contains

    public boolean contains([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getAnimalInventoryItem

    public [AnimalInventoryItem](types/AnimalInventoryItem.html "class in zombie.inventory.types") getAnimalInventoryItem([IsoAnimal](../characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### canHumanCorpseFit

    public boolean canHumanCorpseFit([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### canItemFit

    public boolean canItemFit([InventoryItem](InventoryItem.html "class in zombie.inventory") item,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### isVehiclePart

    public boolean isVehiclePart()
  + ### isVehicleSeat

    public boolean isVehicleSeat()
  + ### isOccupiedVehicleSeat

    public boolean isOccupiedVehicleSeat()
  + ### getBestOf

    private static [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestOf([ItemContainer.InventoryItemList](ItemContainer.InventoryItemList.html "class in zombie.inventory") items,
    [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> comparator)
  + ### getBest

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBest([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate,
    [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> comparator)
  + ### getBestRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestRecurse([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate,
    [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> comparator)
  + ### getBestType

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> comparator)
  + ### getBestTypeRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestTypeRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> comparator)
  + ### getBestEval

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestEval(se.krka.kahlua.vm.LuaClosure predicateObj,
    se.krka.kahlua.vm.LuaClosure comparatorObj)
  + ### getBestEvalRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestEvalRecurse(se.krka.kahlua.vm.LuaClosure predicateObj,
    se.krka.kahlua.vm.LuaClosure comparatorObj)
  + ### getBestEvalArg

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestEvalArg(se.krka.kahlua.vm.LuaClosure predicateObj,
    se.krka.kahlua.vm.LuaClosure comparatorObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getBestEvalArgRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestEvalArgRecurse(se.krka.kahlua.vm.LuaClosure predicateObj,
    se.krka.kahlua.vm.LuaClosure comparatorObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getBestTypeEval

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestTypeEval([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure comparatorObj)
  + ### getBestTypeEvalRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestTypeEvalRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure comparatorObj)
  + ### getBestTypeEvalArg

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestTypeEvalArg([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure comparatorObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getBestTypeEvalArgRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestTypeEvalArgRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure comparatorObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getBestCondition

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestCondition([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate)
  + ### getBestConditionRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestConditionRecurse([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate)
  + ### getBestCondition

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestCondition([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getBestConditionRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestConditionRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getBestConditionEval

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestConditionEval(se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getBestConditionEvalRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestConditionEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getBestConditionEvalArg

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestConditionEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getBestConditionEvalArgRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestConditionEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getFirstEval

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstEval(se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getFirstEvalArg

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### containsEval

    public boolean containsEval(se.krka.kahlua.vm.LuaClosure functionObj)
  + ### containsEvalArg

    public boolean containsEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### containsEvalRecurse

    public boolean containsEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj)
  + ### containsEvalArgRecurse

    public boolean containsEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### containsTag

    public boolean containsTag([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag)
  + ### containsTagEval

    public boolean containsTagEval([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### containsTagRecurse

    public boolean containsTagRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag)
  + ### containsTagEvalRecurse

    public boolean containsTagEvalRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### containsTagEvalArgRecurse

    public boolean containsTagEvalArgRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### containsTypeEvalRecurse

    public boolean containsTypeEvalRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### containsTypeEvalArgRecurse

    public boolean containsTypeEvalArgRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### compareType

    private static boolean compareType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type1,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type2)
  + ### compareType

    private static boolean compareType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### getFirst

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirst([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate)
  + ### getFirstRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstRecurse([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate)
  + ### getSome

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSome([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeRecurse([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAll

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAll([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllRecurse([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllRecurse([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate)
  + ### getCount

    public int getCount([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate)
  + ### getCountRecurse

    public int getCountRecurse([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate)
  + ### getCountTag

    public int getCountTag([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag)
  + ### getCountTagEval

    public int getCountTagEval([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getCountTagEvalArg

    public int getCountTagEvalArg([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getCountTagRecurse

    public int getCountTagRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag)
  + ### getCountTagEvalRecurse

    public int getCountTagEvalRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getCountTagEvalArgRecurse

    public int getCountTagEvalArgRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getCountType

    public int getCountType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getCountTypeEval

    public int getCountTypeEval([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getCountTypeEvalArg

    public int getCountTypeEvalArg([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getCountTypeRecurse

    public int getCountTypeRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getCountTypeEvalRecurse

    public int getCountTypeEvalRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getCountTypeEvalArgRecurse

    public int getCountTypeEvalArgRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getCountEval

    public int getCountEval(se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getCountEvalArg

    public int getCountEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getCountEvalRecurse

    public int getCountEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getCountEvalArgRecurse

    public int getCountEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getFirstCategory

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### getFirstCategoryRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstCategoryRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### getFirstEvalRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getFirstEvalArgRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getFirstTag

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstTag([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag)
  + ### getFirstTagRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstTagRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag)
  + ### getFirstTagEval

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstTagEval([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getFirstTagEvalRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstTagEvalRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getFirstTagEvalArgRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstTagEvalArgRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getFirstType

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getFirstTypeRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstTypeRecurse([ItemKey](../scripting/objects/ItemKey.html "class in zombie.scripting.objects") key)
  + ### getFirstTypeRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstTypeRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getFirstTypeEval

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstTypeEval([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getFirstTypeEvalRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstTypeEvalRecurse([ItemKey](../scripting/objects/ItemKey.html "class in zombie.scripting.objects") key,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getFirstTypeEvalRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstTypeEvalRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getFirstTypeEvalArgRecurse

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstTypeEvalArgRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getSomeCategory

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeCategoryRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeCategoryRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeTag

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTag([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeTagEval

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTagEval([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeTagEvalArg

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTagEvalArg([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeTagRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTagRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeTagEvalRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTagEvalRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeTagEvalArgRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTagEvalArgRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeTypeEval

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTypeEval([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeTypeEvalArg

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTypeEvalArg([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeTypeRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTypeRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeTypeEvalRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTypeEvalRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeTypeEvalArgRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTypeEvalArgRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeEval

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeEval(se.krka.kahlua.vm.LuaClosure functionObj,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeEvalArg

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeEvalRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeEvalArgRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    int count,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllCategory

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllCategoryRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllCategoryRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllTag

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTag([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag)
  + ### getAllTag

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTag([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllTagEval

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTagEval([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllTagEvalArg

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTagEvalArg([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllTagRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTagRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllTagEvalRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTagEvalRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllTagEvalArgRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTagEvalArgRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllTypeEval

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTypeEval([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllTypeEvalArg

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTypeEvalArg([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllTypeRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTypeRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllTypeEvalRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTypeEvalRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllTypeEvalArgRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTypeEvalArgRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllEval

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllEval(se.krka.kahlua.vm.LuaClosure functionObj,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllEvalArg

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllEvalRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getAllEvalArgRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result)
  + ### getSomeCategory

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category,
    int count)
  + ### getSomeEval

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeEval(se.krka.kahlua.vm.LuaClosure functionObj,
    int count)
  + ### getSomeEvalArg

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    int count)
  + ### getSomeTypeEval

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTypeEval([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    int count)
  + ### getSomeTypeEvalArg

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTypeEvalArg([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    int count)
  + ### getSomeEvalRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
    int count)
  + ### getSomeEvalArgRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    int count)
  + ### getSomeTag

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTag([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    int count)
  + ### getSomeTagRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTagRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    int count)
  + ### getSomeTagEvalRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTagEvalRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    int count)
  + ### getSomeTagEvalArgRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTagEvalArgRecurse([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    int count)
  + ### getSomeType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int count)
  + ### getSomeTypeRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTypeRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int count)
  + ### getSomeTypeEvalRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTypeEvalRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    int count)
  + ### getSomeTypeEvalArgRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSomeTypeEvalArgRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg,
    int count)
  + ### getAll

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAll([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate)
  + ### getAllCategory

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### getAllEval

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllEval(se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getAllEvalArg

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllEvalArg(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getAllTagEval

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTagEval([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getAllTagEvalArg

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTagEvalArg([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getAllTypeEval

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTypeEval([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getAllTypeEvalArg

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTypeEvalArg([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getAllEvalRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllEvalRecurse(se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getAllEvalArgRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllEvalArgRecurse(se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### getAllType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getAllTypeRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTypeRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getAllTypeEvalRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTypeEvalRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj)
  + ### getAllTypeEvalArgRecurse

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllTypeEvalArgRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    se.krka.kahlua.vm.LuaClosure functionObj,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg)
  + ### FindAndReturnCategory

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") FindAndReturnCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### FindAndReturn

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> FindAndReturn([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int count)
  + ### FindAndReturn

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") FindAndReturn([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> itemToCheck)
  + ### FindAndReturn

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") FindAndReturn([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### FindAll

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> FindAll([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### FindAndReturnStack

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") FindAndReturnStack([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### FindAndReturnStack

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") FindAndReturnStack([InventoryItem](InventoryItem.html "class in zombie.inventory") itemlike)
  + ### HasType

    public boolean HasType([ItemType](../scripting/objects/ItemType.html "class in zombie.scripting.objects") itemType)
  + ### Remove

    public void Remove([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### DoRemoveItem

    public void DoRemoveItem([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### Remove

    public void Remove([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemTypes)
  + ### Remove

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") Remove([ItemType](../scripting/objects/ItemType.html "class in zombie.scripting.objects") itemType)
  + ### Find

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") Find([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### Find

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") Find([ItemType](../scripting/objects/ItemType.html "class in zombie.scripting.objects") itemType)
  + ### RemoveAll

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> RemoveAll([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType)
  + ### RemoveAll

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> RemoveAll([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    int count)
  + ### RemoveOneOf

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") RemoveOneOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") string,
    boolean insideInv)
  + ### RemoveOneOf

    public void RemoveOneOf([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") string)
  + ### getContentsWeight

    public float getContentsWeight()
  + ### getMaxWeight

    public float getMaxWeight()
  + ### getCapacityWeight

    public float getCapacityWeight()
  + ### getAvailableWeightCapacity

    public float getAvailableWeightCapacity()
  + ### isEmpty

    public boolean isEmpty()
  + ### isEmptyOrUnwanted

    public boolean isEmptyOrUnwanted([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### isMicrowave

    public boolean isMicrowave()
  + ### isSquareInRoom

    private static boolean isSquareInRoom([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### isSquarePowered

    private static boolean isSquarePowered([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    boolean includeGenerators)
  + ### isPowered

    public boolean isPowered()
  + ### isObjectPowered

    public static boolean isObjectPowered([IsoObject](../iso/IsoObject.html "class in zombie.iso") parent,
    boolean includeGenerators)
  + ### getTemprature

    public float getTemprature()
  + ### isTemperatureChanging

    public boolean isTemperatureChanging()
  + ### save

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") noCompress)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### save

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### load

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### isDrawDirty

    public boolean isDrawDirty()
  + ### setDrawDirty

    public void setDrawDirty(boolean b)
  + ### getBestWeapon

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestWeapon([SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters") desc)
  + ### getBestWeapon

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestWeapon()
  + ### getTotalFoodScore

    public float getTotalFoodScore([SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters") desc)
  + ### getTotalWeaponScore

    public float getTotalWeaponScore([SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters") desc)
  + ### getBestFood

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestFood([SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters") descriptor)
  + ### getBestBandage

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getBestBandage([SurvivorDesc](../characters/SurvivorDesc.html "class in zombie.characters") descriptor)
  + ### getNumItems

    public int getNumItems([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemLike)
  + ### isActive

    public boolean isActive()
  + ### setActive

    public void setActive(boolean active)
  + ### isDirty

    public boolean isDirty()
  + ### setDirty

    public void setDirty(boolean dirty)
  + ### isIsDevice

    public boolean isIsDevice()
  + ### setIsDevice

    public void setIsDevice(boolean isDevice)
  + ### getAgeFactor

    public float getAgeFactor()
  + ### setAgeFactor

    public void setAgeFactor(float ageFactor)
  + ### getCookingFactor

    public float getCookingFactor()
  + ### setCookingFactor

    public void setCookingFactor(float cookingFactor)
  + ### getItems

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getItems()
  + ### setItems

    public void setItems([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> items)
  + ### takeItemsFrom

    public void takeItemsFrom([ItemContainer](ItemContainer.html "class in zombie.inventory") other)
  + ### getParent

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") getParent()
  + ### setParent

    public void setParent([IsoObject](../iso/IsoObject.html "class in zombie.iso") parent)
  + ### getSourceGrid

    public [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getSourceGrid()
  + ### setSourceGrid

    public void setSourceGrid([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sourceGrid)
  + ### getType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getType()
  + ### setType

    public void setType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### clear

    public void clear()
  + ### getWaterContainerCount

    public int getWaterContainerCount()
  + ### FindWaterSource

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") FindWaterSource()
  + ### getAllWaterFillables

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllWaterFillables()
  + ### getFirstWaterFluidSources

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstWaterFluidSources(boolean includeTainted)
  + ### getFirstWaterFluidSources

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstWaterFluidSources(boolean includeTainted,
    boolean taintedPriority)
  + ### getFirstFluidContainer

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstFluidContainer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getAvailableFluidContainer

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAvailableFluidContainer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getAvailableFluidContainersCapacity

    public float getAvailableFluidContainersCapacity([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getFirstAvailableFluidContainer

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstAvailableFluidContainer([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getAllWaterFluidSources

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllWaterFluidSources(boolean includeTainted)
  + ### getFirstCleaningFluidSources

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getFirstCleaningFluidSources()
  + ### getAllCleaningFluidSources

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllCleaningFluidSources()
  + ### getItemCount

    public int getItemCount([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getItemCount

    public int getItemCount([ItemKey](../scripting/objects/ItemKey.html "class in zombie.scripting.objects") type)
  + ### getItemCountRecurse

    public int getItemCountRecurse([ItemKey](../scripting/objects/ItemKey.html "class in zombie.scripting.objects") type)
  + ### getItemCountRecurse

    public int getItemCountRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getItemCount

    public int getItemCount([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    boolean doBags)
  + ### getUses

    private static int getUses([ItemContainer.InventoryItemList](ItemContainer.InventoryItemList.html "class in zombie.inventory") items)
  + ### getUsesRecurse

    public int getUsesRecurse([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> predicate)
  + ### getUsesType

    public int getUsesType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getUsesTypeRecurse

    public int getUsesTypeRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getWeightReduction

    public int getWeightReduction()
  + ### setWeightReduction

    public void setWeightReduction(int weightReduction)
  + ### removeAllItems

    public void removeAllItems()
  + ### containsRecursive

    public boolean containsRecursive([InventoryItem](InventoryItem.html "class in zombie.inventory") item)
  + ### getItemCountFromTypeRecurse

    public int getItemCountFromTypeRecurse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getCustomTemperature

    public float getCustomTemperature()
  + ### setCustomTemperature

    public void setCustomTemperature(float newTemp)
  + ### getItemFromType

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getItemFromType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    boolean notEquipped,
    boolean ignoreBroken,
    boolean includeInv)
  + ### getItemFromTag

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getItemFromTag([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    boolean notEquipped,
    boolean ignoreBroken,
    boolean includeInv)
  + ### getItemFromType

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getItemFromType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    boolean ignoreBroken,
    boolean includeInv)
  + ### getItemFromTag

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getItemFromTag([ItemTag](../scripting/objects/ItemTag.html "class in zombie.scripting.objects") itemTag,
    boolean ignoreBroken,
    boolean includeInv)
  + ### getItemFromType

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getItemFromType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getItemsFromType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getItemsFromType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getItemsFromFullType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getItemsFromFullType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getItemsFromFullType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getItemsFromFullType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    boolean includeInv)
  + ### getItemsFromType

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getItemsFromType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    boolean includeInv)
  + ### getItemsFromCategory

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getItemsFromCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### requestSync

    public void requestSync()
  + ### requestServerItemsForContainer

    public void requestServerItemsForContainer()
  + ### getItemWithIDRecursiv

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getItemWithIDRecursiv(int id)
  + ### getItemWithID

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getItemWithID(int id)
  + ### removeItemWithID

    public boolean removeItemWithID(int id)
  + ### containsID

    public boolean containsID(int id)
  + ### removeItemWithIDRecurse

    public boolean removeItemWithIDRecurse(int id)
  + ### isHasBeenLooted

    public boolean isHasBeenLooted()
  + ### setHasBeenLooted

    public void setHasBeenLooted(boolean hasBeenLooted)
  + ### getOpenSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOpenSound()
  + ### setOpenSound

    public void setOpenSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") openSound)
  + ### getCloseSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCloseSound()
  + ### setCloseSound

    public void setCloseSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") closeSound)
  + ### getPutSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPutSound()
  + ### setPutSound

    public void setPutSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") putSound)
  + ### getTakeSound

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTakeSound()
  + ### setTakeSound

    public void setTakeSound([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") takeSound)
  + ### haveThisKeyId

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") haveThisKeyId(int keyId)
  + ### getOnlyAcceptCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOnlyAcceptCategory()
  + ### setOnlyAcceptCategory

    public void setOnlyAcceptCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") onlyAcceptCategory)
  + ### getAcceptItemFunction

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAcceptItemFunction()
  + ### setAcceptItemFunction

    public void setAcceptItemFunction([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") functionName)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### getCharacter

    public [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") getCharacter()
  + ### emptyIt

    public void emptyIt()
  + ### getItems4Admin

    public [LinkedHashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/LinkedHashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [InventoryItem](InventoryItem.html "class in zombie.inventory")> getItems4Admin()
  + ### getAllFoodsForAnimals

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllFoodsForAnimals()
  + ### getAllItems

    public [LinkedHashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/LinkedHashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [InventoryItem](InventoryItem.html "class in zombie.inventory")> getAllItems([LinkedHashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/LinkedHashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [InventoryItem](InventoryItem.html "class in zombie.inventory")> items,
    boolean inInv)
  + ### getItemById

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getItemById(long id)

    Deprecated.
  + ### addItemsToProcessItems

    public void addItemsToProcessItems()
  + ### removeItemsFromProcessItems

    public void removeItemsFromProcessItems()
  + ### isExistYet

    public boolean isExistYet()
  + ### getContainerPosition

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getContainerPosition()
  + ### setContainerPosition

    public void setContainerPosition([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") containerPosition)
  + ### getFreezerPosition

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFreezerPosition()
  + ### setFreezerPosition

    public void setFreezerPosition([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") freezerPosition)
  + ### getVehiclePart

    public [VehiclePart](../vehicles/VehiclePart.html "class in zombie.vehicles") getVehiclePart()
  + ### getVehiclePartOwner

    public zombie.vehicles.VehiclePartOwner getVehiclePartOwner()
  + ### getVehicle

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") getVehicle()
  + ### getVehicleDoorPart

    public [VehiclePart](../vehicles/VehiclePart.html "class in zombie.vehicles") getVehicleDoorPart()
  + ### getVehicleSeatDoorPart

    public [VehiclePart](../vehicles/VehiclePart.html "class in zombie.vehicles") getVehicleSeatDoorPart()
  + ### getVehicleSeatDoor

    public [VehicleDoor](../vehicles/VehicleDoor.html "class in zombie.vehicles") getVehicleSeatDoor()
  + ### getVehicleDoor

    public [VehicleDoor](../vehicles/VehicleDoor.html "class in zombie.vehicles") getVehicleDoor()
  + ### doesVehicleDoorNeedOpening

    public boolean doesVehicleDoorNeedOpening()
  + ### canCharacterOpenVehicleDoor

    public boolean canCharacterOpenVehicleDoor([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") playerObj)
  + ### canCharacterUnlockVehicleDoor

    public boolean canCharacterUnlockVehicleDoor([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") playerObj)
  + ### reset

    public void reset()
  + ### getOutermostContainer

    public [ItemContainer](ItemContainer.html "class in zombie.inventory") getOutermostContainer()
  + ### getSquare

    public [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getSquare()
  + ### getWorldItem

    public [IsoWorldInventoryObject](../iso/objects/IsoWorldInventoryObject.html "class in zombie.iso.objects") getWorldItem()
  + ### hasWorldItem

    public boolean hasWorldItem()
  + ### getWorldPosition

    public [Vector2](../iso/Vector2.html "class in zombie.iso") getWorldPosition([Vector2](../iso/Vector2.html "class in zombie.iso") result)
  + ### isStove

    public boolean isStove()
  + ### isShop

    public boolean isShop()
  + ### isCorpse

    public boolean isCorpse()
  + ### hasRecipe

    public boolean hasRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### hasRecipe

    public boolean hasRecipe([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    boolean recursive)
  + ### getRecipeItem

    public [InventoryItem](InventoryItem.html "class in zombie.inventory") getRecipeItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipe,
    [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    boolean recursive)
  + ### dumpContentsInSquare

    public void dumpContentsInSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### getCustomName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCustomName()
  + ### setCustomName

    public void setCustomName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getSoapList

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> getSoapList([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[InventoryItem](InventoryItem.html "class in zombie.inventory")> result,
    boolean includeLiquidSoap)
  + ### isFreezer

    public boolean isFreezer()
  + ### isFridge

    public boolean isFridge()
  + ### isLockedToCharacter

    public boolean isLockedToCharacter([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)