[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.randomizedWorld](package-summary.html)
2. [RandomizedWorldBase](RandomizedWorldBase.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [s\_tempVector2](#s_tempVector2)
   2. [minimumDays](#minimumDays)
   3. [maximumDays](#maximumDays)
   4. [minimumRooms](#minimumRooms)
   5. [unique](#unique)
   6. [rvsVehicleKeyAddedToZombie](#rvsVehicleKeyAddedToZombie)
   7. [isRat](#isRat)
   8. [name](#name)
   9. [debugLine](#debugLine)
   10. [reallyAlwaysForce](#reallyAlwaysForce)
   11. [barnClutter](#barnClutter)
   12. [bathroomSinkClutter](#bathroomSinkClutter)
   13. [bedClutter](#bedClutter)
   14. [beachPartyClutter](#beachPartyClutter)
   15. [bbqClutter](#bbqClutter)
   16. [cafeClutter](#cafeClutter)
   17. [carpentryToolClutter](#carpentryToolClutter)
   18. [deadEndClutter](#deadEndClutter)
   19. [dormClutter](#dormClutter)
   20. [farmStorageClutter](#farmStorageClutter)
   21. [footballNightDrinks](#footballNightDrinks)
   22. [footballNightSnacks](#footballNightSnacks)
   23. [garageStorageClutter](#garageStorageClutter)
   24. [gigamartClutter](#gigamartClutter)
   25. [groceryClutter](#groceryClutter)
   26. [hairSalonClutter](#hairSalonClutter)
   27. [hallClutter](#hallClutter)
   28. [henDoDrinks](#henDoDrinks)
   29. [henDoSnacks](#henDoSnacks)
   30. [hoedownClutter](#hoedownClutter)
   31. [housePartyClutter](#housePartyClutter)
   32. [judgeClutter](#judgeClutter)
   33. [kidClutter](#kidClutter)
   34. [kitchenSinkClutter](#kitchenSinkClutter)
   35. [kitchenCounterClutter](#kitchenCounterClutter)
   36. [kitchenStoveClutter](#kitchenStoveClutter)
   37. [laundryRoomClutter](#laundryRoomClutter)
   38. [livingRoomClutter](#livingRoomClutter)
   39. [medicalClutter](#medicalClutter)
   40. [murderSceneClutter](#murderSceneClutter)
   41. [nastyMattressClutter](#nastyMattressClutter)
   42. [oldShelterClutter](#oldShelterClutter)
   43. [officeCarDealerClutter](#officeCarDealerClutter)
   44. [officePaperworkClutter](#officePaperworkClutter)
   45. [officePenClutter](#officePenClutter)
   46. [officeOtherClutter](#officeOtherClutter)
   47. [officeTreatClutter](#officeTreatClutter)
   48. [ovenFoodClutter](#ovenFoodClutter)
   49. [pillowClutter](#pillowClutter)
   50. [pokerNightClutter](#pokerNightClutter)
   51. [richJerkClutter](#richJerkClutter)
   52. [sadCampsiteClutter](#sadCampsiteClutter)
   53. [sidetableClutter](#sidetableClutter)
   54. [survivalistCampsiteClutter](#survivalistCampsiteClutter)
   55. [twiggyClutter](#twiggyClutter)
   56. [utilityToolClutter](#utilityToolClutter)
   57. [vanCampClutter](#vanCampClutter)
   58. [watchClutter](#watchClutter)
   59. [woodcraftClutter](#woodcraftClutter)
6. [Constructor Details](#constructor-detail)
   1. [RandomizedWorldBase()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [addVehicle(Zone, IsoGridSquare, IsoChunk, String, String, IsoDirections)](#addVehicle(zombie.iso.zones.Zone,zombie.iso.IsoGridSquare,zombie.iso.IsoChunk,java.lang.String,java.lang.String,zombie.iso.IsoDirections))
   2. [addVehicleFlipped(Zone, IsoGridSquare, IsoChunk, String, String, Integer, IsoDirections, String)](#addVehicleFlipped(zombie.iso.zones.Zone,zombie.iso.IsoGridSquare,zombie.iso.IsoChunk,java.lang.String,java.lang.String,java.lang.Integer,zombie.iso.IsoDirections,java.lang.String))
   3. [addVehicleFlipped(Zone, float, float, float, float, String, String, Integer, String)](#addVehicleFlipped(zombie.iso.zones.Zone,float,float,float,float,java.lang.String,java.lang.String,java.lang.Integer,java.lang.String))
   4. [addVehicle(Zone, IsoGridSquare, IsoChunk, String, String, Integer, IsoDirections, String)](#addVehicle(zombie.iso.zones.Zone,zombie.iso.IsoGridSquare,zombie.iso.IsoChunk,java.lang.String,java.lang.String,java.lang.Integer,zombie.iso.IsoDirections,java.lang.String))
   5. [addVehicle(Zone, IsoGridSquare, IsoChunk, String, String, Integer, IsoDirections, String, boolean)](#addVehicle(zombie.iso.zones.Zone,zombie.iso.IsoGridSquare,zombie.iso.IsoChunk,java.lang.String,java.lang.String,java.lang.Integer,zombie.iso.IsoDirections,java.lang.String,boolean))
   6. [addVehicle(IsoGridSquare, IsoChunk, String, String, Integer, IsoDirections, String)](#addVehicle(zombie.iso.IsoGridSquare,zombie.iso.IsoChunk,java.lang.String,java.lang.String,java.lang.Integer,zombie.iso.IsoDirections,java.lang.String))
   7. [addVehicle(Zone, float, float, float, float, String, String, Integer, String)](#addVehicle(zombie.iso.zones.Zone,float,float,float,float,java.lang.String,java.lang.String,java.lang.Integer,java.lang.String))
   8. [addVehicle(Zone, float, float, float, float, String, String, Integer, String, boolean)](#addVehicle(zombie.iso.zones.Zone,float,float,float,float,java.lang.String,java.lang.String,java.lang.Integer,java.lang.String,boolean))
   9. [addVehicle(float, float, float, float, String, String, Integer, String)](#addVehicle(float,float,float,float,java.lang.String,java.lang.String,java.lang.Integer,java.lang.String))
   10. [addVehicle(float, float, float, float, String, String, Integer, String, boolean)](#addVehicle(float,float,float,float,java.lang.String,java.lang.String,java.lang.Integer,java.lang.String,boolean))
   11. [removeAllVehiclesOnZone(Zone)](#removeAllVehiclesOnZone(zombie.iso.zones.Zone))
   12. [addZombiesOnVehicle(int, String, Integer, BaseVehicle)](#addZombiesOnVehicle(int,java.lang.String,java.lang.Integer,zombie.vehicles.BaseVehicle))
   13. [createRandomDeadBody(RoomDef, int)](#createRandomDeadBody(zombie.iso.RoomDef,int))
   14. [addZombiesOnSquare(int, String, Integer, IsoGridSquare)](#addZombiesOnSquare(int,java.lang.String,java.lang.Integer,zombie.iso.IsoGridSquare))
   15. [createRandomDeadBody(int, int, int, IsoDirections, int)](#createRandomDeadBody(int,int,int,zombie.iso.IsoDirections,int))
   16. [createRandomDeadBody(int, int, int, IsoDirections, int, int)](#createRandomDeadBody(int,int,int,zombie.iso.IsoDirections,int,int))
   17. [createRandomDeadBody(IsoGridSquare, IsoDirections, int, int, String)](#createRandomDeadBody(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections,int,int,java.lang.String))
   18. [createRandomDeadBody(float, float, float, float, boolean, int, int, String)](#createRandomDeadBody(float,float,float,float,boolean,int,int,java.lang.String))
   19. [createRandomDeadBody(IsoGridSquare, IsoDirections, boolean, int, int, String, Integer)](#createRandomDeadBody(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections,boolean,int,int,java.lang.String,java.lang.Integer))
   20. [addTraitOfBlood(IsoDirections, int, int, int, int)](#addTraitOfBlood(zombie.iso.IsoDirections,int,int,int,int))
   21. [addTrailOfBlood(float, float, float, float, int)](#addTrailOfBlood(float,float,float,float,int))
   22. [addBloodSplat(IsoGridSquare, int)](#addBloodSplat(zombie.iso.IsoGridSquare,int))
   23. [setAttachedItem(IsoZombie, String, String, String)](#setAttachedItem(zombie.characters.IsoZombie,java.lang.String,java.lang.String,java.lang.String))
   24. [createRandomZombie(RoomDef)](#createRandomZombie(zombie.iso.RoomDef))
   25. [createRandomZombieForCorpse(RoomDef)](#createRandomZombieForCorpse(zombie.iso.RoomDef))
   26. [createBodyFromZombie(IsoGameCharacter)](#createBodyFromZombie(zombie.characters.IsoGameCharacter))
   27. [createRandomZombie(int, int, int)](#createRandomZombie(int,int,int))
   28. [isSquareClear(IsoGridSquare)](#isSquareClear(zombie.iso.IsoGridSquare))
   29. [isSquareClear(IsoGridSquare, IsoDirections)](#isSquareClear(zombie.iso.IsoGridSquare,zombie.iso.IsoDirections))
   30. [is1x1AreaClear(IsoGridSquare)](#is1x1AreaClear(zombie.iso.IsoGridSquare))
   31. [is1x2AreaClear(IsoGridSquare)](#is1x2AreaClear(zombie.iso.IsoGridSquare))
   32. [is2x1AreaClear(IsoGridSquare)](#is2x1AreaClear(zombie.iso.IsoGridSquare))
   33. [is2x1or1x2AreaClear(IsoGridSquare)](#is2x1or1x2AreaClear(zombie.iso.IsoGridSquare))
   34. [is2x2AreaClear(IsoGridSquare)](#is2x2AreaClear(zombie.iso.IsoGridSquare))
   35. [alignCorpseToSquare(IsoGameCharacter, IsoGridSquare)](#alignCorpseToSquare(zombie.characters.IsoGameCharacter,zombie.iso.IsoGridSquare))
   36. [getRandomRoom(BuildingDef, int)](#getRandomRoom(zombie.iso.BuildingDef,int))
   37. [getRandomRoomNoKids(BuildingDef, int)](#getRandomRoomNoKids(zombie.iso.BuildingDef,int))
   38. [getRoom(BuildingDef, String)](#getRoom(zombie.iso.BuildingDef,java.lang.String))
   39. [getRoomNoKids(BuildingDef, String)](#getRoomNoKids(zombie.iso.BuildingDef,java.lang.String))
   40. [getLivingRoomOrKitchen(BuildingDef)](#getLivingRoomOrKitchen(zombie.iso.BuildingDef))
   41. [canSpawnAt(IsoGridSquare)](#canSpawnAt(zombie.iso.IsoGridSquare))
   42. [getRandomSpawnSquare(RoomDef)](#getRandomSpawnSquare(zombie.iso.RoomDef))
   43. [getRandomSquareForCorpse(RoomDef)](#getRandomSquareForCorpse(zombie.iso.RoomDef))
   44. [spawnCarOnNearestNav(String, BuildingDef)](#spawnCarOnNearestNav(java.lang.String,zombie.iso.BuildingDef))
   45. [spawnCarOnNearestNav(String, BuildingDef, String)](#spawnCarOnNearestNav(java.lang.String,zombie.iso.BuildingDef,java.lang.String))
   46. [checkAreaForCarsSpawn(IsoGridSquare)](#checkAreaForCarsSpawn(zombie.iso.IsoGridSquare))
   47. [checkRadiusForCarSpawn(IsoGridSquare, int)](#checkRadiusForCarSpawn(zombie.iso.IsoGridSquare,int))
   48. [spawnCar(String, IsoGridSquare)](#spawnCar(java.lang.String,zombie.iso.IsoGridSquare))
   49. [spawnCar(String, IsoGridSquare, boolean)](#spawnCar(java.lang.String,zombie.iso.IsoGridSquare,boolean))
   50. [addItemOnGround(IsoGridSquare, String)](#addItemOnGround(zombie.iso.IsoGridSquare,java.lang.String))
   51. [addItemOnGroundNoLoot(IsoGridSquare, String)](#addItemOnGroundNoLoot(zombie.iso.IsoGridSquare,java.lang.String))
   52. [addItemOnGroundStatic(IsoGridSquare, String)](#addItemOnGroundStatic(zombie.iso.IsoGridSquare,java.lang.String))
   53. [addItemOnGround(IsoGridSquare, InventoryItem)](#addItemOnGround(zombie.iso.IsoGridSquare,zombie.inventory.InventoryItem))
   54. [addItemOnGround(IsoGridSquare, InventoryItem, boolean)](#addItemOnGround(zombie.iso.IsoGridSquare,zombie.inventory.InventoryItem,boolean))
   55. [addItemOnGroundNoLoot(IsoGridSquare, InventoryItem)](#addItemOnGroundNoLoot(zombie.iso.IsoGridSquare,zombie.inventory.InventoryItem))
   56. [addItemOnGroundStatic(IsoGridSquare, InventoryItem)](#addItemOnGroundStatic(zombie.iso.IsoGridSquare,zombie.inventory.InventoryItem))
   57. [addRandomItemsOnGround(RoomDef, String, int)](#addRandomItemsOnGround(zombie.iso.RoomDef,java.lang.String,int))
   58. [addRandomItemsOnGround(RoomDef, ArrayList, int)](#addRandomItemsOnGround(zombie.iso.RoomDef,java.util.ArrayList,int))
   59. [addRandomItemOnGround(IsoGridSquare, ArrayList)](#addRandomItemOnGround(zombie.iso.IsoGridSquare,java.util.ArrayList))
   60. [addWeapon(String, boolean)](#addWeapon(java.lang.String,boolean))
   61. [createSkeletonCorpse(RoomDef)](#createSkeletonCorpse(zombie.iso.RoomDef))
   62. [createSkeletonCorpse(IsoGridSquare)](#createSkeletonCorpse(zombie.iso.IsoGridSquare))
   63. [createCorpse(RoomDef)](#createCorpse(zombie.iso.RoomDef))
   64. [createCorpse(RoomDef, boolean)](#createCorpse(zombie.iso.RoomDef,boolean))
   65. [createCorpse(IsoGridSquare, boolean)](#createCorpse(zombie.iso.IsoGridSquare,boolean))
   66. [createCorpse(IsoGridSquare, IsoZombie)](#createCorpse(zombie.iso.IsoGridSquare,zombie.characters.IsoZombie))
   67. [isTimeValid(boolean)](#isTimeValid(boolean))
   68. [getName()](#getName())
   69. [getDebugLine()](#getDebugLine())
   70. [setDebugLine(String)](#setDebugLine(java.lang.String))
   71. [getMaximumDays()](#getMaximumDays())
   72. [setMaximumDays(int)](#setMaximumDays(int))
   73. [isUnique()](#isUnique())
   74. [isRat()](#isRat())
   75. [setUnique(boolean)](#setUnique(boolean))
   76. [getSq(int, int, int)](#getSq(int,int,int))
   77. [addTileObject(int, int, int, String)](#addTileObject(int,int,int,java.lang.String))
   78. [addTileObject(int, int, int, String, boolean)](#addTileObject(int,int,int,java.lang.String,boolean))
   79. [addTileObject(IsoGridSquare, String)](#addTileObject(zombie.iso.IsoGridSquare,java.lang.String))
   80. [addTileObject(IsoGridSquare, String, boolean)](#addTileObject(zombie.iso.IsoGridSquare,java.lang.String,boolean))
   81. [addTileObject(IsoGridSquare, IsoObject)](#addTileObject(zombie.iso.IsoGridSquare,zombie.iso.IsoObject))
   82. [addTileObject(IsoGridSquare, IsoObject, boolean)](#addTileObject(zombie.iso.IsoGridSquare,zombie.iso.IsoObject,boolean))
   83. [addSleepingBagOrTentNorthSouth(int, int, int)](#addSleepingBagOrTentNorthSouth(int,int,int))
   84. [addSleepingBagOrTentWestEast(int, int, int)](#addSleepingBagOrTentWestEast(int,int,int))
   85. [addRandomTentNorthSouth(int, int, int)](#addRandomTentNorthSouth(int,int,int))
   86. [addRandomTentWestEast(int, int, int)](#addRandomTentWestEast(int,int,int))
   87. [addRandomShelterNorthSouth(int, int, int)](#addRandomShelterNorthSouth(int,int,int))
   88. [addRandomShelterWestEast(int, int, int)](#addRandomShelterWestEast(int,int,int))
   89. [addTentNorthSouth(int, int, int)](#addTentNorthSouth(int,int,int))
   90. [addTentWestEast(int, int, int)](#addTentWestEast(int,int,int))
   91. [addMattressNorthSouth(int, int, int)](#addMattressNorthSouth(int,int,int))
   92. [addMattressWestEast(int, int, int)](#addMattressWestEast(int,int,int))
   93. [addSleepingBagNorthSouth(int, int, int)](#addSleepingBagNorthSouth(int,int,int))
   94. [addSleepingBagWestEast(int, int, int)](#addSleepingBagWestEast(int,int,int))
   95. [addShelterNorthSouth(int, int, int)](#addShelterNorthSouth(int,int,int))
   96. [addShelterWestEast(int, int, int)](#addShelterWestEast(int,int,int))
   97. [addTentNorthSouthNew(int, int, int)](#addTentNorthSouthNew(int,int,int))
   98. [addTentWestEastNew(int, int, int)](#addTentWestEastNew(int,int,int))
   99. [addTrailer(BaseVehicle, Zone, IsoChunk, String, String, String)](#addTrailer(zombie.vehicles.BaseVehicle,zombie.iso.zones.Zone,zombie.iso.IsoChunk,java.lang.String,java.lang.String,java.lang.String))
   100. [addCampfire(IsoGridSquare)](#addCampfire(zombie.iso.IsoGridSquare))
   101. [addSimpleCookingPit(IsoGridSquare)](#addSimpleCookingPit(zombie.iso.IsoGridSquare))
   102. [addCookingPit(IsoGridSquare)](#addCookingPit(zombie.iso.IsoGridSquare))
   103. [addBrazier(IsoGridSquare)](#addBrazier(zombie.iso.IsoGridSquare))
   104. [addSimpleFire(IsoGridSquare)](#addSimpleFire(zombie.iso.IsoGridSquare))
   105. [addRandomFirepit(IsoGridSquare)](#addRandomFirepit(zombie.iso.IsoGridSquare))
   106. [addCampfireOrPit(IsoGridSquare)](#addCampfireOrPit(zombie.iso.IsoGridSquare))
   107. [dirtBomb(IsoGridSquare)](#dirtBomb(zombie.iso.IsoGridSquare))
   108. [cleanSquareAndNeighbors(IsoGridSquare)](#cleanSquareAndNeighbors(zombie.iso.IsoGridSquare))
   109. [addCharcoalBurner(IsoGridSquare)](#addCharcoalBurner(zombie.iso.IsoGridSquare))
   110. [addWorkstationEntity(IsoGridSquare, GameEntityScript, String)](#addWorkstationEntity(zombie.iso.IsoGridSquare,zombie.scripting.entity.GameEntityScript,java.lang.String))
   111. [addWorkstationEntity(IsoThumpable, IsoGridSquare, GameEntityScript, String)](#addWorkstationEntity(zombie.iso.objects.IsoThumpable,zombie.iso.IsoGridSquare,zombie.scripting.entity.GameEntityScript,java.lang.String))
   112. [addItemToObjectSurface(String, IsoObject)](#addItemToObjectSurface(java.lang.String,zombie.iso.IsoObject))
   113. [isValidGraffSquare(IsoGridSquare, boolean, boolean)](#isValidGraffSquare(zombie.iso.IsoGridSquare,boolean,boolean))
   114. [graffSquare(IsoGridSquare, boolean)](#graffSquare(zombie.iso.IsoGridSquare,boolean))
   115. [graffSquare(IsoGridSquare, String, boolean)](#graffSquare(zombie.iso.IsoGridSquare,java.lang.String,boolean))
   116. [trashSquare(IsoGridSquare)](#trashSquare(zombie.iso.IsoGridSquare))
   117. [getBBQClutterItem()](#getBBQClutterItem())
   118. [getBBQClutter()](#getBBQClutter())
   119. [getBarnClutterItem()](#getBarnClutterItem())
   120. [getBarnClutter()](#getBarnClutter())
   121. [getBathroomSinkClutterItem()](#getBathroomSinkClutterItem())
   122. [getBathroomSinkClutter()](#getBathroomSinkClutter())
   123. [getBeachPartyClutterItem()](#getBeachPartyClutterItem())
   124. [getBeachPartyClutter()](#getBeachPartyClutter())
   125. [getBedClutterItem()](#getBedClutterItem())
   126. [getBedClutter()](#getBedClutter())
   127. [getCarpentryToolClutterItem()](#getCarpentryToolClutterItem())
   128. [getCarpentryToolClutter()](#getCarpentryToolClutter())
   129. [getCafeClutterItem()](#getCafeClutterItem())
   130. [getCafeClutter()](#getCafeClutter())
   131. [getDeadEndClutterItem()](#getDeadEndClutterItem())
   132. [getDeadEndClutter()](#getDeadEndClutter())
   133. [getDormClutterItem()](#getDormClutterItem())
   134. [getDormClutter()](#getDormClutter())
   135. [getFarmStorageClutterItem()](#getFarmStorageClutterItem())
   136. [getFarmStorageClutter()](#getFarmStorageClutter())
   137. [getFootballNightDrinkItem()](#getFootballNightDrinkItem())
   138. [getFootballNightDrinks()](#getFootballNightDrinks())
   139. [getFootballNightSnackItem()](#getFootballNightSnackItem())
   140. [getFootballNightSnacks()](#getFootballNightSnacks())
   141. [getGarageStorageClutterItem()](#getGarageStorageClutterItem())
   142. [getGarageStorageClutter()](#getGarageStorageClutter())
   143. [getGigamartClutterItem()](#getGigamartClutterItem())
   144. [getGigamartClutter()](#getGigamartClutter())
   145. [getGroceryClutterItem()](#getGroceryClutterItem())
   146. [getGroceryClutter()](#getGroceryClutter())
   147. [getHairSalonClutterItem()](#getHairSalonClutterItem())
   148. [getHairSalonClutter()](#getHairSalonClutter())
   149. [getHallClutterItem()](#getHallClutterItem())
   150. [getHallClutter()](#getHallClutter())
   151. [getHenDoDrinkItem()](#getHenDoDrinkItem())
   152. [getHenDoDrinks()](#getHenDoDrinks())
   153. [getHenDoSnackItem()](#getHenDoSnackItem())
   154. [getHenDoSnacks()](#getHenDoSnacks())
   155. [getHoedownClutterItem()](#getHoedownClutterItem())
   156. [getHoedownClutter()](#getHoedownClutter())
   157. [getHousePartyClutterItem()](#getHousePartyClutterItem())
   158. [getHousePartyClutter()](#getHousePartyClutter())
   159. [getJudgeClutterItem()](#getJudgeClutterItem())
   160. [getJudgeClutter()](#getJudgeClutter())
   161. [getKidClutterItem()](#getKidClutterItem())
   162. [getKidClutter()](#getKidClutter())
   163. [getKitchenCounterClutterItem()](#getKitchenCounterClutterItem())
   164. [getKitchenCounterClutter()](#getKitchenCounterClutter())
   165. [getKitchenSinkClutterItem()](#getKitchenSinkClutterItem())
   166. [getKitchenSinkClutter()](#getKitchenSinkClutter())
   167. [getKitchenStoveClutterItem()](#getKitchenStoveClutterItem())
   168. [getKitchenStoveClutter()](#getKitchenStoveClutter())
   169. [getLaundryRoomClutterItem()](#getLaundryRoomClutterItem())
   170. [getLaundryRoomClutter()](#getLaundryRoomClutter())
   171. [getLivingroomClutterItem()](#getLivingroomClutterItem())
   172. [getLivingroomClutter()](#getLivingroomClutter())
   173. [getMedicallutterItem()](#getMedicallutterItem())
   174. [getMedicalClutter()](#getMedicalClutter())
   175. [getMurderSceneClutterItem()](#getMurderSceneClutterItem())
   176. [getMurderSceneClutter()](#getMurderSceneClutter())
   177. [getNastyMattressClutterItem()](#getNastyMattressClutterItem())
   178. [getNastyMattressClutter()](#getNastyMattressClutter())
   179. [getOldShelterClutterItem()](#getOldShelterClutterItem())
   180. [getOldShelterClutter()](#getOldShelterClutter())
   181. [getOfficeCarDealerClutterItem()](#getOfficeCarDealerClutterItem())
   182. [getOfficeCarDealerClutter()](#getOfficeCarDealerClutter())
   183. [getOfficePaperworkClutterItem()](#getOfficePaperworkClutterItem())
   184. [getOfficePaperworkClutter()](#getOfficePaperworkClutter())
   185. [getOfficePenClutterItem()](#getOfficePenClutterItem())
   186. [getOfficePenClutter()](#getOfficePenClutter())
   187. [getOfficeOtherClutterItem()](#getOfficeOtherClutterItem())
   188. [getOfficeOtherClutter()](#getOfficeOtherClutter())
   189. [getOfficeTreatClutterItem()](#getOfficeTreatClutterItem())
   190. [getOfficeTreatClutter()](#getOfficeTreatClutter())
   191. [getOvenFoodClutterItem()](#getOvenFoodClutterItem())
   192. [getOvenFoodClutter()](#getOvenFoodClutter())
   193. [getPillowClutterItem()](#getPillowClutterItem())
   194. [getPillowClutter()](#getPillowClutter())
   195. [getPokerNightClutterItem()](#getPokerNightClutterItem())
   196. [getPokerNightClutter()](#getPokerNightClutter())
   197. [getRichJerkClutterItem()](#getRichJerkClutterItem())
   198. [getRichJerkClutter()](#getRichJerkClutter())
   199. [getSadCampsiteClutterItem()](#getSadCampsiteClutterItem())
   200. [getSadCampsiteClutter()](#getSadCampsiteClutter())
   201. [getSidetableClutterItem()](#getSidetableClutterItem())
   202. [getSidetableClutter()](#getSidetableClutter())
   203. [getSurvivalistCampsiteClutterItem()](#getSurvivalistCampsiteClutterItem())
   204. [getSurvivalistCampsiteClutter()](#getSurvivalistCampsiteClutter())
   205. [getTwiggyClutterItem()](#getTwiggyClutterItem())
   206. [getTwiggyClutter()](#getTwiggyClutter())
   207. [getUtilityToolClutterItem()](#getUtilityToolClutterItem())
   208. [getUtilityToolClutter()](#getUtilityToolClutter())
   209. [getVanCampClutterItem()](#getVanCampClutterItem())
   210. [getVanCampClutter()](#getVanCampClutter())
   211. [getWatchClutterItem()](#getWatchClutterItem())
   212. [getWatchClutter()](#getWatchClutter())
   213. [getWoodcraftClutterItem()](#getWoodcraftClutterItem())
   214. [getWoodcraftClutter()](#getWoodcraftClutter())
   215. [getClutterItem(ArrayList)](#getClutterItem(java.util.ArrayList))
   216. [getClutterCopy(ArrayList)](#getClutterCopy(java.util.ArrayList))
   217. [getClutterCopy(ArrayList, TIntObjectHashMap)](#getClutterCopy(java.util.ArrayList,gnu.trove.map.hash.TIntObjectHashMap))
   218. [trySpawnStoryItem(String, IsoGridSquare, float, float, float, boolean)](#trySpawnStoryItem(java.lang.String,zombie.iso.IsoGridSquare,float,float,float,boolean))
   219. [trySpawnStoryItem(String, IsoGridSquare, float, float, float)](#trySpawnStoryItem(java.lang.String,zombie.iso.IsoGridSquare,float,float,float))
   220. [trySpawnStoryItem(InventoryItem, IsoGridSquare, float, float, float)](#trySpawnStoryItem(zombie.inventory.InventoryItem,zombie.iso.IsoGridSquare,float,float,float))
   221. [trySpawnStoryItem(InventoryItem, ItemContainer)](#trySpawnStoryItem(zombie.inventory.InventoryItem,zombie.inventory.ItemContainer))
   222. [trySpawnStoryItem(String, IsoObject, Boolean)](#trySpawnStoryItem(java.lang.String,zombie.iso.IsoObject,java.lang.Boolean))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RandomizedWorldBase
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.randomizedWorld.RandomizedWorldBase

Direct Known Subclasses:
:   `RandomizedBuildingBase, RandomizedVehicleStoryBase, RandomizedZoneStoryBase`

---

public class RandomizedWorldBase
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<String>`

  `barnClutter`

  `private static final ArrayList<String>`

  `bathroomSinkClutter`

  `private static final ArrayList<String>`

  `bbqClutter`

  `private static final ArrayList<String>`

  `beachPartyClutter`

  `private static final ArrayList<String>`

  `bedClutter`

  `private static final ArrayList<String>`

  `cafeClutter`

  `private static final ArrayList<String>`

  `carpentryToolClutter`

  `private static final ArrayList<String>`

  `deadEndClutter`

  `protected String`

  `debugLine`

  `private static final ArrayList<String>`

  `dormClutter`

  `private static final ArrayList<String>`

  `farmStorageClutter`

  `private static final ArrayList<String>`

  `footballNightDrinks`

  `private static final ArrayList<String>`

  `footballNightSnacks`

  `private static final ArrayList<String>`

  `garageStorageClutter`

  `private static final ArrayList<String>`

  `gigamartClutter`

  `private static final ArrayList<String>`

  `groceryClutter`

  `private static final ArrayList<String>`

  `hairSalonClutter`

  `private static final ArrayList<String>`

  `hallClutter`

  `private static final ArrayList<String>`

  `henDoDrinks`

  `private static final ArrayList<String>`

  `henDoSnacks`

  `private static final ArrayList<String>`

  `hoedownClutter`

  `private static final ArrayList<String>`

  `housePartyClutter`

  `protected boolean`

  `isRat`

  `private static final ArrayList<String>`

  `judgeClutter`

  `private static final ArrayList<String>`

  `kidClutter`

  `private static final ArrayList<String>`

  `kitchenCounterClutter`

  `private static final ArrayList<String>`

  `kitchenSinkClutter`

  `private static final ArrayList<String>`

  `kitchenStoveClutter`

  `private static final ArrayList<String>`

  `laundryRoomClutter`

  `private static final ArrayList<String>`

  `livingRoomClutter`

  `protected int`

  `maximumDays`

  `private static final ArrayList<String>`

  `medicalClutter`

  `protected int`

  `minimumDays`

  `protected int`

  `minimumRooms`

  `private static final ArrayList<String>`

  `murderSceneClutter`

  `protected String`

  `name`

  `private static final ArrayList<String>`

  `nastyMattressClutter`

  `private static final ArrayList<String>`

  `officeCarDealerClutter`

  `private static final ArrayList<String>`

  `officeOtherClutter`

  `private static final ArrayList<String>`

  `officePaperworkClutter`

  `private static final ArrayList<String>`

  `officePenClutter`

  `private static final ArrayList<String>`

  `officeTreatClutter`

  `private static final ArrayList<String>`

  `oldShelterClutter`

  `private static final ArrayList<String>`

  `ovenFoodClutter`

  `private static final ArrayList<String>`

  `pillowClutter`

  `private static final ArrayList<String>`

  `pokerNightClutter`

  `protected boolean`

  `reallyAlwaysForce`

  `private static final ArrayList<String>`

  `richJerkClutter`

  `private boolean`

  `rvsVehicleKeyAddedToZombie`

  `private static final Vector2`

  `s_tempVector2`

  `private static final ArrayList<String>`

  `sadCampsiteClutter`

  `private static final ArrayList<String>`

  `sidetableClutter`

  `private static final ArrayList<String>`

  `survivalistCampsiteClutter`

  `private static final ArrayList<String>`

  `twiggyClutter`

  `protected boolean`

  `unique`

  `private static final ArrayList<String>`

  `utilityToolClutter`

  `private static final ArrayList<String>`

  `vanCampClutter`

  `private static final ArrayList<String>`

  `watchClutter`

  `private static final ArrayList<String>`

  `woodcraftClutter`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RandomizedWorldBase()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addBloodSplat(IsoGridSquare sq,
  int nbr)`

  `void`

  `addBrazier(IsoGridSquare sq)`

  `void`

  `addCampfire(IsoGridSquare sq)`

  `void`

  `addCampfireOrPit(IsoGridSquare sq)`

  `void`

  `addCharcoalBurner(IsoGridSquare sq)`

  `void`

  `addCookingPit(IsoGridSquare sq)`

  `InventoryItem`

  `addItemOnGround(IsoGridSquare square,
  String type)`

  `InventoryItem`

  `addItemOnGround(IsoGridSquare square,
  InventoryItem item)`

  `InventoryItem`

  `addItemOnGround(IsoGridSquare square,
  InventoryItem item,
  boolean fill)`

  `InventoryItem`

  `addItemOnGroundNoLoot(IsoGridSquare square,
  String type)`

  `InventoryItem`

  `addItemOnGroundNoLoot(IsoGridSquare square,
  InventoryItem item)`

  `static InventoryItem`

  `addItemOnGroundStatic(IsoGridSquare square,
  String type)`

  `static InventoryItem`

  `addItemOnGroundStatic(IsoGridSquare square,
  InventoryItem item)`

  `InventoryItem`

  `addItemToObjectSurface(String item,
  IsoObject object)`

  `void`

  `addMattressNorthSouth(int x,
  int y,
  int z)`

  `void`

  `addMattressWestEast(int x,
  int y,
  int z)`

  `void`

  `addRandomFirepit(IsoGridSquare sq)`

  `InventoryItem`

  `addRandomItemOnGround(IsoGridSquare square,
  ArrayList<String> types)`

  `void`

  `addRandomItemsOnGround(RoomDef room,
  String type,
  int count)`

  `void`

  `addRandomItemsOnGround(RoomDef room,
  ArrayList<String> types,
  int count)`

  `void`

  `addRandomShelterNorthSouth(int x,
  int y,
  int z)`

  `void`

  `addRandomShelterWestEast(int x,
  int y,
  int z)`

  `void`

  `addRandomTentNorthSouth(int x,
  int y,
  int z)`

  `void`

  `addRandomTentWestEast(int x,
  int y,
  int z)`

  `void`

  `addShelterNorthSouth(int x,
  int y,
  int z)`

  `void`

  `addShelterWestEast(int x,
  int y,
  int z)`

  `void`

  `addSimpleCookingPit(IsoGridSquare sq)`

  `void`

  `addSimpleFire(IsoGridSquare sq)`

  `void`

  `addSleepingBagNorthSouth(int x,
  int y,
  int z)`

  `void`

  `addSleepingBagOrTentNorthSouth(int x,
  int y,
  int z)`

  `void`

  `addSleepingBagOrTentWestEast(int x,
  int y,
  int z)`

  `void`

  `addSleepingBagWestEast(int x,
  int y,
  int z)`

  `void`

  `addTentNorthSouth(int x,
  int y,
  int z)`

  `void`

  `addTentNorthSouthNew(int x,
  int y,
  int z)`

  `void`

  `addTentWestEast(int x,
  int y,
  int z)`

  `void`

  `addTentWestEastNew(int x,
  int y,
  int z)`

  `IsoObject`

  `addTileObject(int x,
  int y,
  int z,
  String spriteName)`

  `IsoObject`

  `addTileObject(int x,
  int y,
  int z,
  String spriteName,
  boolean dirt)`

  `IsoObject`

  `addTileObject(IsoGridSquare sq,
  String spriteName)`

  `IsoObject`

  `addTileObject(IsoGridSquare sq,
  String spriteName,
  boolean dirt)`

  `IsoObject`

  `addTileObject(IsoGridSquare sq,
  IsoObject obj)`

  `IsoObject`

  `addTileObject(IsoGridSquare sq,
  IsoObject obj,
  boolean dirt)`

  `BaseVehicle`

  `addTrailer(BaseVehicle v,
  Zone zone,
  IsoChunk chunk,
  String zoneName,
  String vehicleDistrib,
  String trailerName)`

  `void`

  `addTrailOfBlood(float x,
  float y,
  float z,
  float direction,
  int count)`

  `void`

  `addTraitOfBlood(IsoDirections dir,
  int time,
  int x,
  int y,
  int z)`

  `BaseVehicle`

  `addVehicle(float vehicleX,
  float vehicleY,
  float vehicleZ,
  float direction,
  String zoneName,
  String scriptName,
  Integer skinIndex,
  String specificContainer)`

  `BaseVehicle`

  `addVehicle(float vehicleX,
  float vehicleY,
  float vehicleZ,
  float direction,
  String zoneName,
  String scriptName,
  Integer skinIndex,
  String specificContainer,
  boolean crashed)`

  `BaseVehicle`

  `addVehicle(IsoGridSquare sq,
  IsoChunk chunk,
  String zoneName,
  String scriptName,
  Integer skinIndex,
  IsoDirections dir,
  String specificContainer)`

  `BaseVehicle`

  `addVehicle(Zone zone,
  float vehicleX,
  float vehicleY,
  float vehicleZ,
  float direction,
  String zoneName,
  String scriptName,
  Integer skinIndex,
  String specificContainer)`

  `BaseVehicle`

  `addVehicle(Zone zone,
  float vehicleX,
  float vehicleY,
  float vehicleZ,
  float direction,
  String zoneName,
  String scriptName,
  Integer skinIndex,
  String specificContainer,
  boolean crashed)`

  `BaseVehicle`

  `addVehicle(Zone zone,
  IsoGridSquare sq,
  IsoChunk chunk,
  String zoneName,
  String scriptName,
  Integer skinIndex,
  IsoDirections dir,
  String specificContainer)`

  `BaseVehicle`

  `addVehicle(Zone zone,
  IsoGridSquare sq,
  IsoChunk chunk,
  String zoneName,
  String scriptName,
  Integer skinIndex,
  IsoDirections dir,
  String specificContainer,
  boolean crashed)`

  `BaseVehicle`

  `addVehicle(Zone zone,
  IsoGridSquare sq,
  IsoChunk chunk,
  String zoneName,
  String scriptName,
  IsoDirections dir)`

  `BaseVehicle`

  `addVehicleFlipped(Zone zone,
  float vehicleX,
  float vehicleY,
  float vehicleZ,
  float direction,
  String zoneName,
  String scriptName,
  Integer skinIndex,
  String specificContainer)`

  `BaseVehicle`

  `addVehicleFlipped(Zone zone,
  IsoGridSquare sq,
  IsoChunk chunk,
  String zoneName,
  String scriptName,
  Integer skinIndex,
  IsoDirections dir,
  String specificContainer)`

  `HandWeapon`

  `addWeapon(String type,
  boolean addRandomBullets)`

  Create and return a weapon, if it's ranged you can ask for some bullets in it

  `void`

  `addWorkstationEntity(IsoGridSquare sq,
  GameEntityScript script,
  String sprite)`

  `void`

  `addWorkstationEntity(IsoThumpable thumpable,
  IsoGridSquare sq,
  GameEntityScript script,
  String sprite)`

  `ArrayList<IsoZombie>`

  `addZombiesOnSquare(int totalZombies,
  String outfit,
  Integer femaleChance,
  IsoGridSquare square)`

  `ArrayList<IsoZombie>`

  `addZombiesOnVehicle(int totalZombies,
  String outfit,
  Integer femaleChance,
  BaseVehicle vehicle)`

  Add zombies near the vehicles, around a 4x4 square around it, avoiding being
  ON the vehicle invalid input: '&' randomizing square for each zombies

  `static void`

  `alignCorpseToSquare(IsoGameCharacter chr,
  IsoGridSquare square)`

  `private static boolean`

  `canSpawnAt(IsoGridSquare square)`

  `boolean`

  `checkAreaForCarsSpawn(IsoGridSquare square)`

  `boolean`

  `checkRadiusForCarSpawn(IsoGridSquare square,
  int radius)`

  `void`

  `cleanSquareAndNeighbors(IsoGridSquare sq)`

  `static IsoDeadBody`

  `createBodyFromZombie(IsoGameCharacter chr)`

  `IsoDeadBody`

  `createCorpse(IsoGridSquare freeSQ,
  boolean skeleton)`

  `IsoDeadBody`

  `createCorpse(IsoGridSquare freeSQ,
  IsoZombie zombie)`

  `IsoDeadBody`

  `createCorpse(RoomDef room)`

  `IsoDeadBody`

  `createCorpse(RoomDef room,
  boolean skeleton)`

  `static IsoDeadBody`

  `createRandomDeadBody(float x,
  float y,
  float z,
  float direction,
  boolean alignToSquare,
  int blood,
  int crawlerChance,
  String outfit)`

  `static IsoDeadBody`

  `createRandomDeadBody(int x,
  int y,
  int z,
  IsoDirections dir,
  int blood)`

  `static IsoDeadBody`

  `createRandomDeadBody(int x,
  int y,
  int z,
  IsoDirections dir,
  int blood,
  int crawlerChance)`

  `static IsoDeadBody`

  `createRandomDeadBody(IsoGridSquare sq,
  IsoDirections dir2,
  boolean alignToSquare,
  int blood,
  int crawlerChance,
  String outfit,
  Integer femaleChance)`

  `static IsoDeadBody`

  `createRandomDeadBody(IsoGridSquare sq,
  IsoDirections dir,
  int blood,
  int crawlerChance,
  String outfit)`

  `static IsoDeadBody`

  `createRandomDeadBody(RoomDef room,
  int blood)`

  `static IsoGameCharacter`

  `createRandomZombie(int x,
  int y,
  int z)`

  `static IsoGameCharacter`

  `createRandomZombie(RoomDef room)`

  `static IsoGameCharacter`

  `createRandomZombieForCorpse(RoomDef room)`

  `IsoDeadBody`

  `createSkeletonCorpse(IsoGridSquare freeSQ)`

  `IsoDeadBody`

  `createSkeletonCorpse(RoomDef room)`

  `void`

  `dirtBomb(IsoGridSquare sq)`

  `ArrayList<String>`

  `getBarnClutter()`

  `static String`

  `getBarnClutterItem()`

  `ArrayList<String>`

  `getBathroomSinkClutter()`

  `String`

  `getBathroomSinkClutterItem()`

  `ArrayList<String>`

  `getBBQClutter()`

  `String`

  `getBBQClutterItem()`

  `ArrayList<String>`

  `getBeachPartyClutter()`

  `String`

  `getBeachPartyClutterItem()`

  `ArrayList<String>`

  `getBedClutter()`

  `String`

  `getBedClutterItem()`

  `ArrayList<String>`

  `getCafeClutter()`

  `static String`

  `getCafeClutterItem()`

  `ArrayList<String>`

  `getCarpentryToolClutter()`

  `String`

  `getCarpentryToolClutterItem()`

  `gnu.trove.map.hash.TIntObjectHashMap<String>`

  `getClutterCopy(ArrayList<String> clutter)`

  `gnu.trove.map.hash.TIntObjectHashMap<String>`

  `getClutterCopy(ArrayList<String> clutter,
  gnu.trove.map.hash.TIntObjectHashMap<String> copy)`

  `static String`

  `getClutterItem(ArrayList<String> clutterArray)`

  `ArrayList<String>`

  `getDeadEndClutter()`

  `static String`

  `getDeadEndClutterItem()`

  `String`

  `getDebugLine()`

  `ArrayList<String>`

  `getDormClutter()`

  `static String`

  `getDormClutterItem()`

  `ArrayList<String>`

  `getFarmStorageClutter()`

  `static String`

  `getFarmStorageClutterItem()`

  `static String`

  `getFootballNightDrinkItem()`

  `ArrayList<String>`

  `getFootballNightDrinks()`

  `static String`

  `getFootballNightSnackItem()`

  `ArrayList<String>`

  `getFootballNightSnacks()`

  `ArrayList<String>`

  `getGarageStorageClutter()`

  `static String`

  `getGarageStorageClutterItem()`

  `ArrayList<String>`

  `getGigamartClutter()`

  `static String`

  `getGigamartClutterItem()`

  `ArrayList<String>`

  `getGroceryClutter()`

  `static String`

  `getGroceryClutterItem()`

  `ArrayList<String>`

  `getHairSalonClutter()`

  `static String`

  `getHairSalonClutterItem()`

  `ArrayList<String>`

  `getHallClutter()`

  `static String`

  `getHallClutterItem()`

  `static String`

  `getHenDoDrinkItem()`

  `ArrayList<String>`

  `getHenDoDrinks()`

  `static String`

  `getHenDoSnackItem()`

  `ArrayList<String>`

  `getHenDoSnacks()`

  `ArrayList<String>`

  `getHoedownClutter()`

  `String`

  `getHoedownClutterItem()`

  `ArrayList<String>`

  `getHousePartyClutter()`

  `String`

  `getHousePartyClutterItem()`

  `ArrayList<String>`

  `getJudgeClutter()`

  `static String`

  `getJudgeClutterItem()`

  `ArrayList<String>`

  `getKidClutter()`

  `String`

  `getKidClutterItem()`

  `ArrayList<String>`

  `getKitchenCounterClutter()`

  `String`

  `getKitchenCounterClutterItem()`

  `ArrayList<String>`

  `getKitchenSinkClutter()`

  `String`

  `getKitchenSinkClutterItem()`

  `ArrayList<String>`

  `getKitchenStoveClutter()`

  `String`

  `getKitchenStoveClutterItem()`

  `ArrayList<String>`

  `getLaundryRoomClutter()`

  `String`

  `getLaundryRoomClutterItem()`

  `ArrayList<String>`

  `getLivingroomClutter()`

  `String`

  `getLivingroomClutterItem()`

  `RoomDef`

  `getLivingRoomOrKitchen(BuildingDef bDef)`

  Get either the living room or kitchen (in this order)

  `int`

  `getMaximumDays()`

  `ArrayList<String>`

  `getMedicalClutter()`

  `static String`

  `getMedicallutterItem()`

  `ArrayList<String>`

  `getMurderSceneClutter()`

  `static String`

  `getMurderSceneClutterItem()`

  `String`

  `getName()`

  `ArrayList<String>`

  `getNastyMattressClutter()`

  `static String`

  `getNastyMattressClutterItem()`

  `ArrayList<String>`

  `getOfficeCarDealerClutter()`

  `static String`

  `getOfficeCarDealerClutterItem()`

  `ArrayList<String>`

  `getOfficeOtherClutter()`

  `static String`

  `getOfficeOtherClutterItem()`

  `ArrayList<String>`

  `getOfficePaperworkClutter()`

  `static String`

  `getOfficePaperworkClutterItem()`

  `ArrayList<String>`

  `getOfficePenClutter()`

  `static String`

  `getOfficePenClutterItem()`

  `ArrayList<String>`

  `getOfficeTreatClutter()`

  `static String`

  `getOfficeTreatClutterItem()`

  `ArrayList<String>`

  `getOldShelterClutter()`

  `static String`

  `getOldShelterClutterItem()`

  `ArrayList<String>`

  `getOvenFoodClutter()`

  `String`

  `getOvenFoodClutterItem()`

  `ArrayList<String>`

  `getPillowClutter()`

  `String`

  `getPillowClutterItem()`

  `ArrayList<String>`

  `getPokerNightClutter()`

  `String`

  `getPokerNightClutterItem()`

  `RoomDef`

  `getRandomRoom(BuildingDef bDef,
  int minArea)`

  Get a random room in the building

  `RoomDef`

  `getRandomRoomNoKids(BuildingDef bDef,
  int minArea)`

  `static IsoGridSquare`

  `getRandomSpawnSquare(RoomDef roomDef)`

  `static IsoGridSquare`

  `getRandomSquareForCorpse(RoomDef roomDef)`

  `ArrayList<String>`

  `getRichJerkClutter()`

  `String`

  `getRichJerkClutterItem()`

  `RoomDef`

  `getRoom(BuildingDef bDef,
  String roomName)`

  Return the wanted room

  `RoomDef`

  `getRoomNoKids(BuildingDef bDef,
  String roomName)`

  `ArrayList<String>`

  `getSadCampsiteClutter()`

  `String`

  `getSadCampsiteClutterItem()`

  `ArrayList<String>`

  `getSidetableClutter()`

  `String`

  `getSidetableClutterItem()`

  `static IsoGridSquare`

  `getSq(int x,
  int y,
  int z)`

  `ArrayList<String>`

  `getSurvivalistCampsiteClutter()`

  `String`

  `getSurvivalistCampsiteClutterItem()`

  `ArrayList<String>`

  `getTwiggyClutter()`

  `static String`

  `getTwiggyClutterItem()`

  `ArrayList<String>`

  `getUtilityToolClutter()`

  `String`

  `getUtilityToolClutterItem()`

  `ArrayList<String>`

  `getVanCampClutter()`

  `String`

  `getVanCampClutterItem()`

  `ArrayList<String>`

  `getWatchClutter()`

  `String`

  `getWatchClutterItem()`

  `ArrayList<String>`

  `getWoodcraftClutter()`

  `static String`

  `getWoodcraftClutterItem()`

  `void`

  `graffSquare(IsoGridSquare sq,
  boolean north)`

  `void`

  `graffSquare(IsoGridSquare sq,
  String sprite,
  boolean north)`

  `static boolean`

  `is1x1AreaClear(IsoGridSquare square)`

  `static boolean`

  `is1x2AreaClear(IsoGridSquare square)`

  `static boolean`

  `is2x1AreaClear(IsoGridSquare square)`

  `static boolean`

  `is2x1or1x2AreaClear(IsoGridSquare square)`

  `static boolean`

  `is2x2AreaClear(IsoGridSquare square)`

  `boolean`

  `isRat()`

  `private static boolean`

  `isSquareClear(IsoGridSquare square)`

  `private static boolean`

  `isSquareClear(IsoGridSquare square1,
  IsoDirections dir)`

  `boolean`

  `isTimeValid(boolean force)`

  Check if the world age is correct for our definition

  `boolean`

  `isUnique()`

  `boolean`

  `isValidGraffSquare(IsoGridSquare sq,
  boolean north,
  boolean recursive)`

  `static void`

  `removeAllVehiclesOnZone(Zone zone)`

  `void`

  `setAttachedItem(IsoZombie zombie,
  String location,
  String item,
  String ensureItem)`

  `void`

  `setDebugLine(String debugLine)`

  `void`

  `setMaximumDays(int maximumDays)`

  `void`

  `setUnique(boolean unique)`

  `private BaseVehicle`

  `spawnCar(String carName,
  IsoGridSquare square)`

  `private BaseVehicle`

  `spawnCar(String carName,
  IsoGridSquare square,
  boolean crashed)`

  `BaseVehicle`

  `spawnCarOnNearestNav(String carName,
  BuildingDef def)`

  `BaseVehicle`

  `spawnCarOnNearestNav(String carName,
  BuildingDef def,
  String distribution)`

  `void`

  `trashSquare(IsoGridSquare sq)`

  `static InventoryItem`

  `trySpawnStoryItem(String itemType,
  IsoGridSquare square,
  float x,
  float y,
  float z)`

  `InventoryItem`

  `trySpawnStoryItem(String itemType,
  IsoGridSquare square,
  float x,
  float y,
  float z,
  boolean fill)`

  `static InventoryItem`

  `trySpawnStoryItem(String itemType,
  IsoObject obj,
  Boolean randomRotation)`

  `InventoryItem`

  `trySpawnStoryItem(InventoryItem item,
  ItemContainer container)`

  `static InventoryItem`

  `trySpawnStoryItem(InventoryItem item,
  IsoGridSquare square,
  float x,
  float y,
  float z)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### s\_tempVector2

    private static final [Vector2](../iso/Vector2.html "class in zombie.iso") s\_tempVector2
  + ### minimumDays

    protected int minimumDays
  + ### maximumDays

    protected int maximumDays
  + ### minimumRooms

    protected int minimumRooms
  + ### unique

    protected boolean unique
  + ### rvsVehicleKeyAddedToZombie

    private boolean rvsVehicleKeyAddedToZombie
  + ### isRat

    protected boolean isRat
  + ### name

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### debugLine

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") debugLine
  + ### reallyAlwaysForce

    protected boolean reallyAlwaysForce
  + ### barnClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> barnClutter
  + ### bathroomSinkClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> bathroomSinkClutter
  + ### bedClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> bedClutter
  + ### beachPartyClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> beachPartyClutter
  + ### bbqClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> bbqClutter
  + ### cafeClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> cafeClutter
  + ### carpentryToolClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> carpentryToolClutter
  + ### deadEndClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> deadEndClutter
  + ### dormClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> dormClutter
  + ### farmStorageClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> farmStorageClutter
  + ### footballNightDrinks

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> footballNightDrinks
  + ### footballNightSnacks

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> footballNightSnacks
  + ### garageStorageClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> garageStorageClutter
  + ### gigamartClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> gigamartClutter
  + ### groceryClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> groceryClutter
  + ### hairSalonClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> hairSalonClutter
  + ### hallClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> hallClutter
  + ### henDoDrinks

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> henDoDrinks
  + ### henDoSnacks

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> henDoSnacks
  + ### hoedownClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> hoedownClutter
  + ### housePartyClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> housePartyClutter
  + ### judgeClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> judgeClutter
  + ### kidClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> kidClutter
  + ### kitchenSinkClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> kitchenSinkClutter
  + ### kitchenCounterClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> kitchenCounterClutter
  + ### kitchenStoveClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> kitchenStoveClutter
  + ### laundryRoomClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> laundryRoomClutter
  + ### livingRoomClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> livingRoomClutter
  + ### medicalClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> medicalClutter
  + ### murderSceneClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> murderSceneClutter
  + ### nastyMattressClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> nastyMattressClutter
  + ### oldShelterClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> oldShelterClutter
  + ### officeCarDealerClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> officeCarDealerClutter
  + ### officePaperworkClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> officePaperworkClutter
  + ### officePenClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> officePenClutter
  + ### officeOtherClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> officeOtherClutter
  + ### officeTreatClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> officeTreatClutter
  + ### ovenFoodClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> ovenFoodClutter
  + ### pillowClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> pillowClutter
  + ### pokerNightClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> pokerNightClutter
  + ### richJerkClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> richJerkClutter
  + ### sadCampsiteClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> sadCampsiteClutter
  + ### sidetableClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> sidetableClutter
  + ### survivalistCampsiteClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> survivalistCampsiteClutter
  + ### twiggyClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> twiggyClutter
  + ### utilityToolClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> utilityToolClutter
  + ### vanCampClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> vanCampClutter
  + ### watchClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> watchClutter
  + ### woodcraftClutter

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> woodcraftClutter
* Constructor Details
  -------------------

  + ### RandomizedWorldBase

    public RandomizedWorldBase()
* Method Details
  --------------

  + ### addVehicle

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") addVehicle([Zone](../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoChunk](../iso/IsoChunk.html "class in zombie.iso") chunk,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### addVehicleFlipped

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") addVehicleFlipped([Zone](../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoChunk](../iso/IsoChunk.html "class in zombie.iso") chunk,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") skinIndex,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") specificContainer)
  + ### addVehicleFlipped

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") addVehicleFlipped([Zone](../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    float vehicleX,
    float vehicleY,
    float vehicleZ,
    float direction,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") skinIndex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") specificContainer)
  + ### addVehicle

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") addVehicle([Zone](../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoChunk](../iso/IsoChunk.html "class in zombie.iso") chunk,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") skinIndex,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") specificContainer)
  + ### addVehicle

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") addVehicle([Zone](../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoChunk](../iso/IsoChunk.html "class in zombie.iso") chunk,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") skinIndex,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") specificContainer,
    boolean crashed)
  + ### addVehicle

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") addVehicle([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoChunk](../iso/IsoChunk.html "class in zombie.iso") chunk,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") skinIndex,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") specificContainer)
  + ### addVehicle

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") addVehicle([Zone](../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    float vehicleX,
    float vehicleY,
    float vehicleZ,
    float direction,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") skinIndex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") specificContainer)
  + ### addVehicle

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") addVehicle([Zone](../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    float vehicleX,
    float vehicleY,
    float vehicleZ,
    float direction,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") skinIndex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") specificContainer,
    boolean crashed)
  + ### addVehicle

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") addVehicle(float vehicleX,
    float vehicleY,
    float vehicleZ,
    float direction,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") skinIndex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") specificContainer)
  + ### addVehicle

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") addVehicle(float vehicleX,
    float vehicleY,
    float vehicleZ,
    float direction,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") skinIndex,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") specificContainer,
    boolean crashed)
  + ### removeAllVehiclesOnZone

    public static void removeAllVehiclesOnZone([Zone](../iso/zones/Zone.html "class in zombie.iso.zones") zone)
  + ### addZombiesOnVehicle

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> addZombiesOnVehicle(int totalZombies,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") femaleChance,
    [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle)

    Add zombies near the vehicles, around a 4x4 square around it, avoiding being
    ON the vehicle invalid input: '&' randomizing square for each zombies
  + ### createRandomDeadBody

    public static [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createRandomDeadBody([RoomDef](../iso/RoomDef.html "class in zombie.iso") room,
    int blood)
  + ### addZombiesOnSquare

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")> addZombiesOnSquare(int totalZombies,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") femaleChance,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### createRandomDeadBody

    public static [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createRandomDeadBody(int x,
    int y,
    int z,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir,
    int blood)
  + ### createRandomDeadBody

    public static [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createRandomDeadBody(int x,
    int y,
    int z,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir,
    int blood,
    int crawlerChance)
  + ### createRandomDeadBody

    public static [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createRandomDeadBody([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir,
    int blood,
    int crawlerChance,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit)
  + ### createRandomDeadBody

    public static [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createRandomDeadBody(float x,
    float y,
    float z,
    float direction,
    boolean alignToSquare,
    int blood,
    int crawlerChance,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit)
  + ### createRandomDeadBody

    public static [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createRandomDeadBody([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir2,
    boolean alignToSquare,
    int blood,
    int crawlerChance,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") femaleChance)
  + ### addTraitOfBlood

    public void addTraitOfBlood([IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir,
    int time,
    int x,
    int y,
    int z)
  + ### addTrailOfBlood

    public void addTrailOfBlood(float x,
    float y,
    float z,
    float direction,
    int count)
  + ### addBloodSplat

    public void addBloodSplat([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    int nbr)
  + ### setAttachedItem

    public void setAttachedItem([IsoZombie](../characters/IsoZombie.html "class in zombie.characters") zombie,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") location,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") ensureItem)
  + ### createRandomZombie

    public static [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") createRandomZombie([RoomDef](../iso/RoomDef.html "class in zombie.iso") room)
  + ### createRandomZombieForCorpse

    public static [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") createRandomZombieForCorpse([RoomDef](../iso/RoomDef.html "class in zombie.iso") room)
  + ### createBodyFromZombie

    public static [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createBodyFromZombie([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr)
  + ### createRandomZombie

    public static [IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") createRandomZombie(int x,
    int y,
    int z)
  + ### isSquareClear

    private static boolean isSquareClear([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### isSquareClear

    private static boolean isSquareClear([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square1,
    [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso") dir)
  + ### is1x1AreaClear

    public static boolean is1x1AreaClear([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### is1x2AreaClear

    public static boolean is1x2AreaClear([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### is2x1AreaClear

    public static boolean is2x1AreaClear([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### is2x1or1x2AreaClear

    public static boolean is2x1or1x2AreaClear([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### is2x2AreaClear

    public static boolean is2x2AreaClear([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### alignCorpseToSquare

    public static void alignCorpseToSquare([IsoGameCharacter](../characters/IsoGameCharacter.html "class in zombie.characters") chr,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getRandomRoom

    public [RoomDef](../iso/RoomDef.html "class in zombie.iso") getRandomRoom([BuildingDef](../iso/BuildingDef.html "class in zombie.iso") bDef,
    int minArea)

    Get a random room in the building
  + ### getRandomRoomNoKids

    public [RoomDef](../iso/RoomDef.html "class in zombie.iso") getRandomRoomNoKids([BuildingDef](../iso/BuildingDef.html "class in zombie.iso") bDef,
    int minArea)
  + ### getRoom

    public [RoomDef](../iso/RoomDef.html "class in zombie.iso") getRoom([BuildingDef](../iso/BuildingDef.html "class in zombie.iso") bDef,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") roomName)

    Return the wanted room
  + ### getRoomNoKids

    public [RoomDef](../iso/RoomDef.html "class in zombie.iso") getRoomNoKids([BuildingDef](../iso/BuildingDef.html "class in zombie.iso") bDef,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") roomName)
  + ### getLivingRoomOrKitchen

    public [RoomDef](../iso/RoomDef.html "class in zombie.iso") getLivingRoomOrKitchen([BuildingDef](../iso/BuildingDef.html "class in zombie.iso") bDef)

    Get either the living room or kitchen (in this order)
  + ### canSpawnAt

    private static boolean canSpawnAt([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### getRandomSpawnSquare

    public static [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getRandomSpawnSquare([RoomDef](../iso/RoomDef.html "class in zombie.iso") roomDef)
  + ### getRandomSquareForCorpse

    public static [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getRandomSquareForCorpse([RoomDef](../iso/RoomDef.html "class in zombie.iso") roomDef)
  + ### spawnCarOnNearestNav

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") spawnCarOnNearestNav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") carName,
    [BuildingDef](../iso/BuildingDef.html "class in zombie.iso") def)
  + ### spawnCarOnNearestNav

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") spawnCarOnNearestNav([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") carName,
    [BuildingDef](../iso/BuildingDef.html "class in zombie.iso") def,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") distribution)
  + ### checkAreaForCarsSpawn

    public boolean checkAreaForCarsSpawn([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### checkRadiusForCarSpawn

    public boolean checkRadiusForCarSpawn([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    int radius)
  + ### spawnCar

    private [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") spawnCar([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") carName,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### spawnCar

    private [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") spawnCar([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") carName,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    boolean crashed)
  + ### addItemOnGround

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") addItemOnGround([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### addItemOnGroundNoLoot

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") addItemOnGroundNoLoot([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### addItemOnGroundStatic

    public static [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") addItemOnGroundStatic([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### addItemOnGround

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") addItemOnGround([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### addItemOnGround

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") addItemOnGround([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    boolean fill)
  + ### addItemOnGroundNoLoot

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") addItemOnGroundNoLoot([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### addItemOnGroundStatic

    public static [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") addItemOnGroundStatic([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item)
  + ### addRandomItemsOnGround

    public void addRandomItemsOnGround([RoomDef](../iso/RoomDef.html "class in zombie.iso") room,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int count)
  + ### addRandomItemsOnGround

    public void addRandomItemsOnGround([RoomDef](../iso/RoomDef.html "class in zombie.iso") room,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> types,
    int count)
  + ### addRandomItemOnGround

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") addRandomItemOnGround([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> types)
  + ### addWeapon

    public [HandWeapon](../inventory/types/HandWeapon.html "class in zombie.inventory.types") addWeapon([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    boolean addRandomBullets)

    Create and return a weapon, if it's ranged you can ask for some bullets in it
  + ### createSkeletonCorpse

    public [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createSkeletonCorpse([RoomDef](../iso/RoomDef.html "class in zombie.iso") room)
  + ### createSkeletonCorpse

    public [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createSkeletonCorpse([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") freeSQ)
  + ### createCorpse

    public [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createCorpse([RoomDef](../iso/RoomDef.html "class in zombie.iso") room)
  + ### createCorpse

    public [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createCorpse([RoomDef](../iso/RoomDef.html "class in zombie.iso") room,
    boolean skeleton)
  + ### createCorpse

    public [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createCorpse([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") freeSQ,
    boolean skeleton)
  + ### createCorpse

    public [IsoDeadBody](../iso/objects/IsoDeadBody.html "class in zombie.iso.objects") createCorpse([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") freeSQ,
    [IsoZombie](../characters/IsoZombie.html "class in zombie.characters") zombie)
  + ### isTimeValid

    public boolean isTimeValid(boolean force)

    Check if the world age is correct for our definition
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getDebugLine

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDebugLine()
  + ### setDebugLine

    public void setDebugLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") debugLine)
  + ### getMaximumDays

    public int getMaximumDays()
  + ### setMaximumDays

    public void setMaximumDays(int maximumDays)
  + ### isUnique

    public boolean isUnique()
  + ### isRat

    public boolean isRat()
  + ### setUnique

    public void setUnique(boolean unique)
  + ### getSq

    public static [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") getSq(int x,
    int y,
    int z)
  + ### addTileObject

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") addTileObject(int x,
    int y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### addTileObject

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") addTileObject(int x,
    int y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName,
    boolean dirt)
  + ### addTileObject

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") addTileObject([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName)
  + ### addTileObject

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") addTileObject([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") spriteName,
    boolean dirt)
  + ### addTileObject

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") addTileObject([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") obj)
  + ### addTileObject

    public [IsoObject](../iso/IsoObject.html "class in zombie.iso") addTileObject([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") obj,
    boolean dirt)
  + ### addSleepingBagOrTentNorthSouth

    public void addSleepingBagOrTentNorthSouth(int x,
    int y,
    int z)
  + ### addSleepingBagOrTentWestEast

    public void addSleepingBagOrTentWestEast(int x,
    int y,
    int z)
  + ### addRandomTentNorthSouth

    public void addRandomTentNorthSouth(int x,
    int y,
    int z)
  + ### addRandomTentWestEast

    public void addRandomTentWestEast(int x,
    int y,
    int z)
  + ### addRandomShelterNorthSouth

    public void addRandomShelterNorthSouth(int x,
    int y,
    int z)
  + ### addRandomShelterWestEast

    public void addRandomShelterWestEast(int x,
    int y,
    int z)
  + ### addTentNorthSouth

    public void addTentNorthSouth(int x,
    int y,
    int z)
  + ### addTentWestEast

    public void addTentWestEast(int x,
    int y,
    int z)
  + ### addMattressNorthSouth

    public void addMattressNorthSouth(int x,
    int y,
    int z)
  + ### addMattressWestEast

    public void addMattressWestEast(int x,
    int y,
    int z)
  + ### addSleepingBagNorthSouth

    public void addSleepingBagNorthSouth(int x,
    int y,
    int z)
  + ### addSleepingBagWestEast

    public void addSleepingBagWestEast(int x,
    int y,
    int z)
  + ### addShelterNorthSouth

    public void addShelterNorthSouth(int x,
    int y,
    int z)
  + ### addShelterWestEast

    public void addShelterWestEast(int x,
    int y,
    int z)
  + ### addTentNorthSouthNew

    public void addTentNorthSouthNew(int x,
    int y,
    int z)
  + ### addTentWestEastNew

    public void addTentWestEastNew(int x,
    int y,
    int z)
  + ### addTrailer

    public [BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") addTrailer([BaseVehicle](../vehicles/BaseVehicle.html "class in zombie.vehicles") v,
    [Zone](../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoChunk](../iso/IsoChunk.html "class in zombie.iso") chunk,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneName,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") vehicleDistrib,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") trailerName)
  + ### addCampfire

    public void addCampfire([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### addSimpleCookingPit

    public void addSimpleCookingPit([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### addCookingPit

    public void addCookingPit([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### addBrazier

    public void addBrazier([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### addSimpleFire

    public void addSimpleFire([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### addRandomFirepit

    public void addRandomFirepit([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### addCampfireOrPit

    public void addCampfireOrPit([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### dirtBomb

    public void dirtBomb([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### cleanSquareAndNeighbors

    public void cleanSquareAndNeighbors([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### addCharcoalBurner

    public void addCharcoalBurner([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### addWorkstationEntity

    public void addWorkstationEntity([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [GameEntityScript](../scripting/entity/GameEntityScript.html "class in zombie.scripting.entity") script,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite)
  + ### addWorkstationEntity

    public void addWorkstationEntity([IsoThumpable](../iso/objects/IsoThumpable.html "class in zombie.iso.objects") thumpable,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [GameEntityScript](../scripting/entity/GameEntityScript.html "class in zombie.scripting.entity") script,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite)
  + ### addItemToObjectSurface

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") addItemToObjectSurface([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") object)
  + ### isValidGraffSquare

    public boolean isValidGraffSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    boolean north,
    boolean recursive)
  + ### graffSquare

    public void graffSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    boolean north)
  + ### graffSquare

    public void graffSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") sprite,
    boolean north)
  + ### trashSquare

    public void trashSquare([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### getBBQClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBBQClutterItem()
  + ### getBBQClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getBBQClutter()
  + ### getBarnClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBarnClutterItem()
  + ### getBarnClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getBarnClutter()
  + ### getBathroomSinkClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBathroomSinkClutterItem()
  + ### getBathroomSinkClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getBathroomSinkClutter()
  + ### getBeachPartyClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBeachPartyClutterItem()
  + ### getBeachPartyClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getBeachPartyClutter()
  + ### getBedClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBedClutterItem()
  + ### getBedClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getBedClutter()
  + ### getCarpentryToolClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCarpentryToolClutterItem()
  + ### getCarpentryToolClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getCarpentryToolClutter()
  + ### getCafeClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCafeClutterItem()
  + ### getCafeClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getCafeClutter()
  + ### getDeadEndClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDeadEndClutterItem()
  + ### getDeadEndClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getDeadEndClutter()
  + ### getDormClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDormClutterItem()
  + ### getDormClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getDormClutter()
  + ### getFarmStorageClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFarmStorageClutterItem()
  + ### getFarmStorageClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getFarmStorageClutter()
  + ### getFootballNightDrinkItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFootballNightDrinkItem()
  + ### getFootballNightDrinks

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getFootballNightDrinks()
  + ### getFootballNightSnackItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFootballNightSnackItem()
  + ### getFootballNightSnacks

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getFootballNightSnacks()
  + ### getGarageStorageClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGarageStorageClutterItem()
  + ### getGarageStorageClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getGarageStorageClutter()
  + ### getGigamartClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGigamartClutterItem()
  + ### getGigamartClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getGigamartClutter()
  + ### getGroceryClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getGroceryClutterItem()
  + ### getGroceryClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getGroceryClutter()
  + ### getHairSalonClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHairSalonClutterItem()
  + ### getHairSalonClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getHairSalonClutter()
  + ### getHallClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHallClutterItem()
  + ### getHallClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getHallClutter()
  + ### getHenDoDrinkItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHenDoDrinkItem()
  + ### getHenDoDrinks

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getHenDoDrinks()
  + ### getHenDoSnackItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHenDoSnackItem()
  + ### getHenDoSnacks

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getHenDoSnacks()
  + ### getHoedownClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHoedownClutterItem()
  + ### getHoedownClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getHoedownClutter()
  + ### getHousePartyClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getHousePartyClutterItem()
  + ### getHousePartyClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getHousePartyClutter()
  + ### getJudgeClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getJudgeClutterItem()
  + ### getJudgeClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getJudgeClutter()
  + ### getKidClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getKidClutterItem()
  + ### getKidClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getKidClutter()
  + ### getKitchenCounterClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getKitchenCounterClutterItem()
  + ### getKitchenCounterClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getKitchenCounterClutter()
  + ### getKitchenSinkClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getKitchenSinkClutterItem()
  + ### getKitchenSinkClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getKitchenSinkClutter()
  + ### getKitchenStoveClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getKitchenStoveClutterItem()
  + ### getKitchenStoveClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getKitchenStoveClutter()
  + ### getLaundryRoomClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLaundryRoomClutterItem()
  + ### getLaundryRoomClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getLaundryRoomClutter()
  + ### getLivingroomClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLivingroomClutterItem()
  + ### getLivingroomClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getLivingroomClutter()
  + ### getMedicallutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMedicallutterItem()
  + ### getMedicalClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getMedicalClutter()
  + ### getMurderSceneClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMurderSceneClutterItem()
  + ### getMurderSceneClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getMurderSceneClutter()
  + ### getNastyMattressClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getNastyMattressClutterItem()
  + ### getNastyMattressClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getNastyMattressClutter()
  + ### getOldShelterClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOldShelterClutterItem()
  + ### getOldShelterClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getOldShelterClutter()
  + ### getOfficeCarDealerClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOfficeCarDealerClutterItem()
  + ### getOfficeCarDealerClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getOfficeCarDealerClutter()
  + ### getOfficePaperworkClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOfficePaperworkClutterItem()
  + ### getOfficePaperworkClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getOfficePaperworkClutter()
  + ### getOfficePenClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOfficePenClutterItem()
  + ### getOfficePenClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getOfficePenClutter()
  + ### getOfficeOtherClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOfficeOtherClutterItem()
  + ### getOfficeOtherClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getOfficeOtherClutter()
  + ### getOfficeTreatClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOfficeTreatClutterItem()
  + ### getOfficeTreatClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getOfficeTreatClutter()
  + ### getOvenFoodClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOvenFoodClutterItem()
  + ### getOvenFoodClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getOvenFoodClutter()
  + ### getPillowClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPillowClutterItem()
  + ### getPillowClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getPillowClutter()
  + ### getPokerNightClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPokerNightClutterItem()
  + ### getPokerNightClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getPokerNightClutter()
  + ### getRichJerkClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRichJerkClutterItem()
  + ### getRichJerkClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getRichJerkClutter()
  + ### getSadCampsiteClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSadCampsiteClutterItem()
  + ### getSadCampsiteClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getSadCampsiteClutter()
  + ### getSidetableClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSidetableClutterItem()
  + ### getSidetableClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getSidetableClutter()
  + ### getSurvivalistCampsiteClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSurvivalistCampsiteClutterItem()
  + ### getSurvivalistCampsiteClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getSurvivalistCampsiteClutter()
  + ### getTwiggyClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTwiggyClutterItem()
  + ### getTwiggyClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getTwiggyClutter()
  + ### getUtilityToolClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUtilityToolClutterItem()
  + ### getUtilityToolClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getUtilityToolClutter()
  + ### getVanCampClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getVanCampClutterItem()
  + ### getVanCampClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getVanCampClutter()
  + ### getWatchClutterItem

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWatchClutterItem()
  + ### getWatchClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getWatchClutter()
  + ### getWoodcraftClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getWoodcraftClutterItem()
  + ### getWoodcraftClutter

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getWoodcraftClutter()
  + ### getClutterItem

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getClutterItem([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> clutterArray)
  + ### getClutterCopy

    public gnu.trove.map.hash.TIntObjectHashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getClutterCopy([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> clutter)
  + ### getClutterCopy

    public gnu.trove.map.hash.TIntObjectHashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getClutterCopy([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> clutter,
    gnu.trove.map.hash.TIntObjectHashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> copy)
  + ### trySpawnStoryItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") trySpawnStoryItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    float x,
    float y,
    float z,
    boolean fill)
  + ### trySpawnStoryItem

    public static [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") trySpawnStoryItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    float x,
    float y,
    float z)
  + ### trySpawnStoryItem

    public static [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") trySpawnStoryItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    [IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") square,
    float x,
    float y,
    float z)
  + ### trySpawnStoryItem

    public [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") trySpawnStoryItem([InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") item,
    [ItemContainer](../inventory/ItemContainer.html "class in zombie.inventory") container)
  + ### trySpawnStoryItem

    public static [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") trySpawnStoryItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [IsoObject](../iso/IsoObject.html "class in zombie.iso") obj,
    [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") randomRotation)