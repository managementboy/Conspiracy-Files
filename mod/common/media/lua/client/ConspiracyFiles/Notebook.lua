require "ISUI/ISCollapsableWindow"
require "ISUI/ISButton"
require "ISUI/ISScrollingListBox"
require "ISUI/ISRichTextPanel"
local Document=require("ConspiracyFiles/DocumentPane")
local Projection=require("ConspiracyFiles/NotebookProjection")
-- BEGIN generated PlaceNames hot-load copy (same source as Generated/PlaceNames.lua).
local PlaceNames=(function()
-- Derived named street segments from installed Build 42.20.4 streets.xml.
-- Source SHA256: 86172be118d99243ecbb6027ef4b82f2aa31590afcc7bbd776cffe9869482771
-- Coverage: Muldraugh trial region only; no house numbers inferred.
local roads={
    {"Carpenter Test Road",10525.0,9274.0,10525.0,11197.0},
    {"Boone Road",10064.0,9793.0,10064.0,9993.0},
    {"Boone Road",10064.0,9993.0,10079.0,10023.0},
    {"Boone Road",10079.0,10023.0,10091.0,10035.0},
    {"Boone Road",10091.0,10035.0,10123.0,10051.0},
    {"Boone Road",10123.0,10051.0,10521.0,10051.0},
    {"Old Mill Road",9908.0,9789.0,10332.0,9789.0},
    {"Old Mill Road",10332.0,9789.0,10436.0,9737.0},
    {"Old Mill Road",10436.0,9737.0,10521.0,9737.0},
    {"McCoy Road",10029.5,9785.0,10029.5,9552.0},
    {"McCoy Road",10029.5,9552.0,10036.0,9539.0},
    {"McCoy Road",10036.0,9539.0,10043.0,9532.0},
    {"McCoy Road",10043.0,9532.0,10056.0,9525.5},
    {"McCoy Road",10056.0,9525.5,10233.0,9525.5},
    {"McCoy Road",10233.0,9525.5,10245.0,9531.0},
    {"McCoy Road",10245.0,9531.0,10254.0,9541.0},
    {"McCoy Road",10254.0,9541.0,10259.5,9551.5},
    {"McCoy Road",10259.5,9551.5,10259.5,9709.0},
    {"McCoy Road",10259.5,9709.0,10267.5,9725.0},
    {"McCoy Road",10267.5,9725.0,10274.0,9731.0},
    {"McCoy Road",10274.0,9731.0,10333.0,9760.5},
    {"McCoy Road",10333.0,9760.5,10384.5,9760.5},
    {"Dixie Highway (Route 31W)",10592.0,8858.0,10592.0,11197.0},
    {"Old Bank Road",10599.0,9200.0,10625.0,9200.0},
    {"Old Bank Road",10625.0,9200.0,10632.0,9203.0},
    {"Old Bank Road",10632.0,9203.0,10639.5,9210.5},
    {"Old Bank Road",10639.5,9210.5,10643.0,9218.5},
    {"Old Bank Road",10643.0,9218.5,10643.0,9321.0},
    {"Old Bank Road",10643.0,9321.0,10649.0,9333.0},
    {"N Main St",10599.0,9336.5,10653.0,9336.5},
    {"N Main St",10653.0,9336.5,10664.0,9342.0},
    {"N Main St",10664.0,9342.0,10669.0,9347.0},
    {"N Main St",10669.0,9347.0,10675.0,9359.0},
    {"N Main St",10675.0,9359.0,10675.0,9430.0},
    {"N Main St",10675.0,9430.0,10671.0,9436.0},
    {"N Main St",10671.0,9436.0,10647.0,9460.0},
    {"N Main St",10647.0,9460.0,10644.0,9463.0},
    {"N Main St",10644.0,9463.0,10642.0,9468.0},
    {"N Main St",10642.0,9468.0,10642.0,9623.0},
    {"Walker Road",10674.0,9438.5,10761.0,9438.5},
    {"Walker Road",10761.0,9438.5,10771.5,9443.5},
    {"Walker Road",10771.5,9443.5,10785.0,9457.0},
    {"Walker Road",10785.0,9457.0,10798.0,9463.5},
    {"Walker Road",10798.0,9463.5,10938.0,9463.5},
    {"Harris Court",10671.0,9563.5,10724.0,9563.5},
    {"Harris Court",10724.0,9563.5,10729.0,9561.0},
    {"Harris Court",10729.0,9561.0,10733.0,9556.0},
    {"Harris Court",10733.0,9556.0,10732.5,9512.0},
    {"Harris St",10645.0,9509.5,10891.0,9509.5},
    {"S Main St",10599.0,9627.0,10705.0,9627.0},
    {"S Main St",10705.0,9627.0,10725.0,9637.0},
    {"S Main St",10725.0,9637.0,10739.0,9650.0},
    {"S Main St",10739.0,9650.0,10751.0,9676.0},
    {"S Main St",10751.0,9676.0,10751.0,9759.0},
    {"S Main St",10751.0,9759.0,10757.0,9771.0},
    {"S Main St",10757.0,9771.0,10763.0,9777.0},
    {"S Main St",10763.0,9777.0,10775.0,9783.0},
    {"S Main St",10775.0,9783.0,10798.0,9783.0},
    {"S Main St",10798.0,9783.0,10810.0,9789.0},
    {"S Main St",10810.0,9789.0,10814.0,9793.0},
    {"S Main St",10814.0,9793.0,10819.0,9803.0},
    {"S Main St",10819.0,9803.0,10819.0,9950.0},
    {"S Main St",10819.0,9950.0,10825.0,9963.0},
    {"S Main St",10825.0,9963.0,10831.0,9969.0},
    {"S Main St",10831.0,9969.0,10844.0,9976.0},
    {"S Main St",10844.0,9976.0,10911.0,9976.0},
    {"S Main St",10911.0,9976.0,10923.0,9982.0},
    {"S Main St",10923.0,9982.0,10929.0,9988.0},
    {"S Main St",10929.0,9988.0,10935.0,10000.0},
    {"S Main St",10935.0,10000.0,10935.0,10038.0},
    {"S Main St",10935.0,10038.0,10931.0,10046.0},
    {"S Main St",10931.0,10046.0,10925.0,10051.5},
    {"S Main St",10925.0,10051.5,10918.0,10055.0},
    {"S Main St",10918.0,10055.0,10846.0,10055.0},
    {"S Main St",10846.0,10055.0,10838.0,10059.0},
    {"S Main St",10838.0,10059.0,10829.0,10068.0},
    {"S Main St",10829.0,10068.0,10823.0,10079.5},
    {"S Main St",10823.0,10079.5,10823.0,10189.0},
    {"S Main St",10823.0,10189.0,10790.0,10255.0},
    {"S Main St",10790.0,10255.0,10790.0,10619.0},
    {"W Garnettsville Road",10599.0,9737.0,10747.0,9737.0},
    {"Sunstar Way",10664.0,9790.5,10712.0,9790.5},
    {"Mabel St",10714.5,9741.0,10714.5,9856.0},
    {"Franklin St",10599.0,9860.0,10815.0,9860.0},
    {"Wendell St",10599.0,9944.0,10815.0,9944.0},
    {"Hill St",10666.0,9864.0,10666.0,9940.0},
    {"Popar St",10739.0,9864.0,10739.0,9940.0},
    {"Irma Dr",11104.0,9318.0,11310.0,9318.0},
    {"Irma Dr",10925.5,9600.0,10925.5,9541.0},
    {"Irma Dr",10925.5,9541.0,10940.5,9511.0},
    {"Irma Dr",10940.5,9511.0,10940.5,9414.5},
    {"Irma Dr",10940.5,9414.5,10945.0,9406.0},
    {"Irma Dr",10945.0,9406.0,10947.0,9404.0},
    {"Irma Dr",10947.0,9404.0,10956.0,9399.5},
    {"Irma Dr",10956.0,9399.5,11029.0,9399.5},
    {"Irma Dr",11029.0,9399.5,11036.5,9395.5},
    {"Irma Dr",11036.5,9395.5,11041.0,9390.5},
    {"Irma Dr",11041.0,9390.5,11043.5,9385.0},
    {"Irma Dr",11043.5,9385.0,11043.5,9341.0},
    {"Irma Dr",11043.5,9341.0,11049.0,9330.0},
    {"Irma Dr",11049.0,9330.0,11055.0,9324.0},
    {"Irma Dr",11055.0,9324.0,11066.0,9318.5},
    {"Irma Dr",11066.0,9318.5,11101.0,9318.5},
    {"Irma Dr",11101.0,9318.5,11104.0,9318.0},
    {"Irma Dr",10823.0,9869.5,10925.0,9869.5},
    {"Irma Dr",10925.0,9869.5,10925.0,9600.0},
    {"Sandy Lane",10943.0,9509.0,11016.0,9509.0},
    {"Old Station Road",10928.0,9568.0,11030.0,9568.0},
    {"Stump Road",10874.0,9731.0,10874.0,9629.0},
    {"Stump Road",10874.0,9629.0,10923.0,9629.0},
    {"Red Arrow St",10898.0,9631.0,10898.0,9731.0},
    {"Circular St",10982.0,9660.0,10982.0,9631.0},
    {"Circular St",10982.0,9631.0,11015.0,9631.0},
    {"Circular St",11015.0,9631.0,11015.0,9660.0},
    {"Circular St",11015.0,9660.0,10983.0,9660.0},
    {"1st St",10927.0,9772.0,10989.0,9772.0},
    {"1st St",10989.0,9772.0,10989.0,9746.0},
    {"2nd St",10927.0,9744.0,11002.0,9744.0},
    {"2nd St",11002.0,9744.0,11002.0,9718.0},
    {"3rd St",10927.0,9716.0,11009.0,9716.0},
    {"3rd St",11009.0,9716.0,11009.0,9690.0},
    {"4th St",10927.0,9688.0,11009.0,9688.0},
    {"4th St",11009.0,9688.0,11009.0,9662.0},
    {"Matthew St",10870.0,9872.0,10870.0,9972.0},
    {"Hazelnut St",10927.5,9869.5,10987.0,9869.5},
    {"Hazelnut St",10987.0,9869.5,10999.5,9875.5},
    {"Hazelnut St",10999.5,9875.5,11002.0,9878.0},
    {"Hazelnut St",11002.0,9878.0,11006.0,9887.0},
    {"Hazelnut St",11006.0,9887.0,11006.0,9967.0},
    {"Hazelnut St",11006.0,9967.0,11002.0,9974.0},
    {"Hazelnut St",11002.0,9974.0,10995.0,9978.0},
    {"Hazelnut St",10995.0,9978.0,10936.0,9978.0},
    {"Hazelnut St",10936.0,9978.0,10928.0,9982.0},
    {"Elm Court",10773.5,10051.0,10773.5,10005.5},
    {"Elm Court",10773.5,10005.5,10815.5,10005.5},
    {"Elm Court",10815.5,10005.5,10821.0,10008.0},
    {"Elm Court",10821.0,10008.0,10824.0,10010.0},
    {"Elm Court",10824.0,10010.0,10828.0,10014.0},
    {"Elm Court",10828.0,10014.0,10832.0,10016.5},
    {"Elm Court",10832.0,10016.5,10855.0,10016.5},
    {"Lime St",10760.0,10053.0,10841.0,10053.0},
    {"Diesel St",10857.0,9980.0,10857.0,10051.0},
    {"Pattern St",10894.5,9980.0,10894.5,10051.0},
    {"Farmer's Lane",10705.5,9633.0,10705.5,9672.5},
    {"Farmer's Lane",10705.5,9672.5,10743.5,9672.5},
    {"Bank Road",10662.5,9631.0,10662.5,9695.5},
    {"Bank Road",10662.5,9695.5,10666.5,9695.5},
    {"Bank Road",10666.5,9695.5,10668.5,9697.5},
    {"Bank Road",10668.5,9697.5,10668.5,9732.5},
    {"Perrine St",10756.0,9948.0,10756.0,10056.5},
    {"Perrine St",10756.0,10056.5,10737.0,10094.0},
    {"Perrine St",10737.0,10094.0,10737.0,10611.0},
    {"Chenault St",10599.0,10674.0,10676.0,10674.0},
    {"Chenault St",10676.0,10674.0,10684.0,10670.0},
    {"Chenault St",10684.0,10670.0,10687.0,10667.0},
    {"Chenault St",10687.0,10667.0,10692.0,10658.0},
    {"Chenault St",10692.0,10658.0,10692.0,10635.0},
    {"Chenault St",10692.0,10635.0,10697.0,10625.0},
    {"Chenault St",10697.0,10625.0,10702.0,10620.0},
    {"Chenault St",10702.0,10620.0,10713.0,10615.0},
    {"Chenault St",10713.0,10615.0,10786.0,10615.0},
    {"Wilson St",10641.0,9948.0,10641.0,10159.0},
    {"Wilson St",10641.0,10159.0,10624.0,10193.0},
    {"Wilson St",10624.0,10193.0,10624.0,10447.0},
    {"Wilson St",10624.0,10447.0,10644.5,10489.0},
    {"Wilson St",10644.5,10489.0,10644.0,10570.0},
    {"Wilson St",10644.0,10570.0,10647.0,10577.0},
    {"Wilson St",10647.0,10577.0,10652.0,10581.0},
    {"Wilson St",10652.0,10581.0,10658.0,10584.0},
    {"Wilson St",10658.0,10584.0,10677.0,10584.0},
    {"Wilson St",10677.0,10584.0,10685.0,10589.0},
    {"Wilson St",10685.0,10589.0,10688.0,10592.0},
    {"Wilson St",10688.0,10592.0,10691.0,10598.0},
    {"Wilson St",10691.0,10598.0,10691.0,10610.0},
    {"Wilson St",10691.0,10610.0,10694.0,10616.0},
    {"Wilson St",10694.0,10616.0,10697.0,10619.0},
    {"Balsam St",10644.0,10068.5,10745.5,10068.5},
    {"E Maple St",10894.5,10059.0,10894.5,10133.0},
    {"E Maple St",10894.5,10133.0,10893.0,10136.0},
    {"E Maple St",10893.0,10136.0,10891.0,10138.0},
    {"E Maple St",10891.0,10138.0,10887.5,10139.5},
    {"E Maple St",10887.5,10139.5,10856.5,10139.5},
    {"E Maple St",10856.5,10139.5,10856.5,10223.5},
    {"Dewey St",10856.5,10059.0,10856.5,10137.0},
    {"Old Loop Road",10813.0,10217.5,10816.5,10219.5},
    {"Old Loop Road",10816.5,10219.5,10818.5,10222.0},
    {"Old Loop Road",10818.5,10222.0,10827.0,10226.0},
    {"Old Loop Road",10827.0,10226.0,10876.0,10226.0},
    {"Old Loop Road",10876.0,10226.0,10883.0,10230.0},
    {"Old Loop Road",10883.0,10230.0,10888.0,10235.0},
    {"Old Loop Road",10888.0,10235.0,10891.5,10241.5},
    {"Old Loop Road",10891.5,10241.5,10891.5,10294.0},
    {"Old Loop Road",10891.5,10294.0,10888.5,10299.5},
    {"Old Loop Road",10888.5,10299.5,10884.0,10304.0},
    {"Old Loop Road",10884.0,10304.0,10879.0,10306.5},
    {"Old Loop Road",10879.0,10306.5,10857.5,10306.5},
    {"Old Loop Road",10857.5,10306.5,10857.5,10417.5},
    {"Old Loop Road",10857.5,10417.5,10855.0,10423.0},
    {"Old Loop Road",10855.0,10423.0,10852.5,10426.0},
    {"Old Loop Road",10852.5,10426.0,10846.0,10430.0},
    {"Old Loop Road",10846.0,10430.0,10841.0,10430.5},
    {"Old Loop Road",10841.0,10430.5,10794.0,10430.5},
    {"Barn Way",10818.0,10303.0,10853.5,10303.0},
    {"Barn Way",10853.5,10303.0,10856.0,10305.5},
    {"Wood St",10657.0,10226.0,10798.0,10226.0},
    {"Twig St",10706.0,10159.0,10706.0,10224.0},
    {"Branch Dr",10644.0,10156.0,10733.0,10156.0},
    {"W Maple St",10644.0,10097.0,10669.0,10097.0},
    {"W Maple St",10669.0,10097.0,10669.0,10126.0},
    {"W Maple St",10669.0,10126.0,10644.0,10126.0},
    {"Perrine St",10741.0,10458.0,10786.0,10458.0},
    {"Sleeper Road",10513.0,8901.0,10513.0,9248.5},
    {"Sleeper Road",10513.0,9248.5,10525.0,9272.5},
    {"Sleeper Road",10525.0,9272.5,10525.0,9274.0},
    {"Station Road",11044.5,9096.0,11044.5,9316.0},
    {"Station Road",11044.5,9316.0,11047.0,9321.0},
    {"Station Road",11047.0,9321.0,11050.5,9324.5},
    {"Station Road",10963.0,8771.0,10963.0,9057.0},
    {"Station Road",10963.0,9057.0,10967.0,9064.0},
    {"Station Road",10967.0,9064.0,10970.0,9067.0},
    {"Station Road",10970.0,9067.0,10976.0,9069.0},
    {"Station Road",10976.0,9069.0,10984.0,9071.0},
    {"Station Road",10984.0,9071.0,10987.0,9075.0},
    {"Station Road",10987.0,9075.0,10989.0,9079.0},
    {"Station Road",10989.0,9079.0,10989.0,9082.0},
    {"Station Road",10989.0,9082.0,10992.0,9088.0},
    {"Station Road",10992.0,9088.0,10995.0,9091.0},
    {"Station Road",10995.0,9091.0,11001.0,9094.0},
    {"Station Road",11001.0,9094.0,11044.5,9094.0},
    {"Station Road",11044.5,9094.0,11044.5,9096.0},
    {"Magazine Road",11545.0,9746.0,11288.0,9746.0},
    {"Magazine Road",11288.0,9746.0,11262.0,9733.0},
    {"Magazine Road",11262.0,9733.0,11245.0,9716.0},
    {"Magazine Road",11245.0,9716.0,11231.0,9689.0},
    {"Magazine Road",11231.0,9689.0,11231.0,9417.0},
    {"Magazine Road",11231.0,9417.0,11239.0,9400.0},
    {"Magazine Road",11239.0,9400.0,11246.0,9393.0},
    {"Magazine Road",11246.0,9393.0,11262.0,9385.0},
    {"Magazine Road",11262.0,9385.0,11289.0,9385.0},
    {"Magazine Road",11289.0,9385.0,11300.0,9379.5},
    {"Magazine Road",11300.0,9379.5,11306.5,9373.0},
    {"Magazine Road",11306.5,9373.0,11312.0,9362.0},
    {"Magazine Road",11312.0,9362.0,11312.0,9313.0},
    {"Magazine Road",11312.0,9313.0,11319.0,9299.0},
    {"Magazine Road",11319.0,9299.0,11325.0,9293.0},
    {"Magazine Road",11325.0,9293.0,11333.0,9289.0},
    {"Magazine Road",11333.0,9289.0,11534.0,9289.0},
    {"Deerstalk Road",11331.0,9748.0,11331.0,9939.0},
    {"Deerstalk Road",11331.0,9939.0,11357.0,9992.0},
    {"Deerstalk Road",11357.0,9992.0,11416.0,10051.0},
    {"Deerstalk Road",11416.0,10051.0,11437.0,10093.0},
    {"Deerstalk Road",11437.0,10093.0,11437.0,10300.0},
    {"Deerstalk Road",11437.0,10300.0,11444.5,10315.0},
    {"Deerstalk Road",11444.5,10315.0,11459.5,10329.5},
    {"Deerstalk Road",11459.5,10329.5,11474.0,10337.0},
    {"Deerstalk Road",11474.0,10337.0,11601.0,10337.0},
    {"Inferno Road",9986.0,10878.0,10052.0,10878.0},
    {"Inferno Road",10052.0,10878.0,10052.0,10942.0},
    {"Inferno Road",10052.0,10942.0,10119.0,10942.0},
    {"Inferno Road",10119.0,10942.0,10127.0,10946.0},
    {"Inferno Road",10127.0,10946.0,10133.0,10952.0},
    {"Inferno Road",10133.0,10952.0,10137.0,10960.0},
    {"Inferno Road",10137.0,10960.0,10137.0,11197.0},
    {"Lizard Road",10790.0,10619.0,10790.0,10892.0},
    {"Lizard Road",10790.0,10892.0,10784.0,10904.0},
    {"Lizard Road",10784.0,10904.0,10774.0,10915.0},
    {"Lizard Road",10774.0,10915.0,10768.0,10924.0},
    {"Lizard Road",10768.0,10924.0,10768.0,10934.0},
    {"Lizard Road",10768.0,10934.0,10774.0,10947.0},
    {"Lizard Road",10774.0,10947.0,10782.0,10955.0},
    {"Lizard Road",10782.0,10955.0,10793.0,10961.0},
    {"Lizard Road",10793.0,10961.0,11100.0,10961.0},
    {"Lizard Road",11100.0,10961.0,11111.0,10967.0},
    {"Lizard Road",11111.0,10967.0,11115.0,10970.0},
    {"Lizard Road",11115.0,10970.0,11119.0,10975.0},
    {"Lizard Road",11119.0,10975.0,11122.0,10983.0},
    {"Lizard Road",11122.0,10983.0,11122.0,11018.0},
    {"W Maple St",10599.0,10097.0,10638.0,10097.0},
    {"Woodhaul Road",10229.5,9523.0,10229.5,9507.0},
    {"Woodhaul Road",10229.5,9507.0,10232.5,9500.5},
    {"Woodhaul Road",10232.5,9500.5,10239.5,9496.5},
    {"Woodhaul Road",10239.5,9496.5,10336.0,9496.5},
    {"Woodhaul Road",10336.0,9496.5,10438.0,9496.5},
    {"Woodhaul Road",10438.0,9496.5,10453.5,9488.5},
    {"Woodhaul Road",10453.5,9488.5,10460.0,9473.5},
    {"Woodhaul Road",10460.0,9473.5,10460.5,9410.5},
    {"Woodhaul Road",10460.5,9410.5,10465.0,9401.0},
    {"Woodhaul Road",10465.0,9401.0,10468.5,9398.0},
    {"Woodhaul Road",10468.5,9398.0,10477.5,9393.5},
    {"Woodhaul Road",10477.5,9393.5,10521.0,9393.5},
    {"Axhead Road",10402.5,9499.5,10402.5,9625.0},
    {"Axhead Road",10402.5,9625.0,10406.0,9632.0},
    {"Axhead Road",10406.0,9632.0,10410.5,9636.5},
    {"Axhead Road",10410.5,9636.5,10447.0,9636.5},
    {"Axhead Road",10447.0,9636.5,10521.0,9636.5},
    {"Old Muldraugh Station Branch Line",11815.5,10421.5,11390.5,10421.5},
    {"Old Muldraugh Station Branch Line",11390.5,10421.5,11022.5,10053.5},
    {"Old Muldraugh Station Branch Line",11022.5,10053.5,11022.5,9748.0},
    {"Old Muldraugh Station Branch Line",11022.5,9748.0,11035.5,9735.0},
    {"Old Muldraugh Station Branch Line",11035.5,9735.0,11035.5,9587.0},
    {"Old Muldraugh Station Branch Line",11035.5,9587.0,11054.0,9568.5},
    {"Old Muldraugh Station Branch Line",11054.0,9568.5,11098.0,9568.5},
    {"Old Muldraugh Station Branch Line",11098.0,9568.5,11102.5,9564.0},
    {"Old Muldraugh Station Branch Line",11102.5,9564.0,11102.5,9257.0},
    {"Old Muldraugh Station Branch Line",11102.5,9257.0,11102.5,9123.0},
    {"Old Muldraugh Station Branch Line",11102.5,9123.0,11147.0,9078.5},
    {"Old Muldraugh Station Branch Line",11147.0,9078.5,11547.0,9078.5},
    {"Hop Lane",10810.5,9785.5,10821.5,9774.5},
    {"Hop Lane",10821.5,9774.5,10826.5,9771.5},
    {"Hop Lane",10826.5,9771.5,10923.0,9772.0},
}
local P={}
local function center(site) local b=site.bounds; return (b.x1+b.x2-1)/2,(b.y1+b.y2-1)/2 end
function P.street(site)
    if site.buildLine~="42.20" and site.buildLine~="42.20.4" then return nil end
    if type(site.mapId)~="string" or not site.mapId:find("Muldraugh, KY",1,true) then return nil end
    local x,y=center(site)
    if x<10000 or x>11500 or y<9000 or y>11000 then return nil end
    local best,name=60*60,nil
    for _,r in ipairs(roads) do
        local dx,dy=r[4]-r[2],r[5]-r[3]
        local n=dx*dx+dy*dy
        local t=n>0 and math.max(0,math.min(1,((x-r[2])*dx+(y-r[3])*dy)/n)) or 0
        local d=(x-r[2]-t*dx)^2+(y-r[3]-t*dy)^2
        if d<best or (d==best and name and r[1]<name) then best,name=d,r[1] end
    end
    return name
end
local function legacy(site) return site.name=="Building at "..site.bounds.x1..", "..site.bounds.y1 end
local function replace(text,old,new)
    local parts,start={},1
    while true do
        local a,b=text:find(old,start,true)
        if not a then parts[#parts+1]=text:sub(start); break end
        parts[#parts+1]=text:sub(start,a-1); parts[#parts+1]=new; start=b+1
    end
    return table.concat(parts)
end
function P.labels(case)
    local labels={}
    for i,site in ipairs(case.locations) do
        if legacy(site) then
            local road=P.street(site)
            labels[site.id]=(i==1 and "the dispatch building" or "the receiving building")..(road and " near "..road or "")
        else labels[site.id]=site.name end -- already authored place name: preserve it
    end
    return labels
end
function P.render(body,case)
    if type(case)~="table" or type(case.locations)~="table" or #case.locations~=2 then return body end
    local a,b=case.locations[1],case.locations[2]
    if not legacy(a) and not legacy(b) then return body end
    local mentionsBoth=body:find(a.name,1,true) and body:find(b.name,1,true)
    local labels=P.labels(case)
    for _,site in ipairs(case.locations) do body=replace(body,site.name,labels[site.id]) end
    if mentionsBoth then
        local ax,ay=center(a); local bx,by=center(b); local dx,dy=bx-ax,by-ay
        local east=dx>=0 and "east" or "west"; local south=dy>=0 and "south" or "north"
        local direction=math.abs(dx)>math.abs(dy)*2 and east or math.abs(dy)>math.abs(dx)*2 and south or south..east
        local distance=math.sqrt(dx*dx+dy*dy)
        if distance>=1 then
            local steps=math.max(5,math.floor(distance/5+0.5)*5)
            body=body.."\n\nLOCATION GUIDE\nThe receiving building is roughly "..steps.." paces "..direction..
                " of the dispatch building."
        end
    end
    return body
end
return P
end)()
-- END generated PlaceNames hot-load copy.
ConspiracyFiles=ConspiracyFiles or {}
ConspiracyFiles.NotebookUI=ConspiracyFiles.NotebookUI or {}
local UI=ConspiracyFiles.NotebookUI
UI.VERSION="DEV-0.8.6-discovery-ledger"
local function safe(fn)
    local rt=ConspiracyFiles.Runtime
    if rt and not rt.disabled then return rt.boundary("ui",fn) end
    local ok,why=pcall(fn); if not ok then print("[CF-UI]|ERROR|"..tostring(why)) end; return ok
end
local function generated()
    local rt=ConspiracyFiles.GeneratedRuntime
    if not UI.probeState and rt and rt.metrics and rt.metrics() then return rt end
end
local function state()
    if UI.probeState then return UI.probeState end
    if generated() then return generated() end
    local rt=ConspiracyFiles.Runtime; return rt and not rt.disabled and rt.state
end
local function rect(width,height,geometry)
    local core=getCore(); local sw,sh=core:getScreenWidth(),core:getScreenHeight()
    local g=geometry or {}
    local function number(v,fallback) return type(v)=="number" and v==v and math.abs(v)<100000 and v or fallback end
    local w=math.max(320,math.min(number(g.width,width),sw-20))
    local h=math.max(260,math.min(number(g.height,height),sh-20))
    local x=math.max(0,math.min(number(g.x,math.floor((sw-w)/2)),sw-w))
    local y=math.max(0,math.min(number(g.y,math.floor((sh-h)/2)),sh-h))
    return x,y,w,h
end
local Reader=ISCollapsableWindow:derive("CFReaderWindow")
function Reader:createChildren()
    ISCollapsableWindow.createChildren(self); self:setResizable(true)
    self.document=Document:new(12,self:titleBarHeight()+12,self.width-24,self.height-self:titleBarHeight()-66)
    self.document:initialise(); self.document:instantiate(); self:addChild(self.document)
    self.document:setDocument(self.text,self.dark)
    self.closeButton=ISButton:new(self.width-108,self.height-42,94,30,"Close",self,Reader.close)
    self.closeButton:initialise(); self:addChild(self.closeButton)
end
function Reader:prerender()
    if self.lastW~=self.width or self.lastH~=self.height then
        self.document:setWidth(self.width-24); self.document:setHeight(self.height-self:titleBarHeight()-66)
        self.closeButton:setX(self.width-108); self.closeButton:setY(self.height-42)
        self.lastW,self.lastH=self.width,self.height
    end
    ISCollapsableWindow.prerender(self)
end
function Reader:isKeyConsumed(key) return key==Keyboard.KEY_PRIOR or key==Keyboard.KEY_NEXT end
function Reader:onKeyRelease(key)
    safe(function() if key==Keyboard.KEY_PRIOR then self.document:page(-1) elseif key==Keyboard.KEY_NEXT then self.document:page(1) end end)
end
function Reader:close()
    self:removeFromUIManager()
    if UI.reader==self then UI.reader=nil end
    if UI.help==self then UI.help=nil end
    if UI.notebook then UI.notebook:bringToTop() end
end
function Reader:new(title,text,dark)
    local x,y,w,h=rect(720,720)
    local o=ISCollapsableWindow.new(self,x,y,w,h)
    o:setTitle(title); o:setWantKeyEvents(true); o.minimumWidth=420; o.minimumHeight=320
    o.text,o.dark=text,dark; return o
end
function UI.openReader(title,body,context)
    safe(function()
        if UI.reader then UI.reader:close() end
        local text=(context and "WHAT THIS IS\n"..context.."\n\n" or "")..tostring(body or "Text unavailable.")
        UI.reader=Reader:new(title,text,UI.highContrast)
        UI.reader:initialise(); UI.reader:instantiate(); UI.reader:addToUIManager()
    end)
end
function UI.openHelp()
    safe(function()
        if UI.help then UI.help:bringToTop(); return end
        UI.help=Reader:new("About these notes", "SURVIVE FIRST\nThe notebook records what you encounter. It assigns no objectives and promises no final answer.\n\nINSPECT\nUse a document's action in your inventory or the Ground/loot inventory pane to read and record it.\n\nMARK INTERESTING\nTake an unusual object before marking it. Its original context stays in your notes even if you lose the object.\n\nNAVIGATION\nTab moves between Journal, Evidence, list, reading area, Help, contrast and Close. Arrow keys select list rows; Enter activates the focused control. Page Up/Down scroll the reading area.\n\nCLOSE\nUse the native X or Close button. Assign Conspiracy-Files: Toggle Survivor Notebook in the game's key bindings. Escape belongs to the game.\n\nController navigation has not been verified for this candidate.",true)
        if generated() then UI.help.text="SURVIVE FIRST\nThese notes record evidence you have inspected. They do not assign objectives.\n\nINSPECT\nTake a generated evidence item into your inventory, then choose Inspect Investigation Evidence.\n\nJOURNAL AND EVIDENCE\nJournal records discovery order. Evidence lets you select and review each item. Connections appear only between evidence items you have inspected.\n\nNAVIGATION\nUse the list and Journal/Evidence buttons. Tab and arrow keys navigate; Page Up/Down scroll. Contrast changes the reading colors. Use X or Close to dismiss." end
        UI.help.text=UI.help.text.."\n\nCLUE MAP MARKS\nNew clue pickups remember where you found them. After inspection, a pen or pencil in your inventory (including bags) adds their finding locations to the world map. Without a writing tool, markings wait and catch up when you acquire one. Existing marks remain if you drop the tool or document. Old discoveries without a recorded finding location cannot be mapped. Markers show notebook evidence numbers and titles.\n\nFINDING ADDRESSES\nThe planned address system uses Main Street or First Street as a town's starting line where suitable. Other towns use a fixed, named alternative. Numbers increase away from that starting line, with a new hundred-number range for each defined street block.\n\nOn east-west roads, odd numbers are on the north side and even numbers on the south. On north-south roads, odd numbers are on the east side and even numbers on the west.\n\nThese will be game addresses created by Conspiracy-Files, not real-world postal addresses. This build currently provides street names and relative directions; house numbers and town-by-town starting lines are not available yet."
        if ConspiracyFiles.AddressMap and ConspiracyFiles.AddressMap.ready() then
            local before=UI.help.text:find("\n\nFINDING ADDRESSES",1,true)
            if before then UI.help.text=UI.help.text:sub(1,before-1) end
            UI.help.text=UI.help.text.."\n\nMULDRAUGH ADDRESSES\nMain Street provides the east/west numbering baseline; First Street provides the north/south baseline. Successive street blocks use hundred-number ranges increasing away from those baselines.\n\nOdd numbers are on the north side of east-west roads and the east side of north-south roads. Even numbers are on the opposite sides. Curves follow the nearest road segment: mostly east-west or mostly north-south; exact diagonals use east-west.\n\nZoom in on your world map to read addresses on mapped buildings. Reading a paper map makes addresses available within the area it reveals.\n\nThese are fictional Conspiracy-Files addresses. They stay fixed in your save. Equally close streets use a stable street-name tie-break. Added addresses use free numbers, so later additions may appear out of sequence. Ambiguous buildings and detached storage without an established property relationship may have no label in this trial."
        end
        UI.help:initialise(); UI.help:instantiate(); UI.help:addToUIManager()
    end)
end
local Window=ISCollapsableWindow:derive("CFNotebookWindow")
local function fitRowText(text,width)
    local measure=function(value) return getTextManager():MeasureStringX(UIFont.Small,value) end
    if measure(text)<=width then return text end
    if measure("...")>width then return "" end
    local low,high,best=0,#text,"..."
    while low<=high do
        local middle=math.floor((low+high)/2); local finish=middle
        -- Do not split a UTF-8 character at the shortening boundary.
        while finish>0 do local nextByte=text:byte(finish+1); if not nextByte or nextByte<128 or nextByte>=192 then break end; finish=finish-1 end
        local candidate=text:sub(1,finish).."..."
        if measure(candidate)<=width then best=candidate; low=middle+1 else high=middle-1 end
    end
    return best
end
function Window:drawRow(y,item)
    local offset=self:getYScroll(); local top=y+offset
    if top+item.height<=0 or top>=self.height then return y+item.height end
    if self.selected==item.index then self:drawRect(0,y,self.width,item.height,0.8,0.28,0.32,0.25) end
    local fontHeight=getTextManager():getFontHeight(UIFont.Small)
    local width=math.max(0,self.width-32) -- padding and native scrollbar
    local signature=width..":"..fontHeight
    if item.cfTextSignature~=signature then
        item.cfTitle=fitRowText("#"..item.item.ordinal.."  "..item.item.title,width)
        item.cfSummary=fitRowText(item.item.summary,width)
        item.cfTextSignature=signature
    end
    -- Text may escape the native list stencil at large UI scales. Bound both
    -- lines explicitly instead of relying on the stencil for overflowing text.
    if top+4>=0 and top+4+fontHeight<=self.height then self:drawText(item.cfTitle,8,y+4,1,1,0.95,1,UIFont.Small) end
    if top+8+fontHeight>=0 and top+8+2*fontHeight<=self.height then self:drawText(item.cfSummary,8,y+8+fontHeight,0.90,0.90,0.85,1,UIFont.Small) end
    return y+item.height
end
function Window:showRow(row)
    if not row then return end
    self.currentId=row.id
    self.header:setText("<RGB:1,1,0.95> "..row.title:gsub("<","&lt;"):gsub(">","&gt;")); self.header:paginate()
    self.document:setDocument(row.detailText,UI.highContrast)
    if self.compact then self.detailOnly=true end
    self:layout()
end
local function generatedRows(section)
    local known=generated().known(); local titles,rows={},{}
    local wrapper=ModData and ModData.get and ModData.get("ConspiracyFiles.Generated.G2")
    local Cases=wrapper and require("ConspiracyFiles/Generated/SuccessiveCases")
    wrapper=Cases and Cases.current(wrapper)
    for _,r in ipairs(known) do titles[r.id]=r.title end
    local meanings={corroborates="Supports",['disputes-delivery']="Disputes delivery in",recontextualises="Adds context to"}
    for i,r in ipairs(known) do
        local root=Cases and Cases.find(wrapper,r.id);local case=root and root.case
        local addresses=case and ConspiracyFiles.AddressMap and ConspiracyFiles.AddressMap.describe(r.body,case)
        local detail=addresses or (case and PlaceNames.render(r.body,case) or r.body)
        local markers=ConspiracyFiles.ClueMarkers
        if markers and markers.note then
            local ok,note=pcall(markers.note,r.id)
            if ok and note then detail=detail.."\n\nMAP NOTE\n"..note end
        end
        for _,link in ipairs(r.connections or {}) do
            if titles[link.target] then detail=detail.."\n\n"..(meanings[link.kind] or "Connected to")..": "..titles[link.target] end
        end
        rows[i]={id=r.id,ordinal=i,title=section=="journal" and "Inspected "..r.title or r.title,
            summary=((require("ConspiracyFiles/Generated/EvidenceKinds").get(r.kind) or {}).label or "Evidence").." - Inspected - Discovery "..i,detailText=detail}
    end
    return rows
end
function Window:rows()
    if generated() then
        local rows=generatedRows(self.section)
        local observer=ConspiracyFiles.IdentityObserver
        if self.section=="journal" and observer then
            for _,row in ipairs(observer.rows()) do rows[#rows+1]=row end
        end
        local connections=ConspiracyFiles.KeyJournal
        if self.section=="journal" and connections then
            for _,row in ipairs(connections.rows()) do rows[#rows+1]=row end
        end
        -- One shared ledger decides order and numbering for every source, so
        -- the journal reflects real discovery order rather than source groups.
        local log=ConspiracyFiles.DiscoveryLog
        if log and log.order then rows=log.order(rows) else for index,row in ipairs(rows) do row.ordinal=index end end
        return rows
    end
    local current=state(); if not current then return {} end
    local rows=self.section=="evidence" and Projection.evidence(current) or Projection.journal(current)
    if self.section=="evidence" then
        local labels={available="Last seen in accessible belongings or nearby storage.",unknown="Its current whereabouts are uncertain.",untracked="These notes do not track the physical object.",unavailable="The physical object is no longer available.",conflict="The physical object cannot be identified reliably."}
        local rt=not UI.probeState and ConspiracyFiles.Runtime
        for _,row in ipairs(rows) do
            local e=current.resolveEvidence(row.id)
            local a=rt and e.assetId and rt.assignment(e.assetId)
            row.detailText=row.detailText.."\n\nPHYSICAL OBJECT\n"..(a and labels[a.availability] or labels.untracked)
        end
    end
    return rows
end
function Window:refresh(preferred)
    self.journal:setTitle(self.section=="journal" and "[Journal]" or "Journal")
    self.evidence:setTitle(self.section=="evidence" and "[Evidence]" or "Evidence")
    local rows=self:rows(); self.list:clear(); local selected=1
    for i,row in ipairs(rows) do self.list:addItem(row.title,row); if row.id==(preferred or self.currentId) then selected=i end end
    if #rows==0 then
        self.header:setText("<RGB:1,1,0.95> Nothing recorded yet"); self.header:paginate()
        self.document:setDocument("Inspect an unusual document or mark an acquired object worth remembering. The notebook records encounters; it does not assign objectives.",UI.highContrast)
        self:layout(); return
    end
    self.list.selected=selected; self:showRow(rows[selected])
end
function Window:onSection(button) self.section=button.internal; self.currentId=nil; self.detailOnly=false; self:refresh(); self:layout() end
function Window:onBack() self.detailOnly=false; self.focusIndex=3; self:layout() end
function Window:onContrast()
    UI.highContrast=not UI.highContrast; self:refresh()
    if UI.reader then UI.reader.document:setDocument(UI.reader.text,UI.highContrast) end
end
local function button(self,x,y,w,label,callback)
    local b=ISButton:new(x,y,w,32,label,self,function(target,control) safe(function() callback(target,control) end) end)
    b:initialise(); b:instantiate(); self:addChild(b); return b
end
function Window:createChildren()
    ISCollapsableWindow.createChildren(self); self:setResizable(true)
    self.journal=button(self,0,0,116,"Journal",Window.onSection); self.journal.internal="journal"
    self.evidence=button(self,0,0,116,"Evidence",Window.onSection); self.evidence.internal="evidence"
    self.help=button(self,0,0,116,"Help",function() UI.openHelp() end)
    self.contrast=button(self,0,0,116,"Contrast",Window.onContrast)
    self.closeButton=button(self,0,0,116,"Close",Window.close)
    self.back=button(self,12,0,116,"Back to list",Window.onBack)
    self.header=ISRichTextPanel:new(12,40,300,90); self.header:initialise(); self.header:instantiate()
    self.header.autosetheight=false; self.header.clip=true; self.header.background=false; self:addChild(self.header)
    self.document=Document:new(12,140,300,300); self.document:initialise(); self.document:instantiate(); self:addChild(self.document)
    self.list=ISScrollingListBox:new(12,40,280,350); self.list:initialise(); self.list:instantiate()
    self.list.itemheight=getTextManager():getFontHeight(UIFont.Small)*2+16; self.list.doDrawItem=Window.drawRow
    self.list:setOnMouseDownFunction(self,function(target,row) safe(function() target:showRow(row) end) end); self:addChild(self.list)
    self:layout(); self:refresh()
end
function Window:layout()
    if not self.list then return end
    local top=self:titleBarHeight()+12; local bottom=self:resizeWidgetHeight()+12
    local usable=self.width-152; local height=self.height-top-bottom
    local line=getTextManager():getFontHeight(UIFont.Small)
    local headerHeight=math.max(72,line*3+12)
    self.compact=usable<650
    local listWidth=self.compact and usable or math.floor(usable*0.35)
    local detailX=self.compact and 12 or 24+listWidth
    local detailW=self.compact and usable or usable-listWidth-12
    local showDetail=not self.compact or self.detailOnly==true
    self.back:setVisible(self.compact and self.detailOnly==true); self.back:setY(top)
    local extra=self.compact and 38 or 0
    self.list:setX(12); self.list:setY(top); self.list:setWidth(listWidth); self.list:setHeight(height)
    self.list:setVisible(not self.compact or not self.detailOnly)
    self.header:setX(detailX); self.header:setY(top+extra); self.header:setWidth(detailW); self.header:setHeight(headerHeight); self.header:setVisible(showDetail); self.header:paginate()
    self.document:setX(detailX); self.document:setY(top+extra+headerHeight); self.document:setWidth(detailW); self.document:setHeight(math.max(80,height-headerHeight-extra)); self.document:setVisible(showDetail)
    local controls={self.journal,self.evidence,self.help,self.contrast,self.closeButton}
    for i,b in ipairs(controls) do b:setX(self.width-128); b:setY(top+(i-1)*math.max(42,line+20)); b:setHeight(math.max(32,line+12)) end
    self.list.itemheight=line*2+16
end
function Window:prerender()
    local sw,sh=getCore():getScreenWidth(),getCore():getScreenHeight()
    local signature=self.width..":"..self.height..":"..sw..":"..sh..":"..getTextManager():getFontHeight(UIFont.Small)
    if signature~=self.signature then
        local x,y,w,h=rect(self.width,self.height,{x=self.x,y=self.y,width=math.max(500,self.width),height=math.max(420,self.height)})
        self:setX(x); self:setY(y); self:setWidth(w); self:setHeight(h); self:layout(); self.signature=signature
    end
    ISCollapsableWindow.prerender(self)
    UI.rememberWindow(self,true)
    local controls={self.journal,self.evidence,self.list,self.document,self.help,self.contrast,self.closeButton}
    local focused=controls[self.focusIndex or 3]
    if focused and focused:getIsVisible() then self:drawRectBorder(focused.x-2,focused.y-2,focused.width+4,focused.height+4,1,0.95,0.85,0.35) end
end
function Window:isKeyConsumed(key)
    return key==Keyboard.KEY_TAB or key==Keyboard.KEY_UP or key==Keyboard.KEY_DOWN or key==Keyboard.KEY_RETURN
        or key==Keyboard.KEY_PRIOR or key==Keyboard.KEY_NEXT or key==Keyboard.KEY_BACK
end
function Window:onKeyRelease(key)
    safe(function()
        if key==Keyboard.KEY_TAB then
            self.focusIndex=(self.focusIndex or 3)%7+1
            if self.compact and not self.detailOnly and self.focusIndex==4 then self.focusIndex=5 end
            if self.compact and self.detailOnly and self.focusIndex==3 then self.focusIndex=4 end
        elseif key==Keyboard.KEY_BACK and self.compact and self.detailOnly then self:onBack()
        elseif key==Keyboard.KEY_PRIOR then self.document:page(-1)
        elseif key==Keyboard.KEY_NEXT then self.document:page(1)
        elseif (key==Keyboard.KEY_UP or key==Keyboard.KEY_DOWN) and self.focusIndex==3 then
            local index=math.max(1,math.min(#self.list.items,(self.list.selected or 1)+(key==Keyboard.KEY_UP and -1 or 1)))
            self.list.selected=index
            if self.list.items[index] then self:showRow(self.list.items[index].item) end
        elseif key==Keyboard.KEY_RETURN then
            local index=self.focusIndex or 3
            if index==1 then self:onSection(self.journal) elseif index==2 then self:onSection(self.evidence)
            elseif index==3 and self.list.items[self.list.selected] then self:showRow(self.list.items[self.list.selected].item)
            elseif index==5 then UI.openHelp() elseif index==6 then self:onContrast() elseif index==7 then self:close() end
        end
    end)
end
function UI.rememberWindow(window,isOpen)
    if UI.probeState then return end
    local player=getPlayer and getPlayer();if not player then return end
    local saved={x=window.x,y=window.y,width=window.width,height=window.height,
        isOpen=isOpen==true,section=window.section=="evidence" and "evidence" or "journal"}
    UI.geometry=saved
    local md=player:getModData();local old=md.ConspiracyFilesUI
    if type(old)=="table" and old.x==saved.x and old.y==saved.y and old.width==saved.width
        and old.height==saved.height and old.isOpen==saved.isOpen and old.section==saved.section then return end
    md.ConspiracyFilesUI=saved
end
function UI.resetWindowRestore()
    -- Do not call close here: it would overwrite the saved open preference.
    if UI.notebook then UI.notebook:removeFromUIManager() end
    UI.notebook=nil;UI.geometry=nil;UI.restorePending=true
end
function UI.restoreWindow()
    if not UI.restorePending or UI.probeState then return end
    local player=getPlayer and getPlayer();if not player then return end
    local saved=player:getModData().ConspiracyFilesUI
    if type(saved)~="table" or saved.isOpen~=true then UI.restorePending=false;return end
    if not state() then return end
    UI.open(saved.section=="evidence" and "evidence" or "journal")
    if UI.notebook then UI.restorePending=false end
end
function Window:close()
    safe(function()
        UI.rememberWindow(self,false)
        UI.restorePending=false
        if UI.reader then UI.reader:close() end; if UI.help then UI.help:close() end
        self:removeFromUIManager(); if UI.notebook==self then UI.notebook=nil end
    end)
end
function Window:new(section)
    local player=getPlayer and getPlayer()
    local geometry=UI.geometry or (player and player:getModData().ConspiracyFilesUI)
    local x,y,w,h=rect(1000,680,type(geometry)=="table" and geometry or nil)
    local o=ISCollapsableWindow.new(self,x,y,w,h)
    o:setTitle("Survivor's Notebook"..((isDebugEnabled and isDebugEnabled()) and " ["..UI.VERSION.."]" or "")); o:setWantKeyEvents(true)
    o.section=section or "journal"; o.focusIndex=3; o.minimumWidth=500; o.minimumHeight=420; return o
end
function UI.open(section,preferred)
    safe(function()
        if not state() then return end
        if not UI.notebook then UI.notebook=Window:new(section); UI.notebook:initialise(); UI.notebook:instantiate(); UI.notebook:addToUIManager() end
        if section then UI.notebook.section=section end
        UI.notebook:refresh(preferred); UI.notebook:bringToTop()
        UI.rememberWindow(UI.notebook,true);UI.restorePending=false
    end)
end
function UI.refresh(section,id)
    if not UI.notebook then return end
    safe(function() if section then UI.notebook.section=section end; UI.notebook:refresh(id) end)
end
function UI.toggle() if UI.notebook then UI.notebook:close() else UI.open() end end
if Events and Events.OnGameStart and not UI.windowRestoreStart then
    UI.windowRestoreStart=function() safe(UI.resetWindowRestore) end
    Events.OnGameStart.Add(UI.windowRestoreStart)
end
if Events and Events.OnPostUIDraw and not UI.windowRestoreDraw then
    UI.windowRestoreDraw=function() safe(UI.restoreWindow) end
    Events.OnPostUIDraw.Add(UI.windowRestoreDraw)
end
local BIND="Conspiracy-Files: Toggle Survivor Notebook"
if keyBinding then
    local exists=false; for _,entry in ipairs(keyBinding) do if entry.value==BIND then exists=true end end
    if not exists then table.insert(keyBinding,{value=BIND,key=Keyboard.KEY_NONE}) end
end
if Events and Events.OnKeyPressed and not UI.keyHandler then
    UI.keyHandler=function(key) safe(function() local assigned=getCore():getKey(BIND); if assigned and assigned>0 and key==assigned then UI.toggle() end end) end
    Events.OnKeyPressed.Add(UI.keyHandler)
end
-- Existing context callbacks reference this table, so a notebook-only hot reload
-- can switch the current session without restarting its saved-case runtime.
if ConspiracyFiles.GeneratedMenu then
    ConspiracyFiles.GeneratedMenu.open=function(id)
        if UI.reader then UI.reader:close() end
        UI.open("evidence",id)
    end
end

-- BEGIN address hot-load bundle.
function UI.enableAddresses()
local Core=(function()
-- Pure incremental assignment, independent of case seed and exploration.
local A={REVISION="muldraugh-address-1"}
function A.build(buildings,roads,done,progress,frozen)
    local segments={}
    for _,b in ipairs(roads) do for _,s in ipairs(b.segments) do segments[#segments+1]={block=b,s=s} end end
    -- Index expanded segment bounds once; a building only compares nearby roads.
    -- Any segment within the existing 60-tile acceptance distance is included.
    local nearby={}
    for _,part in ipairs(segments) do
        local s=part.s
        for x=math.floor((math.min(s[1],s[3])-60)/128),math.floor((math.max(s[1],s[3])+60)/128) do
            for y=math.floor((math.min(s[2],s[4])-60)/128),math.floor((math.max(s[2],s[4])+60)/128) do
                local k=x..":"..y; nearby[k]=nearby[k] or {}
                nearby[k][#nearby[k]+1]=part
            end
        end
    end
    local bi,si,groups,keys,records=1,1,{},{},{}
    local fixed,used={},{}
    for _,r in ipairs(frozen or {}) do
        fixed[r.id]=r;used[r.label]=true
        records[#records+1]={id=r.id,x=r.x,y=r.y,x2=r.x2,y2=r.y2,label=r.label}
    end
    local best,second=nil,nil
    local phase,gi="match",1
    local rejected=0
    local function consider(candidate)
        if not best or candidate.distance<best.distance or candidate.distance==best.distance and candidate.key<best.key then
            if best and best.key~=candidate.key then second=best end
            best=candidate
        elseif candidate.key~=best.key and (not second or candidate.distance<second.distance) then second=candidate end
    end
    return function()
        if phase=="match" then
            local b=buildings[bi]
            if not b then
                for k in pairs(groups) do keys[#keys+1]=k end
                table.sort(keys); phase="number"; return false
            end
            if fixed[b.id] then
                local r=fixed[b.id]
                if b.x~=r.x or b.y~=r.y or b.x2~=r.x2 or b.y2~=r.y2 then error("saved building bounds changed; no addresses committed") end
                if progress then progress(bi,#buildings) end
                bi=bi+1;return false
            end
            local x,y=(b.x+b.x2-1)/2,(b.y+b.y2-1)/2
            local candidates=nearby[math.floor(x/128)..":"..math.floor(y/128)] or {}
            local part=candidates[si]
            if not part then
                if best and best.distance<=3600 then
                    local g=groups[best.key]
                    if not g then g={}; groups[best.key]=g end
                    g[#g+1]={building=b,match=best}
                else rejected=rejected+1 end
                if progress then progress(bi,#buildings) end
                bi,si,best,second=bi+1,1,nil,nil; return false
            end
            si=si+1
            local s=part.s; local x,y=(b.x+b.x2-1)/2,(b.y+b.y2-1)/2
            local dx,dy=s[3]-s[1],s[4]-s[2]; local length=dx*dx+dy*dy
            if length==0 then return false end
            local t=math.max(0,math.min(1,((x-s[1])*dx+(y-s[2])*dy)/length))
            local px,py=s[1]+t*dx,s[2]+t*dy
            local horizontal=math.abs(dx)>=math.abs(dy)
            -- Classify curved/diagonal segments by their dominant axis. Normalize
            -- direction before taking the perpendicular side, so reversing XML
            -- endpoints cannot swap parity. Exact diagonals use east/west.
            local side
            if horizontal then
                local sign=dx>=0 and 1 or -1
                side=sign*(dx*(y-py)-dy*(x-px))/math.sqrt(length)
            else
                local sign=dy>=0 and 1 or -1
                side=sign*(dy*(x-px)-dx*(y-py))/math.sqrt(length)
            end
            if math.abs(side)<1 then return false end
            local odd=horizontal and side<0 or not horizontal and side>0
            local key=part.block.street..":"..part.block.block..":"..tostring(odd)
            consider({key=key,distance=(x-px)^2+(y-py)^2,order=math.abs(px-10600)+math.abs(py-9750),odd=odd,block=part.block})
            return false
        end
        local key=keys[gi]
        if not key then done(records,rejected); return true end
        gi=gi+1
        local group=groups[key]
        table.sort(group,function(a,b) return a.match.order<b.match.order or a.match.order==b.match.order and a.building.id<b.building.id end)
        for i,v in ipairs(group) do
            local b,m=v.building,v.match
            local label
            for slot=1,49 do
                local number=m.block.block*100+slot*2-(m.odd and 1 or 0)
                local candidate=number.." "..m.block.street
                if not used[candidate] then label=candidate;break end
            end
            if label then
                used[label]=true
                records[#records+1]={id=b.id,x=b.x,y=b.y,x2=b.x2,y2=b.y2,label=label}
            else rejected=rejected+1 end
        end
        return false
    end
end
return A

end)()
local Roads=(function()
-- Generated from installed streets.xml; SHA256 86172be118d99243ecbb6027ef4b82f2aa31590afcc7bbd776cffe9869482771
-- Address revision 1: Muldraugh trial bounds; Main/First baseline corridors.
return {
{street="1st St",block=1,segments={{10927.00000,9772.00000,10989.00000,9772.00000,0.00000},{10989.00000,9772.00000,10989.00000,9746.00000,62.00000}}},
{street="2nd St",block=1,segments={{10927.00000,9744.00000,11002.00000,9744.00000,0.00000},{11002.00000,9744.00000,11002.00000,9718.00000,75.00000}}},
{street="3rd St",block=1,segments={{10927.00000,9716.00000,11009.00000,9716.00000,0.00000},{11009.00000,9716.00000,11009.00000,9690.00000,82.00000}}},
{street="4th St",block=1,segments={{10927.00000,9688.00000,11009.00000,9688.00000,0.00000},{11009.00000,9688.00000,11009.00000,9662.00000,82.00000}}},
{street="Axhead Road",block=1,segments={{10402.50000,9499.50000,10402.50000,9625.00000,0.00000},{10402.50000,9625.00000,10406.00000,9632.00000,125.50000},{10406.00000,9632.00000,10410.50000,9636.50000,133.32624},{10410.50000,9636.50000,10447.00000,9636.50000,139.69020},{10447.00000,9636.50000,10521.00000,9636.50000,176.19020}}},
{street="Balsam St",block=1,segments={{10644.00000,10068.50000,10745.50000,10068.50000,0.00000}}},
{street="Bank Road",block=1,segments={{10662.50000,9631.00000,10662.50000,9695.50000,0.00000},{10662.50000,9695.50000,10666.50000,9695.50000,64.50000},{10666.50000,9695.50000,10668.50000,9697.50000,68.50000},{10668.50000,9697.50000,10668.50000,9732.50000,71.32843}}},
{street="Barn Way",block=1,segments={{10818.00000,10303.00000,10853.50000,10303.00000,0.00000},{10853.50000,10303.00000,10856.00000,10305.50000,35.50000}}},
{street="Boone Road",block=1,segments={{10064.00000,9793.00000,10064.00000,9993.00000,0.00000},{10064.00000,9993.00000,10079.00000,10023.00000,200.00000},{10079.00000,10023.00000,10091.00000,10035.00000,233.54102},{10091.00000,10035.00000,10123.00000,10051.00000,250.51158},{10123.00000,10051.00000,10521.00000,10051.00000,286.28867}}},
{street="Branch Dr",block=1,segments={{10644.00000,10156.00000,10733.00000,10156.00000,0.00000}}},
{street="Carpenter Test Road",block=1,segments={{10525.00000,9274.00000,10525.00000,11197.00000,0.00000}}},
{street="Chenault St",block=1,segments={{10599.00000,10674.00000,10676.00000,10674.00000,0.00000},{10676.00000,10674.00000,10684.00000,10670.00000,77.00000},{10684.00000,10670.00000,10687.00000,10667.00000,85.94427},{10687.00000,10667.00000,10692.00000,10658.00000,90.18691},{10692.00000,10658.00000,10692.00000,10635.00000,100.48254},{10692.00000,10635.00000,10697.00000,10625.00000,123.48254},{10697.00000,10625.00000,10702.00000,10620.00000,134.66288},{10702.00000,10620.00000,10713.00000,10615.00000,141.73395},{10713.00000,10615.00000,10786.00000,10615.00000,153.81700}}},
{street="Circular St",block=1,segments={{10982.00000,9660.00000,10982.00000,9631.00000,0.00000},{10982.00000,9631.00000,11015.00000,9631.00000,29.00000},{11015.00000,9631.00000,11015.00000,9660.00000,62.00000},{11015.00000,9660.00000,10983.00000,9660.00000,91.00000}}},
{street="Deerstalk Road",block=1,segments={{11331.00000,9748.00000,11331.00000,9939.00000,0.00000},{11331.00000,9939.00000,11357.00000,9992.00000,191.00000},{11357.00000,9992.00000,11416.00000,10051.00000,250.03389},{11416.00000,10051.00000,11437.00000,10093.00000,333.47249},{11437.00000,10093.00000,11437.00000,10300.00000,380.42992},{11437.00000,10300.00000,11444.50000,10315.00000,587.42992},{11444.50000,10315.00000,11459.50000,10329.50000,604.20043},{11459.50000,10329.50000,11474.00000,10337.00000,625.06307},{11474.00000,10337.00000,11601.00000,10337.00000,641.38790}}},
{street="Dewey St",block=1,segments={{10856.50000,10059.00000,10856.50000,10137.00000,0.00000}}},
{street="Diesel St",block=1,segments={{10857.00000,9980.00000,10857.00000,10051.00000,0.00000}}},
{street="E Maple St",block=1,segments={{10894.50000,10059.00000,10894.50000,10133.00000,0.00000},{10894.50000,10133.00000,10893.00000,10136.00000,74.00000},{10893.00000,10136.00000,10891.00000,10138.00000,77.35410},{10891.00000,10138.00000,10887.50000,10139.50000,80.18253},{10887.50000,10139.50000,10856.50000,10139.50000,83.99042},{10856.50000,10139.50000,10856.50000,10223.50000,114.99042}}},
{street="Elm Court",block=1,segments={{10773.50000,10051.00000,10773.50000,10005.50000,0.00000},{10773.50000,10005.50000,10815.50000,10005.50000,45.50000},{10815.50000,10005.50000,10821.00000,10008.00000,87.50000},{10821.00000,10008.00000,10824.00000,10010.00000,93.54152},{10824.00000,10010.00000,10828.00000,10014.00000,97.14707},{10828.00000,10014.00000,10832.00000,10016.50000,102.80393},{10832.00000,10016.50000,10855.00000,10016.50000,107.52092}}},
{street="Farmer's Lane",block=1,segments={{10705.50000,9633.00000,10705.50000,9672.50000,0.00000},{10705.50000,9672.50000,10743.50000,9672.50000,39.50000}}},
{street="Franklin St",block=1,segments={{10599.00000,9860.00000,10815.00000,9860.00000,0.00000}}},
{street="Harris Court",block=1,segments={{10671.00000,9563.50000,10724.00000,9563.50000,0.00000},{10724.00000,9563.50000,10729.00000,9561.00000,53.00000},{10729.00000,9561.00000,10733.00000,9556.00000,58.59017},{10733.00000,9556.00000,10732.50000,9512.00000,64.99329}}},
{street="Harris St",block=1,segments={{10645.00000,9509.50000,10891.00000,9509.50000,0.00000}}},
{street="Hazelnut St",block=1,segments={{10927.50000,9869.50000,10987.00000,9869.50000,0.00000},{10987.00000,9869.50000,10999.50000,9875.50000,59.50000},{10999.50000,9875.50000,11002.00000,9878.00000,73.36542},{11002.00000,9878.00000,11006.00000,9887.00000,76.90096},{11006.00000,9887.00000,11006.00000,9967.00000,86.74982},{11006.00000,9967.00000,11002.00000,9974.00000,166.74982},{11002.00000,9974.00000,10995.00000,9978.00000,174.81207},{10995.00000,9978.00000,10936.00000,9978.00000,182.87433},{10936.00000,9978.00000,10928.00000,9982.00000,241.87433}}},
{street="Hill St",block=1,segments={{10666.00000,9864.00000,10666.00000,9940.00000,0.00000}}},
{street="Hop Lane",block=1,segments={{10810.50000,9785.50000,10821.50000,9774.50000,0.00000},{10821.50000,9774.50000,10826.50000,9771.50000,15.55635},{10826.50000,9771.50000,10923.00000,9772.00000,21.38730}}},
{street="Inferno Road",block=1,segments={{9904.00000,9785.00000,9904.00000,10549.00000,0.00000},{9904.00000,10549.00000,9958.00000,10658.00000,764.00000},{9958.00000,10658.00000,9958.00000,10850.00000,885.64292},{9958.00000,10850.00000,9964.00000,10862.00000,1077.64292},{9964.00000,10862.00000,9974.00000,10872.00000,1091.05933},{9974.00000,10872.00000,9986.00000,10878.00000,1105.20146},{9986.00000,10878.00000,10052.00000,10878.00000,1118.61787},{10052.00000,10878.00000,10052.00000,10942.00000,1184.61787},{10052.00000,10942.00000,10119.00000,10942.00000,1248.61787},{10119.00000,10942.00000,10127.00000,10946.00000,1315.61787},{10127.00000,10946.00000,10133.00000,10952.00000,1324.56214},{10133.00000,10952.00000,10137.00000,10960.00000,1333.04742},{10137.00000,10960.00000,10137.00000,11197.00000,1341.99170}}},
{street="Irma Dr",block=1,segments={{10823.00000,9869.50000,10925.00000,9869.50000,0.00000},{10925.00000,9869.50000,10925.00000,9600.00000,102.00000}}},
{street="Irma Dr",block=2,segments={{10925.50000,9600.00000,10925.50000,9541.00000,0.00000},{10925.50000,9541.00000,10940.50000,9511.00000,59.00000},{10940.50000,9511.00000,10940.50000,9414.50000,92.54102},{10940.50000,9414.50000,10945.00000,9406.00000,189.04102},{10945.00000,9406.00000,10947.00000,9404.00000,198.65871},{10947.00000,9404.00000,10956.00000,9399.50000,201.48714},{10956.00000,9399.50000,11029.00000,9399.50000,211.54944},{11029.00000,9399.50000,11036.50000,9395.50000,284.54944},{11036.50000,9395.50000,11041.00000,9390.50000,293.04944},{11041.00000,9390.50000,11043.50000,9385.00000,299.77626},{11043.50000,9385.00000,11043.50000,9341.00000,305.81778},{11043.50000,9341.00000,11049.00000,9330.00000,349.81778},{11049.00000,9330.00000,11055.00000,9324.00000,362.11615},{11055.00000,9324.00000,11066.00000,9318.50000,370.60143},{11066.00000,9318.50000,11101.00000,9318.50000,382.89981},{11101.00000,9318.50000,11104.00000,9318.00000,417.89981}}},
{street="Irma Dr",block=3,segments={{11104.00000,9318.00000,11310.00000,9318.00000,0.00000}}},
{street="Lime St",block=1,segments={{10760.00000,10053.00000,10841.00000,10053.00000,0.00000}}},
{street="Lizard Road",block=1,segments={{10790.00000,10619.00000,10790.00000,10892.00000,0.00000},{10790.00000,10892.00000,10784.00000,10904.00000,273.00000},{10784.00000,10904.00000,10774.00000,10915.00000,286.41641},{10774.00000,10915.00000,10768.00000,10924.00000,301.28248},{10768.00000,10924.00000,10768.00000,10934.00000,312.09913},{10768.00000,10934.00000,10774.00000,10947.00000,322.09913},{10774.00000,10947.00000,10782.00000,10955.00000,336.41695},{10782.00000,10955.00000,10793.00000,10961.00000,347.73066},{10793.00000,10961.00000,11100.00000,10961.00000,360.26062},{11100.00000,10961.00000,11111.00000,10967.00000,667.26062},{11111.00000,10967.00000,11115.00000,10970.00000,679.79059},{11115.00000,10970.00000,11119.00000,10975.00000,684.79059},{11119.00000,10975.00000,11122.00000,10983.00000,691.19371},{11122.00000,10983.00000,11122.00000,11018.00000,699.73772},{11122.00000,11018.00000,11127.00000,11027.00000,734.73772},{11127.00000,11027.00000,11130.00000,11031.00000,745.03335},{11130.00000,11031.00000,11143.00000,11038.00000,750.03335},{11143.00000,11038.00000,11262.00000,11038.00000,764.79817},{11262.00000,11038.00000,11274.00000,11044.00000,883.79817},{11274.00000,11044.00000,11280.00000,11050.00000,897.21458},{11280.00000,11050.00000,11284.00000,11059.00000,905.69986},{11284.00000,11059.00000,11284.00000,11197.00000,915.54872}}},
{street="Mabel St",block=1,segments={{10714.50000,9741.00000,10714.50000,9856.00000,0.00000}}},
{street="Matthew St",block=1,segments={{10870.00000,9872.00000,10870.00000,9972.00000,0.00000}}},
{street="McCoy Road",block=1,segments={{10029.50000,9785.00000,10029.50000,9552.00000,0.00000},{10029.50000,9552.00000,10036.00000,9539.00000,233.00000},{10036.00000,9539.00000,10043.00000,9532.00000,247.53444},{10043.00000,9532.00000,10056.00000,9525.50000,257.43394},{10056.00000,9525.50000,10233.00000,9525.50000,271.96838},{10233.00000,9525.50000,10245.00000,9531.00000,448.96838},{10245.00000,9531.00000,10254.00000,9541.00000,462.16876},{10254.00000,9541.00000,10259.50000,9551.50000,475.62238},{10259.50000,9551.50000,10259.50000,9709.00000,487.47565},{10259.50000,9709.00000,10267.50000,9725.00000,644.97565},{10267.50000,9725.00000,10274.00000,9731.00000,662.86419},{10274.00000,9731.00000,10333.00000,9760.50000,671.71010},{10333.00000,9760.50000,10384.50000,9760.50000,737.67410}}},
{street="N Main St",block=1,segments={{10599.00000,9336.50000,10653.00000,9336.50000,0.00000},{10653.00000,9336.50000,10664.00000,9342.00000,54.00000},{10664.00000,9342.00000,10669.00000,9347.00000,66.29837},{10669.00000,9347.00000,10675.00000,9359.00000,73.36944},{10675.00000,9359.00000,10675.00000,9430.00000,86.78585},{10675.00000,9430.00000,10671.00000,9436.00000,157.78585},{10671.00000,9436.00000,10647.00000,9460.00000,164.99695},{10647.00000,9460.00000,10644.00000,9463.00000,198.93808},{10644.00000,9463.00000,10642.00000,9468.00000,203.18072},{10642.00000,9468.00000,10642.00000,9623.00000,208.56588}}},
{street="Old Bank Road",block=1,segments={{10599.00000,9200.00000,10625.00000,9200.00000,0.00000},{10625.00000,9200.00000,10632.00000,9203.00000,26.00000},{10632.00000,9203.00000,10639.50000,9210.50000,33.61577},{10639.50000,9210.50000,10643.00000,9218.50000,44.22237},{10643.00000,9218.50000,10643.00000,9321.00000,52.95450},{10643.00000,9321.00000,10649.00000,9333.00000,155.45450}}},
{street="Old Loop Road",block=1,segments={{10813.00000,10217.50000,10816.50000,10219.50000,0.00000},{10816.50000,10219.50000,10818.50000,10222.00000,4.03113},{10818.50000,10222.00000,10827.00000,10226.00000,7.23269},{10827.00000,10226.00000,10876.00000,10226.00000,16.62684},{10876.00000,10226.00000,10883.00000,10230.00000,65.62684},{10883.00000,10230.00000,10888.00000,10235.00000,73.68910},{10888.00000,10235.00000,10891.50000,10241.50000,80.76016},{10891.50000,10241.50000,10891.50000,10294.00000,88.14258},{10891.50000,10294.00000,10888.50000,10299.50000,140.64258},{10888.50000,10299.50000,10884.00000,10304.00000,146.90756},{10884.00000,10304.00000,10879.00000,10306.50000,153.27152},{10879.00000,10306.50000,10857.50000,10306.50000,158.86169},{10857.50000,10306.50000,10857.50000,10417.50000,180.36169},{10857.50000,10417.50000,10855.00000,10423.00000,291.36169},{10855.00000,10423.00000,10852.50000,10426.00000,297.40321},{10852.50000,10426.00000,10846.00000,10430.00000,301.30834},{10846.00000,10430.00000,10841.00000,10430.50000,308.94050},{10841.00000,10430.50000,10794.00000,10430.50000,313.96544}}},
{street="Old Mill Road",block=1,segments={{9908.00000,9789.00000,10332.00000,9789.00000,0.00000},{10332.00000,9789.00000,10436.00000,9737.00000,424.00000},{10436.00000,9737.00000,10521.00000,9737.00000,540.27553}}},
{street="Old Station Road",block=1,segments={{10928.00000,9568.00000,11030.00000,9568.00000,0.00000}}},
{street="Pattern St",block=1,segments={{10894.50000,9980.00000,10894.50000,10051.00000,0.00000}}},
{street="Perrine St",block=1,segments={{10741.00000,10458.00000,10786.00000,10458.00000,0.00000}}},
{street="Perrine St",block=2,segments={{10756.00000,9948.00000,10756.00000,10056.50000,0.00000},{10756.00000,10056.50000,10737.00000,10094.00000,108.50000},{10737.00000,10094.00000,10737.00000,10226.00000,150.53867}}},
{street="Perrine St",block=3,segments={{10737.00000,10226.00000,10737.00000,10611.00000,0.00000}}},
{street="Popar St",block=1,segments={{10739.00000,9864.00000,10739.00000,9940.00000,0.00000}}},
{street="Red Arrow St",block=1,segments={{10898.00000,9631.00000,10898.00000,9731.00000,0.00000}}},
{street="S Main St",block=1,segments={{10599.00000,9627.00000,10705.00000,9627.00000,0.00000},{10705.00000,9627.00000,10725.00000,9637.00000,106.00000},{10725.00000,9637.00000,10739.00000,9650.00000,128.36068},{10739.00000,9650.00000,10751.00000,9676.00000,147.46565},{10751.00000,9676.00000,10751.00000,9759.00000,176.10130},{10751.00000,9759.00000,10757.00000,9771.00000,259.10130},{10757.00000,9771.00000,10763.00000,9777.00000,272.51770},{10763.00000,9777.00000,10775.00000,9783.00000,281.00298},{10775.00000,9783.00000,10798.00000,9783.00000,294.41939},{10798.00000,9783.00000,10810.00000,9789.00000,317.41939},{10810.00000,9789.00000,10814.00000,9793.00000,330.83580},{10814.00000,9793.00000,10819.00000,9803.00000,336.49265},{10819.00000,9803.00000,10819.00000,9950.00000,347.67299},{10819.00000,9950.00000,10825.00000,9963.00000,494.67299},{10825.00000,9963.00000,10831.00000,9969.00000,508.99082},{10831.00000,9969.00000,10844.00000,9976.00000,517.47610},{10844.00000,9976.00000,10911.00000,9976.00000,532.24092},{10911.00000,9976.00000,10923.00000,9982.00000,599.24092},{10923.00000,9982.00000,10929.00000,9988.00000,612.65733},{10929.00000,9988.00000,10935.00000,10000.00000,621.14261},{10935.00000,10000.00000,10935.00000,10038.00000,634.55902},{10935.00000,10038.00000,10931.00000,10046.00000,672.55902},{10931.00000,10046.00000,10925.00000,10051.50000,681.50329},{10925.00000,10051.50000,10918.00000,10055.00000,689.64270},{10918.00000,10055.00000,10846.00000,10055.00000,697.46894},{10846.00000,10055.00000,10838.00000,10059.00000,769.46894},{10838.00000,10059.00000,10829.00000,10068.00000,778.41321},{10829.00000,10068.00000,10823.00000,10079.50000,791.14113},{10823.00000,10079.50000,10823.00000,10189.00000,804.11225},{10823.00000,10189.00000,10790.00000,10255.00000,913.61225},{10790.00000,10255.00000,10790.00000,10619.00000,987.40250}}},
{street="Sandy Lane",block=1,segments={{10943.00000,9509.00000,11016.00000,9509.00000,0.00000}}},
{street="Sleeper Road",block=1,segments={{10295.00000,8798.00000,10295.00000,8850.00000,0.00000},{10295.00000,8850.00000,10298.00000,8856.00000,52.00000},{10298.00000,8856.00000,10304.00000,8862.00000,58.70820},{10304.00000,8862.00000,10311.00000,8866.00000,67.19349},{10311.00000,8866.00000,10341.00000,8866.00000,75.25574},{10341.00000,8866.00000,10347.00000,8862.00000,105.25574},{10347.00000,8862.00000,10353.50000,8849.00000,112.46685},{10353.50000,8849.00000,10356.50000,8846.00000,127.00129},{10356.50000,8846.00000,10364.00000,8842.00000,131.24393},{10364.00000,8842.00000,10392.00000,8842.00000,139.74393},{10392.00000,8842.00000,10411.00000,8851.00000,167.74393},{10411.00000,8851.00000,10420.00000,8860.00000,188.76772},{10420.00000,8860.00000,10426.00000,8866.00000,201.49565},{10426.00000,8866.00000,10433.50000,8870.00000,209.98093},{10433.50000,8870.00000,10484.00000,8870.00000,218.48093},{10484.00000,8870.00000,10494.00000,8875.00000,268.98093},{10494.00000,8875.00000,10506.00000,8887.00000,280.16127},{10506.00000,8887.00000,10513.00000,8901.00000,297.13183},{10513.00000,8901.00000,10513.00000,9248.50000,312.78431},{10513.00000,9248.50000,10525.00000,9272.50000,660.28431},{10525.00000,9272.50000,10525.00000,9274.00000,687.11712}}},
{street="Station Road",block=1,segments={{11044.50000,9096.00000,11044.50000,9316.00000,0.00000},{11044.50000,9316.00000,11047.00000,9321.00000,220.00000},{11047.00000,9321.00000,11050.50000,9324.50000,225.59017}}},
{street="Stump Road",block=1,segments={{10874.00000,9731.00000,10874.00000,9629.00000,0.00000},{10874.00000,9629.00000,10923.00000,9629.00000,102.00000}}},
{street="Sunstar Way",block=1,segments={{10664.00000,9790.50000,10712.00000,9790.50000,0.00000}}},
{street="Twig St",block=1,segments={{10706.00000,10159.00000,10706.00000,10224.00000,0.00000}}},
{street="W Garnettsville Road",block=1,segments={{10599.00000,9737.00000,10747.00000,9737.00000,0.00000}}},
{street="W Maple St",block=1,segments={{10599.00000,10097.00000,10638.00000,10097.00000,0.00000}}},
{street="W Maple St",block=2,segments={{10644.00000,10097.00000,10669.00000,10097.00000,0.00000},{10669.00000,10097.00000,10669.00000,10126.00000,25.00000},{10669.00000,10126.00000,10644.00000,10126.00000,54.00000}}},
{street="Walker Road",block=1,segments={{10674.00000,9438.50000,10761.00000,9438.50000,0.00000},{10761.00000,9438.50000,10771.50000,9443.50000,87.00000},{10771.50000,9443.50000,10785.00000,9457.00000,98.62970},{10785.00000,9457.00000,10798.00000,9463.50000,117.72159},{10798.00000,9463.50000,10938.00000,9463.50000,132.25603}}},
{street="Wendell St",block=1,segments={{10599.00000,9944.00000,10815.00000,9944.00000,0.00000}}},
{street="Wilson St",block=1,segments={{10641.00000,9948.00000,10641.00000,10159.00000,0.00000},{10641.00000,10159.00000,10624.00000,10193.00000,211.00000},{10624.00000,10193.00000,10624.00000,10447.00000,249.01316},{10624.00000,10447.00000,10644.50000,10489.00000,503.01316},{10644.50000,10489.00000,10644.00000,10570.00000,549.74912},{10644.00000,10570.00000,10647.00000,10577.00000,630.75066},{10647.00000,10577.00000,10652.00000,10581.00000,638.36643},{10652.00000,10581.00000,10658.00000,10584.00000,644.76956},{10658.00000,10584.00000,10677.00000,10584.00000,651.47776},{10677.00000,10584.00000,10685.00000,10589.00000,670.47776},{10685.00000,10589.00000,10688.00000,10592.00000,679.91174},{10688.00000,10592.00000,10691.00000,10598.00000,684.15438},{10691.00000,10598.00000,10691.00000,10610.00000,690.86259},{10691.00000,10610.00000,10694.00000,10616.00000,702.86259},{10694.00000,10616.00000,10697.00000,10619.00000,709.57079}}},
{street="Wood St",block=1,segments={{10657.00000,10226.00000,10737.00000,10226.00000,0.00000}}},
{street="Wood St",block=2,segments={{10737.00000,10226.00000,10798.00000,10226.00000,0.00000}}},
{street="Woodhaul Road",block=1,segments={{10229.50000,9523.00000,10229.50000,9507.00000,0.00000},{10229.50000,9507.00000,10232.50000,9500.50000,16.00000},{10232.50000,9500.50000,10239.50000,9496.50000,23.15891},{10239.50000,9496.50000,10336.00000,9496.50000,31.22117},{10336.00000,9496.50000,10438.00000,9496.50000,127.72117},{10438.00000,9496.50000,10453.50000,9488.50000,229.72117},{10453.50000,9488.50000,10460.00000,9473.50000,247.16393},{10460.00000,9473.50000,10460.50000,9410.50000,263.51171},{10460.50000,9410.50000,10465.00000,9401.00000,326.51370},{10465.00000,9401.00000,10468.50000,9398.00000,337.02560},{10468.50000,9398.00000,10477.50000,9393.50000,341.63537},{10477.50000,9393.50000,10521.00000,9393.50000,351.69767}}},
}

end)()
local service=(function()
local V=require("ConspiracyFiles/Validator")
ConspiracyFiles=ConspiracyFiles or {}
if ConspiracyFiles.AddressMap and ConspiracyFiles.AddressMap.stop then ConspiracyFiles.AddressMap.stop() end
local M={}; ConspiracyFiles.AddressMap=M
local TAG="ConspiracyFiles.AddressBook.Muldraugh"
local job,handler,book,byId,buckets,peak=nil,nil,nil,{}, {},0
local function log(s) print("[CF-ADDRESS] "..s) end
local status="Not started"
local view,viewReasons,auditHandler
local function stopAudit() if auditHandler then Events.OnTick.Remove(auditHandler);auditHandler=nil end end
function M.status() log(status); return status end
local function allowed() return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer()) end
local function valid(root)
    local ok=V.validateStructure(root)
    if not ok or type(root)~="table" or root.revision~=Core.REVISION or type(root.records)~="table" then return false end
    if V.estimateEncodedBytes(root)>400000 then return false end
    local seen,labels,n={},{},0
    for i,r in pairs(root.records) do
        if type(i)~="number" or i<1 or i~=math.floor(i) or type(r)~="table" or type(r.id)~="string"
            or type(r.label)~="string" or #r.label>160 or seen[r.id] or labels[r.label] then return false end
        for _,k in ipairs({"x","y","x2","y2"}) do if type(r[k])~="number" or r[k]~=math.floor(r[k]) or math.abs(r[k])>100000 then return false end end
        if r.x2<=r.x or r.y2<=r.y then return false end
        seen[r.id]=true;labels[r.label]=true;n=n+1
    end
    for i=1,n do if not root.records[i] then return false end end
    return true
end
local function use(root)
    book=root; byId,buckets={},{}
    for _,r in ipairs(root.records) do
        byId["t3:"..r.id]=r
        local cx,cy=(r.x+r.x2-1)/2,(r.y+r.y2-1)/2
        local key=math.floor(cx/64)..":"..math.floor(cy/64)
        buckets[key]=buckets[key] or {}; buckets[key][#buckets[key]+1]=r
    end
end
function M.ready() return book~=nil end
function M.stop() if handler then Events.OnTick.Remove(handler) end; job=nil;stopAudit() end
function M.describe(body,case)
    if not book then return nil end
    local out=body
    for _,site in ipairs(case.locations) do
        local r=byId[site.id]
        if not r or site.mapId~=book.map or site.bounds.x1~=r.x or site.bounds.y1~=r.y or site.bounds.x2~=r.x2 or site.bounds.y2~=r.y2 then return nil end
        local parts,start={},1
        while true do
            local a,b=out:find(site.name,start,true)
            if not a then parts[#parts+1]=out:sub(start); break end
            parts[#parts+1]=out:sub(start,a-1);parts[#parts+1]=r.label;start=b+1
        end
        out=table.concat(parts)
    end
    return out
end
function M.draw(ui)
    if not book or not allowed() or not ui.mapAPI or ui.mapAPI:getZoomF()<18 then return end
    local visited=WorldMapVisited.getInstance()
    local api=ui.mapAPI
    local minX,minY,maxX,maxY=math.huge,math.huge,-math.huge,-math.huge
    for _,p in ipairs({{0,0},{ui.width,0},{0,ui.height},{ui.width,ui.height}}) do
        local x,y=api:uiToWorldX(p[1],p[2]),api:uiToWorldY(p[1],p[2])
        minX,minY,maxX,maxY=math.min(minX,x),math.min(minY,y),math.max(maxX,x),math.max(maxY,y)
    end
    if maxX-minX>1024 or maxY-minY>1024 then return end
    view={minX=minX,minY=minY,maxX=maxX,maxY=maxY};viewReasons={}
    local occupied,drawn,checked={},0,0
    -- Fixed work limits keep the same labels visible regardless of frame timing.
    for bx=math.floor(minX/64),math.floor(maxX/64) do for by=math.floor(minY/64),math.floor(maxY/64) do
        for _,r in ipairs(buckets[bx..":"..by] or {}) do
            if drawn>=80 or checked>=512 then return end
            checked=checked+1
            viewReasons[r.id]="hidden by native map knowledge"
            local cx,cy=(r.x+r.x2-1)/2,(r.y+r.y2-1)/2
            if visited:isKnown(math.floor(cx),math.floor(cy)) and visited:isKnown(r.x,r.y) and visited:isKnown(r.x2-1,r.y)
                and visited:isKnown(r.x,r.y2-1) and visited:isKnown(r.x2-1,r.y2-1) then
                viewReasons[r.id]="outside label screen margins"
                local x,y=api:worldToUIX(cx,cy),api:worldToUIY(cx,cy)
                local number=r.label:match("^%d+")
                local width=getTextManager():MeasureStringX(UIFont.Small,number or "")
                local height=getTextManager():getFontHeight(UIFont.Small)+4
                if number and x>width/2+12 and x<ui.width-width/2-12 and y>60 and y<ui.height-100 then
                    local key=math.floor(x/48)..":"..math.floor(y/24)
                    viewReasons[r.id]="suppressed by label overlap"
                    if not occupied[key] then
                        viewReasons[r.id]="drawn"
                        occupied[key]=true;drawn=drawn+1
                        ui:drawText(number,x-width/2,y-height/2,0.12,0.10,0.08,1,UIFont.Small)
                    end
                end
            end
        end
    end end
end
-- Explicit development-only, read-only audit of the last close-zoom map view.
function M.audit()
    if not allowed() or not book or not view then log("Open the world map and zoom in first.");return false end
    if job then log("Wait for address generation to finish first.");return false end
    stopAudit()
    local area,reasons=view,viewReasons
    local buildings=getWorld():getMetaGrid():getBuildings()
    local i,missing,drawn,details,detailIndex=0,0,0,{},1
    log("Audit begin: last map viewport; original numbers and map knowledge remain unchanged.")
    auditHandler=function()
        local started=getTimeInMillis()
        local ok,why=pcall(function()
            if i>=buildings:size() then
                if details[detailIndex] then log(details[detailIndex]);detailIndex=detailIndex+1;return end
                log("Audit complete: "..drawn.." drawn buildings, "..missing.." other footprints (all detailed).")
                stopAudit();return
            end
            for _=1,256 do
                if i>=buildings:size() then
                    return
                end
                local b=buildings:get(i);i=i+1
                local x,y,x2,y2=b:getX(),b:getY(),b:getX2(),b:getY2()
                local cx,cy=(x+x2-1)/2,(y+y2-1)/2
                if not b:isBasement() and cx>=area.minX and cx<=area.maxX and cy>=area.minY and cy<=area.maxY then
                    local id=tostring(b:getIDString());local assigned=byId["t3:"..id]
                    local reason=assigned and (reasons[id] or "outside rendered candidates/work limit") or "no assigned address"
                    if reason=="drawn" then drawn=drawn+1 else
                        missing=missing+1
                        local names={};local rooms=b:getRooms()
                        for n=0,math.min(rooms:size(),16)-1 do names[#names+1]=tostring(rooms:get(n):getName()) end
                        details[#details+1]="Audit "..x..","..y..".."..x2..","..y2.." id="..id.." reason="..reason.." address="..(assigned and assigned.label or "none").." rooms="..table.concat(names,",")
                    end
                end
                if getTimeInMillis()-started>=1 then return end
            end
        end)
        if not ok then stopAudit();log("Audit stopped: "..tostring(why)) end
    end
    Events.OnTick.Add(auditHandler);return true
end
local function hook()
    require("ISUI/Maps/ISWorldMap")
    if not ConspiracyFiles.addressMapRenderHook then
        local previous=ISWorldMap.render
        ISWorldMap.render=function(ui,...)
            previous(ui,...)
            local m=ConspiracyFiles.AddressMap
            if m and not m.renderFailed then
                local ok,why=pcall(m.draw,ui)
                if not ok then m.renderFailed=true;log("labels disabled: "..tostring(why)) end
            end
        end
        ConspiracyFiles.addressMapRenderHook=true
    end
end
function M.start()
    if not allowed() then return false,"debug single player required for trial" end
    if job then return false,"address index already building" end
    local world=getWorld(); if not world then return false,"load a game first" end
    local map=tostring(world:getMap()); local build=tostring(getGameVersion())
    if build~="42.20" and build~="42.20.4" then return false,"unverified game build" end
    if not map:find("Muldraugh, KY",1,true) then return false,"unsupported map" end
    hook()
    local existing=ModData.get(TAG)
    local frozen
    if existing and existing.canonical then
        if not valid(existing.canonical) or existing.canonical.map~=map or existing.canonical.build~=build then return false,"saved address book refused; no renumbering" end
        use(existing.canonical)
        if book.coverage==3 then log("Restored "..#book.records.." fixed addresses. Zoom in on the world map.");return true end
        frozen=book.records
        log("Filling address gaps; preserving all "..#frozen.." existing addresses.")
    end
    local buildings=world:getMetaGrid():getBuildings()
    local index,records,current,ri,names=0,{},nil,0,{}
    local lastReport=getTimeInMillis(); peak=0
    status="Scanning building metadata; keep game unpaused"
    job=function()
        if current then
            local rooms=current:getRooms()
            if ri<rooms:size() then names[rooms:get(ri):getName() or ""]=true;ri=ri+1;return false end
            local useful=false
            for name in pairs(names) do if name~="garage" and name~="garagestorage" and name~="shed" and name~="" then useful=true end end
            if useful then records[#records+1]={id=tostring(current:getIDString()),x=current:getX(),y=current:getY(),x2=current:getX2(),y2=current:getY2()} end
            current=nil;return false
        end
        if index>=buildings:size() then
            buildings=nil
            status="Matching roads for "..#records.." buildings"; log(status)
            job=Core.build(records,Roads,function(result,rejected)
                local root={revision=Core.REVISION,map=map,build=build,records=result,coverage=3}
                if not valid(root) then error("address root invalid or exceeds 400 KB; nothing committed") end
                local within,why=require("ConspiracyFiles/SaveBudget").check("addresses",root)
                if not within then error(why) end
                ModData.getOrCreate(TAG).canonical=root
                use(root);status="Ready: "..#result.." fixed addresses; "..rejected.." unresolved; peak callback "..peak.." ms. Zoom in on the world map.";log(status)
            end,function(n,total) status="Matching roads: "..n.." / "..total.." buildings" end,frozen)
            return false
        end
        local b=buildings:get(index);index=index+1
        status="Scanning metadata: "..index.." / "..buildings:size().." buildings; keep game unpaused"
        if not b:isBasement() and b:getX()>=10000 and b:getX2()<=11500 and b:getY()>=9000 and b:getY2()<=11000 and b:getRooms():size()>0 then current=b;ri=0;names={} end
        return false
    end
    handler=function()
        local started=getTimeInMillis()
        local ok,why=pcall(function()
            for _=1,256 do
                if job() then M.stop();return end
                if getTimeInMillis()-started>=1 then return end
            end
        end)
        peak=math.max(peak,getTimeInMillis()-started)
        if not ok then M.stop();status="Stopped: "..tostring(why);log(status)
        elseif job and getTimeInMillis()-lastReport>=5000 then log(status);lastReport=getTimeInMillis() end
    end
    Events.OnTick.Add(handler); log("Building full Muldraugh trial address index; no terrain revealed.")
    return true
end
Events.OnGameStart.Add(function() if allowed() and ModData.get(TAG) then M.start() end end)
return M

end)()
return service.start()
end
-- END address hot-load bundle.

-- BEGIN clue-marker hot-load bundle.
function UI.enableClueMarkers()
local markers=(function()
-- Generated-clue finding records and persistent, writing-tool-gated map overlay.
local V=require("ConspiracyFiles/Validator")
local Layout=require("ConspiracyFiles/MarkerLayout")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
ConspiracyFiles=ConspiracyFiles or {}
if ConspiracyFiles.ClueMarkers then ConspiracyFiles.ClueMarkers.stop() end
local M={};ConspiracyFiles.ClueMarkers=M
local TAG="ConspiracyFiles.ClueMarkers"
local handler,last= nil,0
local pens={"Pen","Pencil","RedPen","BluePen","GreenPen"}
-- Vanilla ISWorldMapSymbols palette, in its deterministic tool priority order.
local inks={Pen={0.129,0.129,0.129},Pencil={0.2,0.2,0.2},RedPen={0.65,0.054,0.054},BluePen={0.156,0.188,0.49},GreenPen={0.06,0.39,0.17}}
local questionTexture
local function log(s) print("[CF-MARKERS] "..s) end
local function allowed()
 return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
  and not ConspiracyFiles.T11Mode and not ConspiracyFiles.T12Mode
end
local function wrapper() local w=ModData.get("ConspiracyFiles.Generated.G2");return w and Cases.current(w) end
local function session(id)
 local w=wrapper();return w and (id and Cases.find(w,id) or w.canonical)
end
local function discoveries() local w=wrapper();return w and Cases.discoveries(w) or {} end
local function valid(r)
 local ok=V.validateStructure(r)
 if not ok or type(r)~="table" or r.schema~=1 or type(r.records)~="table" or V.estimateEncodedBytes(r)>24000 then return false end
 for k in pairs(r) do if k~="schema" and k~="records" then return false end end
 local n=0
 for id,v in pairs(r.records) do
  n=n+1
  if n>64 or type(id)~="string" or #id>160 or type(v)~="table" or type(v.map)~="string" or #v.map>1000 or type(v.written)~="boolean" then return false end
  for k in pairs(v) do if k~="x" and k~="y" and k~="z" and k~="map" and k~="written" and k~="ink" then return false end end
  if v.ink~=nil and (type(v.ink)~="string" or not inks[v.ink] or not v.written) then return false end
  for _,k in ipairs({"x","y","z"}) do if type(v[k])~="number" or v[k]~=math.floor(v[k]) or math.abs(v[k])>100000 then return false end end
 end
 return true
end
local function read()
 local p=getPlayer();if not p then return end
 local r=p:getModData()[TAG]
 if r==nil then return {schema=1,records={}} end
 if not valid(r) then error("saved marker records refused") end
 return r
end
local function copy(r)
 local out={schema=1,records={}}
 for id,v in pairs(r.records) do out.records[id]={x=v.x,y=v.y,z=v.z,map=v.map,written=v.written,ink=v.ink} end
 return out
end
local function commit(r)
 if not valid(r) then error("marker data invalid or budget exceeded") end
 local within,why=require("ConspiracyFiles/SaveBudget").check("markers",r)
 if not within then error(why) end
 getPlayer():getModData()[TAG]=r
end
function M.writingTool(player)
 local inv=player and player:getInventory();if not inv then return false end
 for _,name in ipairs(pens) do
  if inv:containsTypeRecurse(name) or inv:containsTagRecurse(ItemTag.get(ResourceLocation.of(name))) then return name end
 end
 return false
end
function M.canWrite(player) return M.writingTool(player)~=false end
local function known(c,id)
 for _,v in ipairs(c.known) do if v==id then return true end end
 return false
end
-- Called before vanilla removes the item. Never use a placement target or reading position.
function M.before(character,item,source,destination,square)
 if not allowed() or character~=getPlayer() or not destination or not destination:isInCharacterInventory(character) then return end
 if not session() then return end
 if source and source:isInCharacterInventory(character) then return end
 if item and instanceof and instanceof(item,"InventoryContainer") then
  local w=item:getWorldItem();local origin=square or (w and w:getSquare()) or (source and source:getSourceGrid())
  if not origin then return end
  local pending={children={}};local queue={item:getInventory()};local cursor,seen,count=1,{},0
  while queue[cursor] do
   local container=queue[cursor];cursor=cursor+1
   if not seen[container] then
    seen[container]=true;local items=container:getItems()
    for i=0,items:size()-1 do
     count=count+1;if count>512 then error("bag pickup exceeds marker capture limit") end
     local child=items:get(i)
     if instanceof(child,"InventoryContainer") then queue[#queue+1]=child:getInventory()
     else local candidate=M.before(character,child,source,destination,origin)
      if candidate then pending.children[#pending.children+1]={candidate=candidate,item=child} end
     end
    end
   end
  end
  return pending
 end
 local md=item and item:getModData();local c=md and session(md.cfGeneratedId);local a=c and c.assignments[md.cfGeneratedId]
 if not a or a.status=="conflict" or md.cfPhysicalToken~=a.physicalToken then return end
 local r=read();if r.records[md.cfGeneratedId] or known(c,md.cfGeneratedId) then return end
 if not square then local w=item:getWorldItem();square=w and w:getSquare() or source and source:getSourceGrid() end
 if not square then return end
 return {id=md.cfGeneratedId,token=a.physicalToken,x=square:getX(),y=square:getY(),z=square:getZ(),map=tostring(getWorld():getMap())}
end
function M.after(candidate,item)
 if candidate and candidate.children then
  for _,entry in ipairs(candidate.children) do M.after(entry.candidate,entry.item) end
  return
 end
 if not candidate or not item or item:getOutermostContainer()~=getPlayer():getInventory() then return end
 local md=item:getModData();if md.cfGeneratedId~=candidate.id or md.cfPhysicalToken~=candidate.token then return end
 local c=session(candidate.id);local a=c and c.assignments[candidate.id]
 if not a or a.physicalToken~=candidate.token or a.status=="conflict" then return end
 local r=read();if r.records[candidate.id] then return end
 local next=copy(r);next.records[candidate.id]={x=candidate.x,y=candidate.y,z=candidate.z,map=candidate.map,written=false}
 commit(next);log("Finding location recorded. Inspect the item to add it to your evidence.")
end
function M.update()
 if not allowed() or not getPlayer() then return end
 if not session() then return end
 local r=read();local next
 for _,id in ipairs(discoveries()) do local c=session(id)
  local v=r.records[id];local a=c.assignments[id]
  if v and not v.written and a and a.status~="conflict" and v.map==tostring(getWorld():getMap()) then
   local ink=M.writingTool(getPlayer());if not ink then return end
   next=next or copy(r);next.records[id].written=true;next.records[id].ink=ink
  end
 end
 if next then
  commit(next);log("Pending clue locations added to the map.")
  local ui=ConspiracyFiles.NotebookUI
  if ui and ui.refresh then pcall(ui.refresh) end
 end
end
function M.note(id)
 local c=session(id);if not c or not known(c,id) then return nil end
 local r=read();local v=r and r.records[id]
 if not v then return "Finding location was not recorded; no map mark is available." end
 if v.written then return "Finding location marked on your world map." end
 if c.assignments[id] and c.assignments[id].status=="conflict" then return "Map marking is unavailable for this document." end
 return "Finding location remembered. Map marking waits for a pen or pencil."
end
function M.status()
 local r=read();local written,pending,missing=0,0,0
 if r then for _,id in ipairs(discoveries()) do local v=r.records[id]
  if not v then missing=missing+1 elseif v.written then written=written+1 else pending=pending+1 end
 end end
 log("Marked="..written.."; waiting for writing tool="..pending.."; historical finding location unavailable="..missing)
 return written,pending,missing
end
function M.drawRecords(ui,c,r)
 if not ui or not r or not ui.mapAPI or ui.mapAPI:getZoomF()<14 then return end
 local groups,order={},{}
 for i,id in ipairs(c.known) do
  local v=r.records[id]
  if v and v.written and v.map==tostring(getWorld():getMap()) then
   local key=v.x..":"..v.y..":"..v.z
   if not groups[key] then groups[key]={point=v,labels={}};order[#order+1]=key end
   local title=id
   for _,d in ipairs(c.case.documents) do if d.id==id then title=d.title end end
   local g=groups[key];g.labels[#g.labels+1]={number=i,title=title,floor=v.z,ink=v.ink}
  end
 end
 -- Match vanilla ISWorldMapSymbols:onAddNote: use the default text layer font.
 local font=UIFont.Handwritten or UIFont.Small
 local ok,nativeFont=pcall(function()
  local symbols=ui.mapAPI:getSymbolsAPIv2()
  return ui.mapAPI:getStyleAPI():getLayerByName(symbols:getDefaultTextLayerID()):getFont()
 end)
 if ok and nativeFont then font=nativeFont end
 for _,key in ipairs(order) do
  local g=groups[key];local v=g.point
  local x,y=ui.mapAPI:worldToUIX(v.x+0.5,v.y+0.5),ui.mapAPI:worldToUIY(v.x+0.5,v.y+0.5)
  if x>16 and y>60 and x<ui.width-24 and y<ui.height-80 then
   -- Older records did not retain ink; display those in neutral graphite.
   local color=inks[v.ink] or inks.Pencil
   local size=math.min(28,getTextManager():getFontHeight(font)+2)
   if questionTexture==nil and getTexture then questionTexture=getTexture("media/ui/LootableMaps/map_question.png") end
   if questionTexture and ui.drawTextureScaled then
    ui:drawTextureScaled(questionTexture,x-size/2,y-size/2,size,size,1,color[1],color[2],color[3])
   else
    ui:drawText("?",x-4,y-8,color[1],color[2],color[3],1,font)
   end
   local h=getTextManager():getFontHeight(font)+2
   local measure=function(text) return getTextManager():MeasureStringX(font,text) end
   local labels=Layout.layout(g.labels,x+size/2,y,{left=16,top=60,right=ui.width-24,bottom=ui.height-80},h,measure)
   for i,label in ipairs(labels) do
    local ink=inks[g.labels[i].ink] or inks.Pencil
    ui:drawText(label.text,label.x,label.y,ink[1],ink[2],ink[3],1,font)
   end
  end
 end
end
function M.draw(ui)
 if not allowed() or not getPlayer() then return end
 if not session() then return end
 local c={known=discoveries(),case={documents={}}}
 for _,id in ipairs(c.known) do local root=session(id);if root then for _,d in ipairs(root.case.documents) do if d.id==id then c.case.documents[#c.case.documents+1]=d end end end end
 M.drawRecords(ui,c,read())
end
local function safe(fn,...)
 local ok,result=pcall(fn,...);if not ok then log("Skipped: "..tostring(result));return end
 return result
end
function M.stop() if handler then Events.OnTick.Remove(handler);handler=nil end end
function M.start()
 if not allowed() then return false end
 require("TimedActions/ISTransferAction");require("TimedActions/ISGrabItemAction");require("ISUI/Maps/ISWorldMap")
 if not ConspiracyFiles.markerHooks then
  local transfer=ISTransferAction.transferItem
  ISTransferAction.transferItem=function(self,character,item,source,destination,...)
   local m=ConspiracyFiles.ClueMarkers
   local pending=safe(m.before,character,item,source,destination)
   local result=transfer(self,character,item,source,destination,...)
   safe(m.after,pending,result or item)
   return result
  end
  local grab=ISGrabItemAction.transferItem
  ISGrabItemAction.transferItem=function(self,worldItem,...)
   local m=ConspiracyFiles.ClueMarkers;local item=worldItem:getItem()
   local pending=safe(m.before,self.character,item,nil,self.destContainer,worldItem:getSquare())
   local result=grab(self,worldItem,...);safe(m.after,pending,item);return result
  end
  local render=ISWorldMap.render
  ISWorldMap.render=function(ui,...)
   render(ui,...)
   local m=ConspiracyFiles.ClueMarkers
   if not m.renderFailed then local ok,why=pcall(m.draw,ui);if not ok then m.renderFailed=true;log("Map overlay stopped: "..tostring(why)) end end
  end
  ConspiracyFiles.markerHooks=true
 end
 M.stop();last=0
 handler=function()
  if getTimeInMillis()-last<1000 then return end;last=getTimeInMillis()
  local ok,why=pcall(M.update);if not ok then M.stop();log("Worker stopped: "..tostring(why)) end
 end
 Events.OnTick.Add(handler);log("Clue markers active; pickup sources are now recorded.");M.status();return true
end
if not ConspiracyFiles.markerStartHook then
 Events.OnGameStart.Add(function() if ConspiracyFiles.ClueMarkers then safe(ConspiracyFiles.ClueMarkers.start) end end)
 ConspiracyFiles.markerStartHook=true
end
return M

end)()
return markers.start()
end
-- END clue-marker hot-load bundle.
-- BEGIN marker-colour-test hot-load bundle.
function UI.enableMarkerColourTest()
local test=(function()
-- Debug fixture only.  It never participates in generated evidence or marker saves.
ConspiracyFiles=ConspiracyFiles or {}
local T=ConspiracyFiles.MarkerColourTest or {};ConspiracyFiles.MarkerColourTest=T
if T.loaded then return T end
local items,records,started,tick={},{},false,nil
local owner,last=nil,0
local KEY="cfMarkerColourTest"
local function allowed()
 return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
  and not ConspiracyFiles.T11Mode and not ConspiracyFiles.T12Mode
end
local function player() return getPlayer and getPlayer() end
local function owned(item,p) return item and p and item:getOutermostContainer()==p:getInventory() end
local function currentMap() return tostring(getWorld():getMap()) end
local function add(context,key,label,callback,disabled)
 for _,option in ipairs(context.options or {}) do if option.cfMarkerColourTest==key then return option end end
 local option=context:addOption(label,nil,callback)
 if option then option.cfMarkerColourTest=key;option.notAvailable=disabled==true end
 return option
end
local function isFixture(item)
 for _,candidate in ipairs(items) do if candidate==item then return true end end
 return false
end
local function inspect(item)
 local p=player();if not isFixture(item) or not owned(item,p) then return end
 local r=records[item];if r then r.known=true end
end
function T.fill(playerNum,context,selected)
 if not allowed() or not context or playerNum~=0 or player()~=owner then return end
 local normalize=ConspiracyFiles.ContextMenu and ConspiracyFiles.ContextMenu.normalize
 if not normalize then return end
 local choices,overflow=normalize(selected)
 if overflow or #choices~=1 or not isFixture(choices[1]) then return end
 local item=choices[1];local p=getSpecificPlayer(playerNum)
 add(context,"ConspiracyFiles:MarkerColourTest","Inspect Temporary Marker Test",function()
  local m=ConspiracyFiles.MarkerColourTest;if m then pcall(inspect,item) end
 end,not owned(item,p))
end
function T.update()
 if not allowed() or player()~=owner then return end
 local p=player();local markers=ConspiracyFiles.ClueMarkers
 if not p or not markers or not markers.writingTool then return end
 local ink=markers.writingTool(p);if not ink then return end
 for _,item in ipairs(items) do
  local r=records[item]
  if r and r.known and not r.written then r.written=true;r.ink=ink end
 end
end
function T.draw(ui)
 if not allowed() or not started or player()~=owner then return end
 local markers=ConspiracyFiles.ClueMarkers;if not markers or not markers.drawRecords then return end
 local known,documents,out={}, {},{schema=1,records={}}
 for i,item in ipairs(items) do
  local r=records[item]
  if r and r.known then
   local id="temporary-marker-colour-"..i;known[#known+1]=id
   documents[#documents+1]={id=id,title=item:getName()}
   out.records[id]={x=r.x,y=r.y,z=r.z,map=r.map,written=r.written,ink=r.ink}
  end
 end
 markers.drawRecords(ui,{known=known,case={documents=documents}},out)
end
function T.start()
 if not allowed() then return false end
 if started then return true end
 local p=player();local square=p and p:getCurrentSquare();if not square then return false end
 -- Mark the attempt before creating anything: a partial engine failure stays bounded.
 started=true;owner=p
 for i,name in ipairs({"TEMP TEST A - marker colour","TEMP TEST B - marker colour"}) do
  -- Vanilla OnBreak.lua: string overload returns InventoryItem, not IsoWorldInventoryObject.
  local item=square:AddWorldInventoryItem("Base.Note",0.5,0.5,0.0)
 if not item then print("[CF-MARKER-TEST] Spawn stopped before all notes were created.");return false end
  item:setName(name);item:setCustomName(true);item:getModData()[KEY]=true
  items[i]=item;records[item]={x=square:getX(),y=square:getY(),z=square:getZ(),map=currentMap(),known=false,written=false}
 end
 if not T.menuHandler then
  T.menuHandler=function(playerNum,context,selected) local m=ConspiracyFiles.MarkerColourTest;if m then pcall(m.fill,playerNum,context,selected) end end
  Events.OnFillInventoryObjectContextMenu.Add(T.menuHandler)
 end
 if not T.renderHook then
  require("ISUI/Maps/ISWorldMap");local previous=ISWorldMap.render
  ISWorldMap.render=function(ui,...)
   previous(ui,...);local m=ConspiracyFiles.MarkerColourTest;if m then pcall(m.draw,ui) end
  end
  T.renderHook=true
 end
 if tick then Events.OnTick.Remove(tick) end
 tick=function()
  local now=getTimeInMillis();if now-last<1000 then return end;last=now
  local m=ConspiracyFiles.MarkerColourTest;if m then pcall(m.update) end end
 Events.OnTick.Add(tick)
 print("[CF-MARKER-TEST] Spawned two temporary notes at the current square. Pick up one, then inspect it from inventory.")
 return true
end
function T.stop() if tick then Events.OnTick.Remove(tick);tick=nil end end
T.loaded=true
return T

end)()
return test.start()
end
-- END marker-colour-test hot-load bundle.
-- BEGIN notebook-toolbar hot-load bundle.
function UI.enableNotebookToolbar()
local toolbar=(function()
-- Additive sidebar shortcut.  It deliberately does not patch ISEquippedItem:
-- Build 42 exposes no sidebar-button event, so this follows the existing
-- Project Cook pattern of a separately managed sibling beside the anchor.
require "ISUI/ISButton"
local UI=ConspiracyFiles.NotebookUI
ConspiracyFiles=ConspiracyFiles or {}
local Toolbar=ConspiracyFiles.NotebookToolbar or {}
ConspiracyFiles.NotebookToolbar=Toolbar

Toolbar.failed=false
local GAP=4
local HOVER_GRACE_MS=250
local TOOLBAR_VERSION=2
local NOTEBOOK_TEXTURE="media/ui/ConspiracyFiles/notebook.png"

local function supported()
    if not (getDebug and getDebug()) then return false end
    if (isClient and isClient()) or (isServer and isServer()) then return false end
    if ConspiracyFiles.T11Mode or ConspiracyFiles.T12Mode then return false end
    local runtime=ConspiracyFiles.GeneratedRuntime
    return runtime and runtime.metrics and runtime.metrics() ~= nil
end

local function closeButton()
    local button=Toolbar.button
    if button and button.removeFromUIManager then button:removeFromUIManager() end
    Toolbar.button=nil
    Toolbar.sidebar=nil
end

function Toolbar.open()
    if not supported() then return end
    if UI.notebook and UI.notebook:getIsVisible() then
        UI.notebook:close()
        return
    end
    if UI.reader then UI.reader:close() end
    UI.open("evidence")
end

function Toolbar.refresh()
    if Toolbar.failed then return end
    local ok,why=pcall(Toolbar.ensure)
    if not ok then Toolbar.failed=true;closeButton();print("[CF-NOTEBOOK] Toolbar stopped: "..tostring(why)) end
end

function Toolbar.ensure()
    local sidebar=ISEquippedItem and ISEquippedItem.instance
    local search=sidebar and sidebar.searchBtn
    if not supported() or not sidebar or not search then
        if Toolbar.button then Toolbar.button:setVisible(false) end
        Toolbar.revealed=false
        return false
    end
    if Toolbar.sidebar and Toolbar.sidebar~=sidebar then closeButton() end
    local button=Toolbar.button
    if button and button.cfNotebookToolbarVersion~=TOOLBAR_VERSION then
        closeButton(); button=nil
    end
    if not button then
        button=ISButton:new(0,0,search:getWidth(),search:getHeight(),"",nil,function() Toolbar.open() end)
        button:initialise(); button:instantiate()
        button:setDisplayBackground(false)
        button:ignoreWidthChange(); button:ignoreHeightChange()
        button:setImage(getTexture(NOTEBOOK_TEXTURE))
        button:setTooltip("Open Survivor Notebook")
        button:addToUIManager()
        button.cfNotebookToolbarVersion=TOOLBAR_VERSION
        Toolbar.button=button; Toolbar.sidebar=sidebar
    end
    button:setWidth(search:getWidth()); button:setHeight(search:getHeight())
    button:setX(sidebar:getAbsoluteX()+search:getRight()+GAP)
    button:setY(sidebar:getAbsoluteY()+search:getY())
    if not sidebar:getIsVisible() or not search:getIsVisible() then
        Toolbar.revealed=false
        button:setVisible(false)
        return true
    end
    local now=getTimestampMs and getTimestampMs() or 0
    local bridge=false
    if Toolbar.revealed and getMouseX and getMouseY then
        local mouseX,mouseY=getMouseX(),getMouseY()
        bridge=mouseX>=sidebar:getAbsoluteX()+search:getRight()
            and mouseX<=button.x and mouseY>=button.y and mouseY<=button.y+button.height
    end
    if search:isMouseOver() then
        Toolbar.revealed=true; Toolbar.hoverUntil=now+HOVER_GRACE_MS
    elseif Toolbar.revealed and (button:isMouseOver() or bridge) then
        Toolbar.hoverUntil=now+HOVER_GRACE_MS
    elseif Toolbar.revealed and now>(Toolbar.hoverUntil or 0) then
        Toolbar.revealed=false
    end
    button:setVisible(Toolbar.revealed==true)
    return true
end

function Toolbar.stop()
    closeButton()
end

if Toolbar.handler and Toolbar.event~="post-ui" then
    if Events.OnTick and Events.OnTick.Remove then Events.OnTick.Remove(Toolbar.handler) end
    Toolbar.handler=nil
end
if not Toolbar.handler then
    Toolbar.handler=function() Toolbar.refresh() end
    Events.OnPostUIDraw.Add(Toolbar.handler)
    Toolbar.event="post-ui"
end
return Toolbar

end)()
return toolbar.ensure()
end
UI.enableNotebookToolbar()
-- END notebook-toolbar hot-load bundle.
return UI
