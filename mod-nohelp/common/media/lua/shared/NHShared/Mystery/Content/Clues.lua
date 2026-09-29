-- DERIVED FILE - do not edit by hand. The No Help clue list (Manifest.clues).
--   lua5.1 tools/nohelp_content/convert.lua
-- from content/nohelp/accepted/*.json; authoring fields live in the sidecars
-- (content/nohelp/accepted/sidecar/). Writer and engineer material: the owner
-- plays blind and does not read this file.
return {clues={
-- T0001
{id="t0001-01",kind="set",pieces={"Map","KeyRing"},where={{place="police",spot="mailbox",lean="containment",rival="agricultural"}},title="The route stops at the barrier",body="The map's pencil road ends at a barrier mark. A keyring is tied across the fold; its blank tag is polished where a number was rubbed away."},
{id="t0001-02",kind="set",pieces={"Bucket","WaterBottle"},where={{place="police",spot="mailbox",lean="agricultural",rival="containment"}},title="The bottle kept the wrong color",body="A green ring stains the bottle's inner neck. The bucket beside it is dry, though its handle is wet and smells faintly of crushed leaves."},
-- T0002
{id="t0002-01",kind="set",pieces={"FirstAidKit","Bandage"},where={{place="hospital",spot="corpse",lean="containment",rival="agricultural",outfit="medical"}},title="The sealed kit on the medical coat",body="The kit's seal is unbroken. A bandage has been folded around its handle, still clean, with a patient wrist label tied through the fold and no name on it."},
{id="t0002-02",kind="set",pieces={"Notebook","WaterBottle"},where={{place="hospital",spot="corpse",lean="agricultural",rival="containment",outfit="medical"}},title="The bottle with a leaf-shaped tide",body="A brown tide line circles the bottle; the notebook beside it has one page stuck to the cap. When it lifts, a pressed leaf outline remains on the paper."},
-- T0003
{id="t0003-01",kind="set",pieces={"Map","KeyRing"},where={{place="farm",spot="ground",lean="containment",rival="agricultural"}},title="The key past the closure bar",body="The map shows a farm track ending at a thick road-closure bar. The keyring lies beyond it, tied to a tag stamped “county return.” Beside the bar, “all clear” is checked although the road is still crossed out."},
{id="t0003-02",kind="set",pieces={"SeedBag","HandShovel"},where={{place="farm",spot="ground",lean="agricultural",rival="containment"}},title="The seed bag holds a narrow trench",body="The seed bag is folded shut around the shovel handle. A straight line of dark soil runs from the blade to the bag's seam, but the shovel has no soil on its grip."},
-- T0004
{id="t0004-01",kind="set",pieces={"Map","Lunchbox"},where={{place="checkpoint",spot="vehicle",lean="containment",rival="agricultural"}},title="The lunch packed for the closed lane",body="The lunchbox is wedged beneath the map's fold. The route line passes the checkpoint and stops; a spoon has been laid across the road home."},
{id="t0004-02",kind="set",pieces={"Bucket","Fertilizer"},where={{place="checkpoint",spot="vehicle",lean="agricultural",rival="containment"}},title="The powder gathered in the bucket seam",body="Pale granules cling inside the bucket's rim. The fertilizer sack beside it is dry and carefully folded, with its open corner tucked under the seat."},
-- T0005
{id="t0005-01",kind="set",pieces={"Briefcase","Screwdriver"},where={{place="office",spot="furniture",lean="containment",rival="agricultural"}},title="The briefcase with an intact lock",body="The screwdriver lies inside the open briefcase. Its lock is intact, but the metal around the keyhole is bright from repeated turning; a loose key sits in the lining."},
{id="t0005-02",kind="set",pieces={"SeedBag","Fertilizer"},where={{place="office",spot="furniture",lean="agricultural",rival="containment"}},title="The seed packet tucked in the fertilizer fold",body="A seed packet is tucked into the fertilizer sack's stitched fold. Its planting diagram is intact; the small panel for mixing instructions has been cut out cleanly."},
-- T0006
{id="t0006-01",kind="set",pieces={"Map","Postcard"},where={{place="bookstore",spot="mailbox",lean="containment",rival="agricultural"}},title="The postcard addressed to a crossed street",body="The postcard is stamped and addressed, but the map beneath it ends at a street crossed out in pencil. The message stops after, “We were told to wait by—”."},
{id="t0006-02",kind="set",pieces={"Newspaper","Notebook"},where={{place="bookstore",spot="mailbox",lean="agricultural",rival="containment"}},title="The garden column with no matching season",body="A newspaper gardening column is folded around a notebook sketch of three crop rows. The drawing has a water line but no planting date; the column is for winter."},
-- T0007
{id="t0007-01",kind="set",pieces={"Clipboard","KeyRing"},where={{place="transmission",spot="vehicle",lean="containment",rival="agricultural"}},title="The keyring clipped over the empty page",body="The clipboard is closed around a keyring. One key leaves a clean outline in the dust, while the page beneath the clip has torn away at the holes."},
{id="t0007-02",kind="set",pieces={"Notebook","WaterBottle"},where={{place="transmission",spot="vehicle",lean="agricultural",rival="containment"}},title="The rain sketch runs into the bottle ring",body="The notebook shows rain crossing a set of crop rows. A water bottle rests on the open page; its dry ring circles the word “downhill,” written once and then erased."},
-- T0008
{id="t0008-01",kind="set",pieces={"Lunchbox","KeyRing"},where={{place="warehouse",spot="ground",lean="containment",rival="agricultural"}},title="The keys stayed outside the marked floor",body="The keyring is wrapped in the lunchbox's cloth lining. A chalk boundary crosses the lid; the ring is on the clean side and the meal on the dusty one."},
{id="t0008-02",kind="set",pieces={"Bucket","Notebook"},where={{place="warehouse",spot="ground",lean="agricultural",rival="containment"}},title="The trial strip curled after spraying",body="The notebook rests across the bucket. Its page labels two strips “control — standing” and “trial spray — curled by noon.” The next line reads “mix still active after valve shut.”"},
-- T0009
{id="t0009-01",kind="set",pieces={"Newspaper","RubberBand"},where={{place="government",spot="furniture",lean="containment",rival="agricultural"}},title="The headline held open over its correction",body="A rubber band keeps the newspaper open, but its fold covers the correction column. The headline is still visible; the folded page has split along the correction's first sentence."},
{id="t0009-02",kind="set",pieces={"GardeningSprayEmpty","Notebook"},where={{place="government",spot="furniture",lean="agricultural",rival="containment"}},title="The sprayer left its outline on the page",body="The empty garden sprayer has left a clean circle on the notebook beneath it. A dried green line runs from the nozzle to a sketch of crop rows."},
-- T0010
{id="t0010-01",kind="written",pieces={"idcard"},where={{place="farm",spot="corpse",lean="agricultural",rival="containment",outfit="farm"}},person="person-a",title="Temporary field access card",body="Field plots: weekly soil checks. Road access may close at short notice. Reverse: “Keep the old mare in the dry stall tonight.”"},
{id="t0010-02",kind="set",pieces={"Map","HandShovel"},where={{place="farm",spot="corpse",lean="agricultural",rival="containment",outfit="farm"}},person="person-a",title="The row that ends at the road",body="The map's crop row reaches the road and stops at a thumb-smudged mark. Soil fills the shovel socket but not the blade; its grip is clean."},
-- T0011
{id="t0011-01",kind="written",pieces={"idcard"},where={{place="office",spot="mailbox",lean="containment",rival="agricultural"}},person="person-b",title="County message runner card",body="Delivery: office to road crews. Return copy expected when access resumes. Reverse: “Please bring the chipped blue cup back; it was my sister's.”"},
{id="t0011-02",kind="set",pieces={"Clipboard","KeyRing"},where={{place="office",spot="mailbox",lean="containment",rival="agricultural"}},person="person-b",title="The clipboard held the only spare",body="A keyring is fastened beneath the clipboard clip. Its tag is worn smooth; the page above it has two pencil holes and no writing."},
-- T0012
{id="t0012-01",kind="written",pieces={"businesscard"},where={{place="checkpoint",spot="vehicle",lean="containment",rival="agricultural"}},person="person-c",title="Courier card with a late return",body="Transfer window: after road access ends. Return copy to sender. Reverse: “Bread for Mother, no crust if it is still warm.”"},
{id="t0012-02",kind="set",pieces={"Map","KeyRing"},where={{place="checkpoint",spot="vehicle",lean="agricultural",rival="containment"}},person="person-c",title="The key marked for the last spray run",body="The map routes past a checkpoint to the trial plots. A key tag says “sprayer pump.” In the margin, “wind turned at ten; east beans scorched by noon” is underlined twice."},
-- T0013
{id="t0013-01",kind="set",pieces={"Map","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The lap with no return mark",body="The map's route ends at a chalk line. A keyring rests across the fold back toward the starting point; its tag has no place name.",anchor={map="IrvingtonStashMap1",mark=1}},
{id="t0013-02",kind="set",pieces={"Notebook","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The bottle's ring crosses a row sketch",body="A clear ring dries across the notebook's crop-row drawing. The bottle cap is clean; the page beneath it is stained only where the drawn rows meet.",anchor={map="IrvingtonStashMap1",note=1}},
{id="t0013-03",kind="written",pieces={"dispatch"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Dispatch copy with an unfinished return",body="“Track access ends at the barrier. Keep the west lane clear for the last vehicle.” The receiving line is blank; on the back, someone asks for a green scarf to be saved.",anchor={map="IrvingtonStashMap1",note=2}},
{id="t0013-04",kind="written",pieces={"notepad"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The row count continues past the page",body="The note lists three crop rows and a water check, then continues onto the cover. “Bring the small boots home” is written below the last line.",anchor={map="IrvingtonStashMap1",note=3}},
-- T0014
{id="t0014-01",kind="set",pieces={"Screwdriver","RubberBand"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The tire offer marked on a tool handle",body="A rubber band holds a service slip to the screwdriver. Four circles are drawn beside one wheel sketch; only the outer groove is filled with dark dust.",anchor={print="AmericanTire"}},
{id="t0014-02",kind="written",pieces={"receipt"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The fourth tire omitted from the return",body="The receipt charges four tires to the county road crew, but lists only three serial numbers. Beside the blank fourth line, someone wrote “keep off public return until clearance review.” Reverse: “Save the smoothest for the child's bicycle.”",anchor={print="AmericanTire"}},
-- T0015
{id="t0015-01",kind="set",pieces={"Map","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The key points past the marked road",body="The map is folded toward its road line; the keyring lies beyond the fold, its tag turned face down. A short length of thread joins them but does not reach the road.",anchor={map="EkronStashMap8",mark=1}},
{id="t0015-02",kind="written",pieces={"letter"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The note that asks someone to come back",body="“Forget the box. Just get here before the rows are watered.” The lower half is torn away; a muddy thumb has blurred the place where a name would go.",anchor={map="EkronStashMap8",mark=1}},
-- T0016
{id="t0016-01",kind="set",pieces={"Map","KeyRing"},where={{place="transmission",spot="vehicle",lean="containment",rival="agricultural"}},title="The last stop crossed off the van route",body="The route on the map ends at a closed road. A keyring is tucked beneath the last stop, its tag stamped “return”; the return line has been crossed out.",anchor={scene="RVSPlonkies"}},
{id="t0016-02",kind="set",pieces={"SeedBag","Fertilizer"},where={{place="farm",spot="vehicle",lean="agricultural",rival="containment"}},title="The seed sack kept beside the fertilizer",body="The seed sack is wedged against the fertilizer bag in the van. Its stitched mouth is green at one corner; the label on the fertilizer is clean where a thumb would lift it.",anchor={scene="RVSPlonkies"}},
-- T0017
{id="t0017-01",kind="set",pieces={"FirstAidKit","Bandage"},where={{place="police",spot="furniture",lean="containment",rival="agricultural"}},title="The first-aid kit under the kitchen shelf",body="The kit is sealed and pushed behind a rat-chewed board. One bandage has been set on top, dry and neatly folded as if someone expected to return for it.",anchor={scene="RDSRatKing"}},
{id="t0017-02",kind="set",pieces={"GardeningSprayEmpty","Notebook"},where={{place="farm",spot="furniture",lean="agricultural",rival="containment"}},title="The spray bottle with a page stuck to it",body="The empty sprayer is tacky around its trigger. A notebook page has dried against its side; the page shows a rat-chewed root beside three crop rows.",anchor={scene="RDSRatKing"}},
-- T0018
{id="t0018-01",kind="set",pieces={"Clipboard","KeyRing"},where={{place="office",spot="furniture",lean="containment",rival="agricultural"}},title="The studio key clipped to a blank rundown",body="The keyring is clipped to a blank page in the studio desk. The only pencilled line says “doors locked”; the box for who checked them is empty.",anchor={scene="RBJackieJaye",version="A"}},
{id="t0018-02",kind="set",pieces={"Notebook","WaterBottle"},where={{place="office",spot="furniture",lean="agricultural",rival="containment"}},title="The field sketch under the studio glass",body="The notebook is trapped beneath a glass desk cover. A crop-row sketch has a water stain across its center; the bottle beside it is dry and capped.",anchor={scene="RBJackieJaye",version="B"}},
-- T0020
{id="t0020-01",kind="set",pieces={"SheetPaper2","Pencil","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Road closure practice",body="Lesson dates stop at the county road closure; the house key is tied to the page beside a note to keep the fee for the missed lessons. No return date is written.",anchor={map="BBurgStashMap1",mark=1}},
{id="t0020-02",kind="written",pieces={"letter"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Closed windows",body="Please keep the lesson room shut until the roadside spray test is over. The children can still hear the truck from the front room; their mother has paid for the whole week already.",anchor={map="BBurgStashMap1",mark=1}},
-- T0021
{id="t0021-01",kind="set",pieces={"Map","KeyRing","Pencil"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="No return time",body="The pencilled route to the house ends at an ammunition collection point; the key ring is tagged 'back before supper,' but no return time is entered.",anchor={map="LouisvilleStashMap1",mark=1}},
{id="t0021-02",kind="written",pieces={"letter"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The tin is for screws",body="The test-plot sample jars lost their labels in the rain. Don't put pesticide samples in the rifle-cleaning tin again; the household still keeps its loose screws there.",anchor={map="LouisvilleStashMap1",mark=1}},
-- T0022
{id="t0022-01",kind="set",pieces={"ShotgunShells","Map","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Inventory closed before the gate",body="The shell box is signed out at 6:10, the marked route is closed at 5:40, and a spare key is still tied to the map. The return box is blank.",anchor={map="MarchRidgeStashMap1",mark=1}},
{id="t0022-02",kind="written",pieces={"notepad"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The jars stay sealed",body="Keep the pesticide trial jars sealed until the boundary check is done. The neighbor keeps knocking because the map says don't go; the dog is still in the yard.",anchor={map="MarchRidgeStashMap1",mark=1}},
-- T0023
{id="t0023-01",kind="set",pieces={"RadioReceiver","Battery","Screwdriver"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Acknowledged from the bench",body="The receiver sat on the repair bench during the evacuation alert, screwdriver beside its charged battery. Dispatch's log says it acknowledged the alert there. The owner signed for it next morning and lost lunch money for the missed shift.",anchor={print="CircuitalHealing"}},
{id="t0023-02",kind="written",pieces={"receipt"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="No fault at the plot",body="The field trial's receiver came back marked 'no fault found,' though it stopped transmitting at the plot. The owner asked to hold the invoice until after harvest; the bench still wants payment.",anchor={print="CircuitalHealing"}},
-- T0024
{id="t0024-01",kind="set",pieces={"SpeedingTicket","BeerBottle","Pencil"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A citation after closing",body="The speeding citation is stamped after the access lane's closure; the beer at the gate is still sealed, and the appeal line says its driver was taking a child home.",anchor={print="IrvingtonSpeedway"}},
{id="t0024-02",kind="written",pieces={"memo"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The infield stays closed",body="Keep the infield closed until the pesticide trial dries. The first heat remains on the board, so the groundskeeper has to refund a child's ticket from his own coffee jar.",anchor={print="IrvingtonSpeedway"}},
-- T0027
{id="t0027-01",kind="set",pieces={"SheetPaper2","Pencil","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The key return",body="A master key lies across a folded departure notice; the hall door was logged locked before the bus left, though a margin says it stood open. The custodian has underlined “return key” twice.",anchor={map="BBurgStashMap2",mark=1}},
{id="t0027-02",kind="written",pieces={"letter"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Before the beds dry",body="The caretaker says the grounds crew borrowed the kitchen sink for a rinse. Please keep the side room locked until the treated beds are dry; the folding chairs are still needed tomorrow.",anchor={map="BBurgStashMap2",mark=1}},
-- T0028
{id="t0028-01",kind="set",pieces={"EmptyJar","Pencil","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The unfinished handoff",body="The kitchen jar sits beside a rinse note for the grounds crew; the fish order was cancelled on the same afternoon.",anchor={map="BBurgStashMap3",mark=1}},
{id="t0028-02",kind="written",pieces={"receipt"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Kept from the drawer",body="The repair ticket orders the front doors open for pickup, but the locksmith billed for cutting off the back lock. Tomorrow’s lunch count is still pencilled in.",anchor={map="BBurgStashMap3",mark=1}},
-- T0029
{id="t0029-01",kind="set",pieces={"SheetPaper2","Pencil","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The unfinished handoff",body="The pickup card assigns each trailer a time, then records the vehicle at the gate before the first family is listed. The spare hitch key is still here.",anchor={map="BBurgStashMap4",mark=1}},
{id="t0029-02",kind="written",pieces={"letter"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Kept from the drawer",body="You said one bite was enough, so I marked the water barrel too. The field crew calls the rinse routine; I still will not let the dog drink until the tank is flushed.",anchor={map="BBurgStashMap4",mark=1}},
-- T0030
{id="t0030-01",kind="written",pieces={"receipt"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The unfinished handoff",body="Do not sell the catch until the county finishes its water check. They called it routine, but the fish order is still in the icebox and the supplier wants payment.",anchor={map="BBurgStashMap5",mark=1}},
{id="t0030-02",kind="set",pieces={"TinOpener","SheetPaper2","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Kept from the drawer",body="The cold-room key is tied to a delivery slip marked received before the road closure. The sealed box is still listed as waiting at the storage units.",anchor={map="BBurgStashMap5",mark=1}},
-- T0031
{id="t0031-01",kind="written",pieces={"letter"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The unfinished handoff",body="I left the spare key where you asked. The bus went past the property, but the office says our address was never on its pickup list. I thought you would come back for me.",anchor={map="BBurgStashMap6",mark=1}},
{id="t0031-02",kind="set",pieces={"Notebook","Pencil","Teacup"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Kept from the drawer",body="Two cups are set beside a test-day notebook. The only signed line is for the room key; a note asks that the sample page stay out of the household drawer.",anchor={map="BBurgStashMap6",mark=1}},
-- T0032
{id="t0032-01",kind="set",pieces={"BaseballBat","KeyRing","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The unfinished handoff",body="The gate key is pinned under a closure notice dated after the guard shift ended. Someone wedged a bat across the latch from the inside.",anchor={map="BBurgStashMap7",mark=1}},
{id="t0032-02",kind="written",pieces={"notepad"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Kept from the drawer",body="Leave the canisters outside the fence until the grounds crew finishes the test. The gate was already locked when the delivery arrived; the return form charges us for the missing seal.",anchor={map="BBurgStashMap7",mark=1}},
-- T0033
{id="t0033-01",kind="set",pieces={"Notebook","KeyRing","WaterBottle"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The unfinished handoff",body="Two keys are taped to separate collection times. A bottle marked for the passenger has no return mark, though the driver’s sheet says every seat was cleared.",anchor={map="BBurgStashMap8",mark=1}},
{id="t0033-02",kind="written",pieces={"letter"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Kept from the drawer",body="The room smells like the liquid from the field bottles, and Mom’s throat still hurts. I opened the window; the return truck says nothing spilled.",anchor={map="BBurgStashMap8",mark=1}},
-- T0034
{id="t0034-01",kind="set",pieces={"Screwdriver","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Tool return",body="The factory tool sheet lists the sprayer nozzle as returned before the shift began; a grease thumbprint covers the signature.",anchor={map="EkronStashMap1",mark=1}},
-- T0035
{id="t0035-01",kind="set",pieces={"Potato","Notebook"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The last crate",body="The vegetable crate has a delivery tag dated after the road was closed. A pencilled note asks whether the driver should still be charged for the trip.",anchor={map="EkronStashMap2",mark=1}},
-- T0036
{id="t0036-01",kind="set",pieces={"Bag_ALICEpack","Fertilizer"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Goods kept apart",body="A fertilizer bag is tied shut inside a supply pack; the page tucked under it lists a return trip but no recipient.",anchor={map="EkronStashMap3",mark=1}},
-- T0037
{id="t0037-01",kind="set",pieces={"KeyRing","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Empty address line",body="The spare key is tagged for the address but the transfer sheet has no receiving signature. Someone has checked the box marked “delivered.”",anchor={map="EkronStashMap4",mark=1}},
-- T0038
{id="t0038-01",kind="set",pieces={"Bandage","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Aid for the school",body="The school aid list pairs a bandage with a note to keep the test-room door shut; the last line asks who will collect the used kit.",anchor={map="EkronStashMap5",mark=1}},
-- T0039
{id="t0039-01",kind="set",pieces={"Bleach","WaterBottle"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Advice by the sink",body="A bottle of bleach sits beside a copied warning and a water bottle with its cap still sealed. The note says the caller was told to wait for instructions.",anchor={map="EkronStashMap6",mark=1}},
-- T0040
{id="t0040-01",kind="set",pieces={"Map","Pencil"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="A route left open",body="The marked route has a pencilled return arrow but no destination name; a note beside it asks whether the field check is still happening.",anchor={map="EkronStashMap7",mark=1}},
-- T0041
{id="t0041-01",kind="set",pieces={"LetterHandwritten","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The threat with a key",body="A house key is wrapped in a threatening note; the envelope has a return mark but no delivery mark.",anchor={map="IrvingtonStashMap2",mark=1}},
-- T0042
{id="t0042-01",kind="set",pieces={"WalkieTalkie1","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Radio at the school",body="The school route slip tells the driver to radio before turning back; its attendance copy lists the field crew under “visitors.”",anchor={map="IrvingtonStashMap3",mark=1}},
-- T0043
{id="t0043-01",kind="set",pieces={"SheetPaper2","Pencil"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A verse on the return",body="A copied verse about helping a wounded stranger is folded around an unpaid bar tab; the return slip marks the road pass as revoked.",anchor={map="IrvingtonStashMap4",mark=1}},
-- T0044
{id="t0044-01",kind="set",pieces={"Potato","KeyRing"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Food left for later",body="A food bag is tied to the pantry key with a note to leave one portion for the next shift. The kitchen list says the garden delivery never arrived.",anchor={map="IrvingtonStashMap5",mark=1}},
-- T0045
{id="t0045-01",kind="set",pieces={"HandTorch","Map"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Light for the careful",body="The torch is set on a marked route beside a note to check each door before leaving. The last checked address has no time beside it.",anchor={map="IrvingtonStashMap6",mark=1}},
-- T0046
{id="t0046-01",kind="set",pieces={"Notebook","SeedBag"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Field notes without a heading",body="A seed packet rests in a notebook whose first page is missing; the only surviving line asks whether the plots were watered before the crew arrived.",anchor={map="IrvingtonStashMap7",mark=1}},
-- T0047
{id="t0047-01",kind="set",pieces={"BathTowel","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The last clean towel",body="A laundry token is tied to the restaurant key, but the posted pickup list ends before the names marked “still here.”",anchor={map="IrvingtonStashMap8",mark=1}},
-- T0048
{id="t0048-01",kind="set",pieces={"Hammer","Nails"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Fortification order",body="A hammer and unopened nails sit beside a note to brace the garden-side door before the next treatment. The note does not say who will return.",anchor={map="IrvingtonStashMap9",mark=1}},
-- T0049
{id="t0049-01",kind="set",pieces={"RadioBlack","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="We will stay reachable",body="A radio is packed with the house key and a note promising someone will remain at the marked address. The battery receipt is dated after the promised check-in.",anchor={map="IrvingtonStashMap10",mark=1}},
-- T0050
{id="t0050-01",kind="set",pieces={"Book","LetterHandwritten"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="A gift for the visit",body="A book is wrapped in a note asking someone to bring it on a family visit; the back mentions keeping the garden hose off the marked ground.",anchor={map="LouisvilleStashMap2",mark=1}},
-- T0051
{id="t0051-01",kind="set",pieces={"Screwdriver","Notebook"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Tools left at school",body="The janitor’s tool list marks the rear door repaired, but the key return is dated before the repair was finished.",anchor={map="LouisvilleStashMap3",mark=1}},
-- T0052
{id="t0052-01",kind="set",pieces={"Sledgehammer","PetrolCan"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The stop at the station",body="A sledge is marked for a station delivery while the fuel can is logged as empty before the driver’s return. The receipt leaves the destination blank.",anchor={map="LouisvilleStashMap4",mark=1}},
-- T0053
{id="t0053-01",kind="set",pieces={"Bag_Schoolbag","WaterBottle"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A family moved on",body="A school bag and water bottle are listed for collection at the gym, but the driver marked the family transferred before the pickup time.",anchor={map="LouisvilleStashMap5",mark=1}},
-- T0054
{id="t0054-01",kind="set",pieces={"SeedBag","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Home plot notes",body="A seed bag is stored beside a water bottle labelled for the back plot; a note says to stop watering until the test results arrive.",anchor={map="LouisvilleStashMap6",mark=1}},
-- T0055
{id="t0055-01",kind="set",pieces={"KeyRing","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Everything accounted for",body="The house key is clipped to a checklist that says the rooms were cleared; a note on the reverse asks who will collect the owner’s coat.",anchor={map="LouisvilleStashMap7",mark=1}},
-- T0056
{id="t0056-01",kind="set",pieces={"Pills","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Third door supply",body="A packet of pills is paired with a note to keep the third room ventilated after the bottles are opened. The return line for the bottles is blank.",anchor={map="LouisvilleStashMap8",mark=1}},
-- T0057
{id="t0057-01",kind="set",pieces={"HuntingRifle","CannedCorn"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Stable stores",body="A food tin is tied to a stable key with a route note warning the next driver not to take the tree road. The return time is crossed out.",anchor={map="LouisvilleStashMap9",mark=1}},
-- T0058
{id="t0058-01",kind="set",pieces={"Bread","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Food without a gun",body="A bread receipt is tucked inside a note asking the next visitor not to bring a crowd. The back lists a garden delivery that never reached the house.",anchor={map="LouisvilleStashMap10",mark=1}},
-- T0059
{id="t0059-01",kind="set",pieces={"KeyRing","Notebook"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Storage access list",body="The storage key is attached to a list that marks the units empty, although a handwritten note asks for another count before the hospital run.",anchor={map="LouisvilleStashMap11",mark=1}},
-- T0060
{id="t0060-01",kind="set",pieces={"Pizza","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Food tent supply",body="The tent’s drink list includes water from the garden hose; a note says the hose was used to rinse equipment before the food shift.",anchor={map="LouisvilleStashMap12",mark=1}},
-- T0061
{id="t0061-01",kind="set",pieces={"Hammer","Garbagebag"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Backyard clearing list",body="The house list calls the yards secure, but a tied garbage bag contains the last gate latch and a note to check behind each fence.",anchor={map="LouisvilleStashMap13",mark=1}},
-- T0062
{id="t0062-01",kind="set",pieces={"Nails","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Half-hour repair",body="The plank receipt is stapled to a note asking everyone to stay outside until the treated boards dry. A radio call time is written beside “half hour.”",anchor={map="LouisvilleStashMap14",mark=1}},
-- T0063
{id="t0063-01",kind="set",pieces={"Book","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The gallery key",body="The gallery key is wrapped in a request to protect the collection; the handover form says the building was secure before the key was returned.",anchor={map="LouisvilleStashMap15",mark=1}},
-- T0064
{id="t0064-01",kind="set",pieces={"Bag_Schoolbag","Map"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Safe route south",body="A child’s bag is packed with a route note directing the family south; the same page warns them away from the treated street.",anchor={map="LouisvilleStashMap16",mark=1}},
-- T0065
{id="t0065-01",kind="set",pieces={"Pistol","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Supplies at the store",body="A pistol is wrapped in a store receipt with a note to leave the remaining supplies for the next family. The collection time is earlier than the closure notice.",anchor={map="MarchRidgeStashMap2",mark=1}},
-- T0066
{id="t0066-01",kind="set",pieces={"Bread","Map"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Last place on the route",body="A bakery receipt is tucked into a hunting route map; a note marks the last sighting beside a field-use date that was crossed out.",anchor={map="MarchRidgeStashMap3",mark=1}},
-- T0068
{id="t0068-01",kind="set",pieces={"Bag_ALICEpack","Map"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Help before the turn",body="The route sketch marks one aid bundle delivered before the families are listed. A child’s drawing of the return road is tucked behind the empty passenger line.",anchor={map="MarchRidgeStashMap4",mark=1}},
-- T0069
{id="t0069-01",kind="set",pieces={"BaseballBat","Bandage"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Quiet supplies",body="A bandage and a bat share a medical-center bag; the note on its tie says to leave the back room quiet until the wash is finished.",anchor={map="MarchRidgeStashMap5",mark=1}},
-- T0070
{id="t0070-01",kind="set",pieces={"Hammer","Nails"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The secured doorway",body="The hardware receipt is pinned to a building checklist marked secure; its final line asks who collected the key after the crew left.",anchor={map="MarchRidgeStashMap6",mark=1}},
-- T0071
{id="t0071-01",kind="set",pieces={"Notebook","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Fever without a mark",body="A bottle is set beside a fever note that says no bite was seen. The water-use line for the day has been crossed out, then copied back in.",anchor={map="MarchRidgeStashMap7",mark=1}},
-- T0072
{id="t0072-01",kind="set",pieces={"Screwdriver","KeyRing"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Tools for someone else",body="The old tool key is attached to a service slip that records a sprayer check after the tools were put away. No recipient signed the return.",anchor={map="MarchRidgeStashMap8",mark=1}},
-- T0073
{id="t0073-01",kind="set",pieces={"Pistol","Bread"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A place at the table",body="The food bundle is tied to a route note for new arrivals; the last line says the group left before the next watch could bring the promised supplies.",anchor={map="MarchRidgeStashMap9",mark=1}},
-- T0074
{id="t0074-01",kind="set",pieces={"Book","HandTorch"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="A blessing and a warning",body="A small book is wrapped around a note asking that the lamp stay outside until the treated ground dries. The writer has left a space for a reply.",anchor={map="MarchRidgeStashMap10",mark=1}},
-- T0075
{id="t0075-01",kind="set",pieces={"Hammer","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Under the boards",body="A repair sheet lists floorboards lifted for a crowd shelter, but the count of returned boards is higher than the count issued. One nail is still bent flat.",anchor={map="MulStashMap1",mark=1}},
-- T0076
{id="t0076-01",kind="set",pieces={"SeedBag","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Left for the next visit",body="The seed packet is kept with a bottle labelled for the plot; a note asks the next visitor to wait for the field reading before opening either.",anchor={map="MulStashMap2",mark=1}},
-- T0077
{id="t0077-01",kind="set",pieces={"Pistol2","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Trouble behind the counter",body="A security inventory lists one weapon behind the counter and a second transfer to an unnamed pickup crew. The signature box is blank.",anchor={map="MulStashMap11",mark=1}},
-- T0078
{id="t0078-01",kind="set",pieces={"Sledgehammer","KeyRing"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Hidden delivery",body="A store key is tied to a note about a hidden supply bundle; the delivery was logged before the crew’s field date, and no one signed for it.",anchor={map="MulStashMap3",mark=1}},
-- T0079
{id="t0079-01",kind="set",pieces={"Bandage","FirstAidKit"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The easier exit",body="The medical bag is left beside a route card that sends the occupants through the side exit; the building check says the main door was already cleared.",anchor={map="MulStashMap4",mark=1}},
-- T0080
{id="t0080-01",kind="set",pieces={"Pistol","CannedCorn"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Kitchen stores",body="A food tin and a supply tag are placed together; the tag asks that the kitchen water be held until the crowd has passed the back lot.",anchor={map="MulStashMap12",mark=1}},
-- T0081
{id="t0081-01",kind="set",pieces={"Notebook","Pencil"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The page without a mark",body="The notebook has one page torn out and a route copy with a blank arrival box. A pencilled note asks whether the driver should wait or report the stop complete.",anchor={map="MulStashMap5",mark=1}},
-- T0082
{id="t0082-01",kind="set",pieces={"Bag_ALICEpack","Pistol"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Too heavy to carry",body="The packed bag contains field gloves and a route card crossed out at the supply stop. A separate line records that the crew heard shots and left the load.",anchor={map="MulStashMap13",mark=1}},
-- T0083
{id="t0083-01",kind="set",pieces={"Hammer","Bandage"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Plan B in the margin",body="A fortification list pairs a brace for the door with a bandage request; the person assigned to carry both has no check-out time.",anchor={map="MulStashMap6",mark=1}},
-- T0084
{id="t0084-01",kind="set",pieces={"TinOpener","Pills"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Full store, missing check",body="A store receipt lists every shelf as stocked, while a note asks the crew to keep the test supplies separate from food. The separation box is blank.",anchor={map="MulStashMap7",mark=1}},
-- T0085
{id="t0085-01",kind="set",pieces={"SheetPaper2","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A burial request",body="The key to the gathering place is wrapped in a burial request; a second note says the crowd count has not changed since the last check.",anchor={map="MulStashMap8",mark=1}},
-- T0086
{id="t0086-01",kind="set",pieces={"HandTorch","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The unread page",body="A field notebook is closed under a torch; the last page asks whether the sample was taken before the building emptied.",anchor={map="MulStashMap9",mark=1}},
-- T0087
{id="t0087-01",kind="set",pieces={"Disinfectant","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Clear on the first pass",body="A door key is kept with a cleaning bottle and a checklist that says the rooms were clear. The back asks for one more walk-through before reopening.",anchor={map="MulStashMap10",mark=1}},
-- T0088
{id="t0088-01",kind="set",pieces={"Hammer","Nails"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Barricade by the quiet house",body="A hammer and nails are wrapped in a note asking the next crew not to enter until the treated perimeter is dry. A neighbor’s name is replaced by “wait.”",anchor={map="MulStashMap14",mark=1}},
-- T0089
{id="t0089-01",kind="set",pieces={"Bandage","Notebook"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Careful past the clinic",body="The bandage wrapper is tucked into a route book whose clinic stop is stamped complete before the patient’s return line is signed.",anchor={map="MulStashMap15",mark=1}},
-- T0090
{id="t0090-01",kind="set",pieces={"RadioBlack","Pistol"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Security and the missing shift",body="The bank security kit is paired with a radio card for a shift that never checked in. A note asks whether the cold room still has power.",anchor={map="MulStashMap16",mark=1}},
-- T0091
{id="t0091-01",kind="set",pieces={"Garbagebag","Bread"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The second delivery",body="The bakery bundle is tied to a household note asking the parents to stay inside until the next pickup. The driver marked the first delivery complete.",anchor={map="MulStashMap17",mark=1}},
-- T0092
{id="t0092-01",kind="set",pieces={"Pistol","PetrolCan"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="A trailer return",body="A fuel can is paired with a field-use note and a weapon listed as returned. The trailer’s key line remains open after the owner’s check-in ended.",anchor={map="MulStashMap18",mark=1}},
-- T0093
{id="t0093-01",kind="set",pieces={"WaterBottle","Notebook"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Everything for the trip",body="The water bottle is tied to a packed list whose return column is filled in before the departure box. One ration is marked for a person not on the list.",anchor={map="MulStashMap19",mark=1}},
-- T0094
{id="t0094-01",kind="set",pieces={"Map","KeyRing"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Here for the next shift",body="The route map is folded around a key marked for the next shift; a note says the crew will return after checking the water line.",anchor={map="RiversideStashMap1",mark=1}},
-- T0095
{id="t0095-01",kind="set",pieces={"LetterHandwritten","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Waiting at the old meeting point",body="A private note is tied to a key and asks the recipient not to leave before the next transport arrives. The pickup time has been crossed out.",anchor={map="RiversideStashMap2",mark=1}},
-- T0096
{id="t0096-01",kind="set",pieces={"Wine","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The bottle left open",body="The bottle is beside a delivery note that asks the next shift to keep the back room ventilated after the test. The food order is still unpaid.",anchor={map="RiversideStashMap3",mark=1}},
-- T0097
{id="t0097-01",kind="set",pieces={"Pills","Bandage"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="No one signed the transfer",body="The medicine packet is attached to a transfer card; the patient’s departure is recorded, but the person assigned to collect them is blank.",anchor={map="RiversideStashMap4",mark=1}},
-- T0098
{id="t0098-01",kind="set",pieces={"BaseballBat","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Do not return to the street",body="The warning is folded around a repair tag for a broken gate. The tag says the damage happened before the crew was cleared to leave.",anchor={map="RiversideStashMap5",mark=1}},
-- T0099
{id="t0099-01",kind="set",pieces={"Pistol","Notebook"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A private security cache",body="The weapon is tied to a sick-room list; the last entry says the room was handed over, but no one signs for the key.",anchor={map="RiversideStashMap6",mark=1}},
-- T0100
{id="t0100-01",kind="set",pieces={"CannedCorn","LetterHandwritten"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Food stop on the way out",body="The grocery note says every item was collected before the westbound trip; a food tin remains beside the argument about who should be left in charge.",anchor={map="RiversideStashMap7",mark=1}},
-- T0101
{id="t0101-01",kind="set",pieces={"Bread","WaterBottle"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Eat before leaving",body="A meal bundle is tied to a note asking the next person to eat before departure; the sighting entry on the reverse is dated after the route was closed.",anchor={map="RiversideStashMap8",mark=1}},
-- T0102
{id="t0102-01",kind="set",pieces={"PetrolCan","Pills"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Fuel and a medicine request",body="The fuel can is tagged for a medical pickup; the note says the driver stopped at the marked house after a field worker became ill.",anchor={map="RiversideStashMap9",mark=1}},
-- T0103
{id="t0103-01",kind="set",pieces={"KeyRing","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The westbound schedule",body="A bank key and market receipt are clipped to a westbound travel slip; the departure is signed, but the receiving station is blank.",anchor={map="RiversideStashMap10",mark=1}},
-- T0104
{id="t0104-01",kind="set",pieces={"Notebook","Pencil"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The missing instruction",body="The garden notebook has a removed instruction page and a note asking whether the unopened sample should go with the next supply run.",anchor={map="RosewoodStashMap1",mark=1}},
-- T0105
{id="t0105-01",kind="set",pieces={"Pistol","Map"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The line ends here",body="The route map is folded around a weapon handover slip; the last stop is marked complete, but the return route has no driver.",anchor={map="RosewoodStashMap2",mark=1}},
-- T0106
{id="t0106-01",kind="set",pieces={"Hammer","Nails"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Fortify while we wait",body="The repair kit is left with a note to keep the school-side window closed until the ground dries. The family meeting time is written in the same hand.",anchor={map="RosewoodStashMap3",mark=1}},
-- T0107
{id="t0107-01",kind="set",pieces={"Bag_ALICEpack","WaterBottle"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Take what fits",body="The packed bag is tied to a departure card that says to take what fits; the final line sends the group away before the promised pickup.",anchor={map="RosewoodStashMap4",mark=1}},
-- T0109
{id="t0109-01",kind="set",pieces={"Bread","WaterBottle"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Food for the last visit",body="The meal bag is marked for pickup only after the route opens. Someone has crossed out the driver’s name but left the note to wait for the household.",anchor={map="RosewoodStashMap5",mark=1}},
-- T0110
{id="t0110-01",kind="set",pieces={"KeyRing","Map"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Slow road instruction",body="The route key is tied to a note asking the driver to slow down near the test plots. The arrival box is checked before the fuel stop.",anchor={map="WorldStashMap1",mark=1}},
-- T0111
{id="t0111-01",kind="set",pieces={"Hammer","Nails"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Safe after the barricade",body="A barricade kit is packed beside a key marked for return; the inventory lists the weapons as hidden before the road restriction was posted.",anchor={map="WorldStashMap2",mark=1}},
-- T0112
{id="t0112-01",kind="set",pieces={"PetrolCan","Pencil"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Fuel before the run",body="A fuel can is paired with a route slip for a field visit; the return line says “full” though the can is nearly empty.",anchor={map="WorldStashMap3",mark=1}},
-- T0113
{id="t0113-01",kind="set",pieces={"LetterHandwritten","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Help at the address",body="A key is wrapped in a request for help; the dispatch copy says the occupant was contacted before the caller’s time is recorded.",anchor={map="WorldStashMap4",mark=1}},
-- T0114
{id="t0114-01",kind="set",pieces={"Bag_ALICEpack","SeedBag"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Supplies kept out of sight",body="A pack of supplies is hidden with the field bag; a note asks the next visitor to keep the watchers from seeing the unopened test kit.",anchor={map="WorldStashMap5",mark=1}},
-- T0115
{id="t0115-01",kind="set",pieces={"SheetPaper2","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Too large to secure",body="The storage key is clipped to an inventory that lists the load as too large to secure; a second hand has marked the location cleared.",anchor={map="WorldStashMap6",mark=1}},
-- T0116
{id="t0116-01",kind="set",pieces={"Bandage","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Fill before the building empties",body="The water bottle is tagged for the infected area, but the field note says to fill it before the next crew enters. A bandage wrapper is folded around the cap.",anchor={map="WorldStashMap7",mark=1}},
-- T0117
{id="t0117-01",kind="set",pieces={"Notebook","Pencil"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A destination without a name",body="The route page is complete except for its destination. The departure box is checked, and a margin asks the driver to wait for an updated order.",anchor={map="WorldStashMap8",mark=1}},
-- T0118
{id="t0118-01",kind="set",pieces={"Notebook","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Crates without contents",body="A crate tally includes the offices but lists no contents; the next page labels the same shipment for a field check.",anchor={map="WorldStashMap9",mark=1}},
-- T0119
{id="t0119-01",kind="set",pieces={"KeyRing","Bag_ALICEpack"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Four stops on one receipt",body="A receipt groups fuel, clothing, food, and a vehicle under one pickup. The receiving signature is missing, though every stop is checked.",anchor={map="WorldStashMap10",mark=1}},
-- T0120
{id="t0120-01",kind="set",pieces={"RadioReceiver","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="A signal sent for testing",body="The radio test sheet says the signal dropped at the tower; the technician’s note asks the field crew to check power before changing equipment.",anchor={map="WorldStashMap11",mark=1}},
-- T0121
{id="t0121-01",kind="set",pieces={"Pills","WaterBottle"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Camp supplies minus one person",body="The camp list counts water and medicine but leaves one person’s pickup line blank. A note asks whether the missing dose is still at the main office.",anchor={map="WorldStashMap12",mark=1}},
-- T0122
{id="t0122-01",kind="set",pieces={"LetterHandwritten","SeedBag"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="You have to leave",body="A seed bag is wrapped in a letter asking someone to leave before the field crew returns. The writer says the route is safer if no one waits at the door.",anchor={map="WorldStashMap13",mark=1}},
-- T0123
{id="t0123-01",kind="set",pieces={"Photo","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Names on the family key",body="A family photograph is clipped to a key transfer card; the pickup line is marked completed, but the recipient box is blank.",anchor={map="WorldStashMap14",mark=1}},
-- T0124
{id="t0124-01",kind="set",pieces={"Notebook","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The garden page",body="A water bottle rests on a garden record whose test result is missing. The last instruction says not to water until the next visit.",anchor={map="WorldStashMap15",mark=1}},
-- T0125
{id="t0125-01",kind="set",pieces={"KeyRing","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Barrier access list",body="The checkpoint key is tied to a list that marks the barrier staffed after the relief shift had already signed out.",anchor={map="WorldStashMap16",mark=1}},
-- T0126
{id="t0126-01",kind="set",pieces={"Camera","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Photographs from the blind spot",body="A camera is packed with a field notebook that says to photograph the blind side of the fence; the sensor check is marked complete before the crew arrives.",anchor={map="WorldStashMap17",mark=1}},
-- T0127
{id="t0127-01",kind="set",pieces={"Map","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Return route withheld",body="The map is folded around a return key, but the departure sheet omits the way back. A pencilled note asks the next driver to call before opening the gate.",anchor={map="WorldStashMap18",mark=1}},
-- T0128
{id="t0128-01",kind="set",pieces={"Pistol","SeedBag"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Weapons beside the supply sack",body="A seed bag and weapon are listed on the same storage slip; the note asks the visitor to take only what can be carried after the work is done.",anchor={map="WorldStashMap19",mark=1}},
-- T0129
{id="t0129-01",kind="set",pieces={"SheetPaper2","Pencil"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Names replaced by insults",body="The access complaint has no names or dates, only a list of doors refused and a final mark that says the crew left.",anchor={map="WorldStashMap20",mark=1}},
-- T0130
{id="t0130-01",kind="set",pieces={"SeedBag","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Plot with no note",body="The seed bag is kept beside a water bottle; the notebook page where the plot directions should be has been removed.",anchor={map="WorldStashMap21",mark=1}},
-- T0131
{id="t0131-01",kind="set",pieces={"Hammer","Nails"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Base camp repairs",body="A repair kit is set beside a base plan; the entry marked secure is dated before the door brace was installed.",anchor={map="WorldStashMap22",mark=1}},
-- T0132
{id="t0132-01",kind="set",pieces={"PetrolCan","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Basement supply record",body="The fuel can is tagged for basement storage and the notebook records a test visit on the same date. The return box for the container is empty.",anchor={map="WorldStashMap23",mark=1}},
-- T0133
{id="t0133-01",kind="set",pieces={"Pistol","Map"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Do not fire at the house",body="The route map points to a residence, but the weapon handover form says the occupant was already marked missing. The return route has no driver.",anchor={map="WpStashMap1",mark=1}},
-- T0134
{id="t0134-01",kind="set",pieces={"Bandage","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The patient without a weapon",body="A medical note records the patient found without a weapon; the adjoining field entry says the treatment room was reserved for a sample review.",anchor={map="WpStashMap2",mark=1}},
-- T0135
{id="t0135-01",kind="set",pieces={"LetterHandwritten","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A key left for help",body="A house key is enclosed with a request for help; the reply box is marked delivered, though the envelope was never sealed.",anchor={map="WpStashMap3",mark=1}},
-- T0136
{id="t0136-01",kind="set",pieces={"SeedBag","LetterHandwritten"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="A note between two warnings",body="A seed packet is wrapped in a loving note that asks the recipient to avoid the workroom until the next test is over. The return time is blank.",anchor={map="WpStashMap4",mark=1}},
-- T0137
{id="t0137-01",kind="set",pieces={"Shotgun","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Untouched hardware list",body="The hardware list is complete, but the security transfer was signed before the building was inspected. The person who kept the key is not listed.",anchor={map="WpStashMap11",mark=1}},
-- T0138
{id="t0138-01",kind="set",pieces={"Screwdriver","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Tools for a difficult visit",body="The tool list is paired with a personal note; a line asks the next crew to wipe the handles after work and leave the back door open.",anchor={map="WpStashMap5",mark=1}},
-- T0139
{id="t0139-01",kind="set",pieces={"WaterBottle","Bag_ALICEpack"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Packed but no longer needed",body="The travel pack is still tied shut beside a note that says the supplies are no longer needed. The departure time was entered but never initialled.",anchor={map="WpStashMap6",mark=1}},
-- T0140
{id="t0140-01",kind="set",pieces={"Notebook","Pencil"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="A missing field direction",body="The field notebook is open to a blank location line; the equipment has been checked out, but no one signed for its return.",anchor={map="WpStashMap7",mark=1}},
-- T0141
{id="t0141-01",kind="set",pieces={"Bandage","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The helper was not on the list",body="The clinic key is attached to a note saying one patient did not become ill; the return sheet lists the helper as absent.",anchor={map="WpStashMap8",mark=1}},
-- T0142
{id="t0142-01",kind="set",pieces={"WaterBottle","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="A parent’s water ration",body="A water bottle is marked for the household and paired with a field note that says the ground was too hot to cross after the crew left.",anchor={map="WpStashMap9",mark=1}},
-- T0143
{id="t0143-01",kind="set",pieces={"KeyRing","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The second access complaint",body="A key ring is clipped to a list of trouble calls; each line is closed, but none has a caller’s name or a time to return.",anchor={map="WpStashMap10",mark=1}},
-- T0144
{id="t0144-01",kind="set",pieces={"Bandage","KeyRing"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The room behind the barricade",body="A key to the office is tied to a fever list; the room is marked sealed, and the supply line says the crew took the food to the gun counter.",anchor={map="WpStashMap12",mark=1}},
-- T0145
{id="t0145-01",kind="set",pieces={"BaseballBat","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Three tallies, no names",body="A tally sheet groups losses by weapon and vehicle, but the line for who was brought back is empty. One tally has been copied twice.",anchor={map="WpStashMap13",mark=1}},
-- T0146
{id="t0146-01",kind="set",pieces={"Bread","Map"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Enough food for the crossing",body="A meal list says the group has enough food to wait for a boat; its water line is labelled for the field crew and left unopened.",anchor={map="WpStashMap14",mark=1}},
-- T0147
{id="t0147-01",kind="set",pieces={"Bag_ALICEpack","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A shelter kept secret",body="The shelter key is packed with a note promising it will stay hidden; the entry sheet says the gate was opened for a scheduled pickup that never arrived.",anchor={map="WpStashMap15",mark=1}},
-- T0148
{id="t0148-01",kind="set",pieces={"Map","Pencil"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Safest egress plan",body="The exit plan marks a fence and a southbound route; a note asks the crew to compare the likely attack path with the last field application.",anchor={map="WpStashMap16",mark=1}},
-- T0150
{id="t0150-01",kind="set",pieces={"Axe","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Tools on the unpaid shift",body="The mill tool sheet records a saw crew sent home before its truck was cleared; the last sharpening charge is still billed to the next shift.",anchor={print="McCoyLoggingCorp"}},
-- T0151
{id="t0151-01",kind="set",pieces={"KeyRing","Map"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The car with no return trip",body="The sales receipt marks a car delivered, while the test-drive log starts after its keys were returned. A note asks whether the fuel charge belongs to the buyer.",anchor={print="NolansUsedCars"}},
-- T0152
{id="t0152-01",kind="set",pieces={"WaterBottle","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The course notice",body="The grounds sheet closes one course entrance for a pickup, but the meal receipt at that entrance is dated after the vehicle left.",anchor={print="WestMapleCountryClub"}},
{id="t0152-02",kind="set",pieces={"Pencil","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The second tee sheet",body="A tee sheet has two copies: one marks the grounds open, the other says to keep carts away until the test strip is dry.",anchor={print="WestMapleCountryClub"}},
-- T0153
{id="t0153-01",kind="set",pieces={"Scissors","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A fitting appointment moved",body="The tailor’s fitting card is stamped complete before the customer’s pickup time; a note asks staff to leave the back door open for the return van.",anchor={print="FashionaBelle"}},
-- T0154
{id="t0154-01",kind="set",pieces={"EmptyJar","Pencil"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The kitchen rinse",body="A kitchen jar is set beside a note reserving the sink for a field crew’s rinse. The food order was charged even though the lunch was cancelled.",anchor={print="TacodelPancho"}},
-- T0155
{id="t0155-01",kind="set",pieces={"Wallet","Map"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A mall meeting point",body="The directory is folded into a lost-property wallet; its receipt says the meeting point was cleared before the last bus reached the entrance.",anchor={print="CrossRoadsMall"}},
-- T0156
{id="t0156-01",kind="set",pieces={"KeyRing","Bag_ALICEpack"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Storage unit opened early",body="The lock-up key is packed with a field bag; the rental card says the unit was opened before the listed test equipment was delivered.",anchor={print="UStoreItRiverside"}},
-- T0157
{id="t0157-01",kind="set",pieces={"Notebook","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The missing locker handoff",body="A locker key is attached to a rental ledger that marks the unit cleared; the renter’s return signature is absent.",anchor={print="UStoreItLouisville"}},
-- T0158
{id="t0158-01",kind="set",pieces={"SeedBag","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The dry storage request",body="A seed bag is listed for a rented unit beside a note to keep the water container sealed until the field reading comes back.",anchor={print="UStoreItMuldraugh"}},
-- T0159
{id="t0159-01",kind="set",pieces={"PetrolCan","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The fuel receipt",body="The fuel receipt shows the pump opened for a fleet pickup, but the key ring is logged back before the driver signed out.",anchor={print="Fossoil1"}},
-- T0160
{id="t0160-01",kind="set",pieces={"PetrolCan","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The low-cost fuel test",body="A fuel sheet records a sample taken before the pump was opened to customers; the cashier’s shift begins after the sample is marked cleared.",anchor={print="Fossoil2"}},
-- T0161
{id="t0161-01",kind="set",pieces={"Map","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The station diversion",body="A route map sends the delivery past the station, but the receipt records it as closed before the driver reached the turn.",anchor={print="Fossoil3"}},
-- T0162
{id="t0162-01",kind="set",pieces={"PetrolCan","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The second fuel sample",body="A sample bottle is paired with a fuel ledger; the entry says the test was routine, then asks the next shift not to use the same hose.",anchor={print="Fossoil4"}},
-- T0163
{id="t0163-01",kind="set",pieces={"KeyRing","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The station count",body="The pump key is clipped to an opening sheet that counts the pumps but not the vehicles still waiting outside.",anchor={print="Fossoil5"}},
-- T0164
{id="t0164-01",kind="set",pieces={"PetrolCan","Pencil"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Fuel for the field run",body="The fuel can carries a tag for a field run; the receipt says the driver paid for a full tank, though the return check found it nearly empty.",anchor={print="Fossoil6"}},
-- T0165
{id="t0165-01",kind="set",pieces={"Map","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The route closed after fueling",body="The route copy marks the vehicle fueled before the road closure, but the dispatch note says the driver was still waiting at the pump.",anchor={print="Fossoil7"}},
-- T0166
{id="t0166-01",kind="set",pieces={"PetrolCan","KeyRing"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The pump key was returned",body="The pump key is signed back before the last fuel delivery, and a note asks the crew to keep the drum sealed until the next test.",anchor={print="Fossoil8"}},
-- T0167
{id="t0167-01",kind="set",pieces={"Map","WaterBottle"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The boat’s last location",body="The dock map is marked for arrival, but the passenger list is signed complete before the boat’s final location was entered.",anchor={print="Delilah"}},
-- T0168
{id="t0168-01",kind="set",pieces={"FishingRod","HandTorch"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Cabin water note",body="A fishing rod and water bottle sit beside a cabin rental card; the host asks guests not to drink from the stream until the next test.",anchor={print="BensCabin"}},
-- T0169
{id="t0169-01",kind="set",pieces={"Map","Wallet"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The directory after closing",body="A mall directory is folded into a receipt for the last open shop; the security sheet says every entrance was clear before the shop’s closing time.",anchor={print="GrandOhioMall"}},
-- T0171
{id="t0171-01",kind="set",pieces={"Photo","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The gallery key returned",body="A gallery key is tied to a collection checklist marked secure before the guard’s handover was signed. One frame is listed without a room.",anchor={print="ArtGalleryofLouisville"}},
-- T0172
{id="t0172-01",kind="set",pieces={"BaseballBat","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="A stadium rinse",body="A sports bottle is set beside a grounds sheet asking the crew to rinse the field after the test. The gate schedule still lists a public event.",anchor={print="FossoilField"}},
-- T0173
{id="t0173-01",kind="set",pieces={"KeyRing","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The room discount",body="The motel room card grants a discount, but the checkout slip says the room was cleared before the guest’s key was returned.",anchor={print="SunstarMotel"}},
-- T0174
{id="t0174-01",kind="set",pieces={"WaterBottle","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The suite water order",body="A water bottle is placed with a suite service list that requests a test before the next guest arrives. The room charge is already closed.",anchor={print="HavishamSuites"}},
-- T0175
{id="t0175-01",kind="set",pieces={"BaseballBat","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The factory count",body="A bat is paired with a production sheet; the final count lists units made but not those sent to the distribution truck.",anchor={print="LouisvilleBruiser"}},
-- T0176
{id="t0176-01",kind="set",pieces={"FishFillet","KitchenKnife"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The kitchen’s tasting note",body="A fish order is kept beside a tasting sheet that says the water sample was taken after the kitchen was cleaned. The cook marked the meal served.",anchor={print="TheSeaShanty"}},
-- T0177
{id="t0177-01",kind="set",pieces={"Wine","EmptyJar"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The bottle count",body="A bottle tally is checked off before the delivery crate arrives; one jar is marked for a worker who never signed the shift sheet.",anchor={print="ScarletOakDistillery"}},
-- T0178
{id="t0178-01",kind="set",pieces={"Bag_ALICEpack","Map"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Prepared for a different threat",body="A preparedness pack is tied to a route sheet for a field test; the checklist says the protective gear is optional until the next briefing.",anchor={print="ReadyPrep"}},
-- T0179
{id="t0179-01",kind="set",pieces={"WaterBottle","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The clubhouse pickup",body="The clubhouse key is signed out for a pickup, while a grounds note says the water cart was already sent away. The passenger line is blank.",anchor={print="WellingtonHeightsGolfClub"}},
{id="t0179-02",kind="set",pieces={"Notebook","Pencil"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The second fairway note",body="A grounds notebook marks a test strip along the course edge; a handwritten note asks players to keep their shoes out of the drainage ditch.",anchor={print="WellingtonHeightsGolfClub"}},
-- T0180
{id="t0180-01",kind="set",pieces={"Book","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The classroom key",body="The classroom key is attached to an attendance page that marks a lecture complete before the instructor’s arrival time.",anchor={print="LSU"}},
-- T0181
{id="t0181-01",kind="set",pieces={"Screwdriver","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The operator’s shift",body="The job sheet asks an operator to report before the factory test; the work gloves are counted as returned before the shift starts.",anchor={print="LectromaxManufacturingJobAd"}},
-- T0182
{id="t0182-01",kind="set",pieces={"LetterHandwritten","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Benefits on the second page",body="The hiring sheet lists benefits, then a second page asks staff to remain available for transport after closing. No driver is named.",anchor={print="SpiffosHiringDixie"}},
-- T0183
{id="t0183-01",kind="set",pieces={"Notebook","Pencil"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Training before opening",body="The training roster lists the food counter and a separate field-use briefing; the same employee is marked present for both at once.",anchor={print="SpiffosHiringLouisville"}},
-- T0184
{id="t0184-01",kind="set",pieces={"KeyRing","Bag_ALICEpack"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The shift pack",body="A shift pack is tied to the store key and a route card; the cashier’s sign-out is stamped before the delivery van’s return.",anchor={print="SpiffosHiringWestPoint"}},
-- T0185
{id="t0185-01",kind="set",pieces={"Pizza","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The traveling menu",body="A menu is folded around a route receipt showing the mobile kitchen stopped at the same field gate twice; the second meal was not paid for.",anchor={print="PizzaWhirledJobAdRosewood"}},
-- T0186
{id="t0186-01",kind="set",pieces={"Pencil","Notebook"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The manager vacancy",body="The job card asks for a manager beside the mall outlet; the shift sheet lists the post as filled before the interview was scheduled.",anchor={print="PileoCrepeJobAdCrossRoadsMall"}},
-- T0187
{id="t0187-01",kind="set",pieces={"VHS_Retail","Pencil"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The returned tape",body="A video store hiring card is clipped to a tape return slip; the return date is written before the opening shift began.",anchor={print="HitVidsJobAdMarchRidge"}},
-- T0188
{id="t0188-01",kind="set",pieces={"Mop","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The school cleaning shift",body="The janitor’s key is tied to a cleaning checklist marked complete before the rooms were unlocked. One classroom remains on the supply list.",anchor={print="MarchRidgeSchoolJobAd"}},
-- T0189
{id="t0189-01",kind="set",pieces={"Notebook","KeyRing"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The teller position",body="A bank hiring form is attached to a field-use roster; the teller’s start date is written before the training room was cleared.",anchor={print="KnoxBankJobAdRosewood"}},
-- T0191
{id="t0191-01",kind="set",pieces={"Tomato","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Market produce log",body="The market basket is tied to a produce sheet that marks the field lot sampled before the stall opened. The seller’s hand-drawn price sign is still inside.",anchor={print="FarmersMarket"}},
-- T0192
{id="t0192-01",kind="set",pieces={"Bread","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Bake sale pickup",body="The bake-sale list marks every box collected before the parking lot was cleared; one family’s unpaid loaf remains beside the pickup table.",anchor={print="MuldraughBakeSale"}},
-- T0193
{id="t0193-01",kind="set",pieces={"Pistol","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Meeting range sheet",body="The range sheet records a safety check and a field briefing in the same time slot; one attendee signed both lines from the same station.",anchor={print="KnoxGunOwnersClubGetTogether"}},
-- T0194
{id="t0194-01",kind="set",pieces={"KeyRing","Map"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Inspection before sale",body="The listing key is checked out for inspection, but the house is recorded clear before the inspector’s arrival. The price card stays on the door.",anchor={print="HouseforSale895"}},
-- T0195
{id="t0195-01",kind="set",pieces={"WaterBottle","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Potential rooms",body="The floor plan marks two potential rooms; a field note asks whether the upstairs water sample was taken before the new tenant arrived.",anchor={print="HouseforSale903"}},
-- T0196
{id="t0196-01",kind="set",pieces={"KeyRing","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The low-price key",body="The listing key is returned to the office before the viewing ends. The property sheet says the house was empty, but a visitor left a meal receipt inside.",anchor={print="HouseforSale922"}},
-- T0197
{id="t0197-01",kind="set",pieces={"Notebook","Pencil"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Rust on the home survey",body="The property survey notes a rusted fixture and a test appointment; the inspection line is signed before the water sample was collected.",anchor={print="HouseforSale934"}},
-- T0198
{id="t0198-01",kind="set",pieces={"VHS_Retail","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The drive-in count",body="The ticket count is closed before the last car’s entry time. A key tag for the projection booth is left with the vehicle list.",anchor={print="OnyxDriveinTheater"}},
-- T0199
{id="t0199-01",kind="set",pieces={"KeyRing","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Furnished room, pending test",body="The apartment key is packed with a water bottle and a move-in card; the card says the furnished room is ready, while the test line remains blank.",anchor={print="RedOakApartments"}},
-- T0200
{id="t0200-01",kind="set",pieces={"KeyRing","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="River-view handover",body="The apartment ledger records a tenant moved in before the river-facing rooms were released. The spare key is still logged with the prior renter.",anchor={print="DuCaseApartments"}},
-- T0201
{id="t0201-01",kind="set",pieces={"Notebook","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The luxury water check",body="The apartment service note asks for a water test before the next guest; the rent card is already stamped paid for the month.",anchor={print="HighStreetApartments"}},
-- T0202
{id="t0202-01",kind="set",pieces={"KeyRing","Map"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Cozy unit, no exit note",body="The apartment plan marks the unit occupied, while the key log says the building was empty at the same time. A tenant’s route note ends at the stairwell.",anchor={print="LowryCourt"}},
-- T0203
{id="t0203-01",kind="set",pieces={"CarBattery1","KeyRing"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Luxury vehicle setup",body="The mobility service card lists a vehicle test before delivery; the battery check is marked complete before the technician signed in.",anchor={print="UpscaleMobility"}},
-- T0204
{id="t0204-01",kind="set",pieces={"Shoes_Black","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The rink’s last session",body="The session tally is closed before the last skater returned the rental pair. A note asks staff to keep the rear exit open for the next group.",anchor={print="RoxysRollerRink"}},
-- T0205
{id="t0205-01",kind="set",pieces={"WaterBottle","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The bout schedule",body="The event schedule is marked completed before the gate receipt was issued; the supply list reserves water for a crew at the loading door.",anchor={print="ElveeArena"}},
-- T0206
{id="t0206-01",kind="set",pieces={"SheetPaper2","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Block party route",body="The party route sheet lists every block as cleared, but a resident’s key is still held at the check-in table.",anchor={print="RiversideIndependenceDayPartyAllWelcome"}},
-- T0207
{id="t0207-01",kind="set",pieces={"WaterBottle","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The park supply table",body="The party supply list counts cups and water containers; a note says the grounds hose was used for a separate rinse before the guests arrived.",anchor={print="FourthofJulyCelebrationDixieMobilePark"}},
-- T0208
{id="t0208-01",kind="set",pieces={"Gloves_BoxingBlue","BathTowel"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Club closing routine",body="The gym closing list says every member left; a pair of gloves and towel remain beside a note to keep the side door unlocked until pickup.",anchor={print="SureFitnessBoxingClub"}},
-- T0209
{id="t0209-01",kind="set",pieces={"Book","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Quiet study reservation",body="The library room card reserves a table for a field briefing; the public sign says the room is closed for quiet study.",anchor={print="BrooksLibrary"}},
-- T0210
{id="t0210-01",kind="set",pieces={"Screwdriver","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Cabinet delivery before clearance",body="The cabinet key is attached to a delivery slip marked complete before the kitchen passed inspection. The installer’s meal receipt is still unpaid.",anchor={print="KnoxPackKitchens"}},
-- T0211
{id="t0211-01",kind="set",pieces={"SheetPaper2","KeyRing"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Service after the last wait",body="The service ledger records a final pickup; a note asks the next shift to keep the room ventilated after the cleaning crew leaves.",anchor={print="SunsetPinesFuneralHome"}},
-- T0212
{id="t0212-01",kind="set",pieces={"MugWhite","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The plaza cup return",body="The café’s cup count is complete, but the plaza key is listed as returned before the shop’s closing receipt.",anchor={print="CardinalPlaza"}},
-- T0213
{id="t0213-01",kind="set",pieces={"Mov_GardenGnome","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The garden ornament order",body="The garden ornament receipt is attached to a grounds note asking staff not to water the display until the test strip dries.",anchor={print="GnomeSweetGnome"}},
-- T0214
{id="t0214-01",kind="set",pieces={"KeyRing","Map"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Gated community access",body="The gate key is tied to a resident roster that marks the community empty before the final visitor signed out.",anchor={print="MeadshireEstate"}},
-- T0215
{id="t0215-01",kind="set",pieces={"Gloves_LeatherGloves","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The worker’s first shift",body="The job card asks the new worker to report for a field shift; the gloves are signed back before the person’s start date.",anchor={print="GreenesJobAdEkron"}},
-- T0216
{id="t0216-01",kind="set",pieces={"LetterHandwritten","Bag_ALICEpack"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The mail route change",body="The carrier’s route bag contains a change notice that marks the route complete before the last neighborhood was delivered.",anchor={print="MailCarrierAdEkron"}},
-- T0217
{id="t0217-01",kind="set",pieces={"KeyRing","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Lease before inspection",body="The lease key is issued before the building inspection; a test note says the rear water line is not ready for tenant use.",anchor={print="PremiseswithApartmentsforLeaselistingno891"}},
-- T0218
{id="t0218-01",kind="set",pieces={"KeyRing","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The cozy house inventory",body="The viewing card says the house is empty; a room checklist says a family meal was removed after the viewing began.",anchor={print="HouseforSale907"}},
-- T0219
{id="t0219-01",kind="set",pieces={"Bag_ALICEpack","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Shelter readiness list",body="The shelter pack is marked ready, but its water bottle carries a note to wait for a field reading before opening the supply.",anchor={print="YourLocalShelterBrandenburg"}},
-- T0220
{id="t0220-01",kind="set",pieces={"KeyRing","Map"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Compact home pickup",body="The key handover is marked complete before the moving truck arrived; the listing still says the small house is occupied.",anchor={print="HouseforSale912"}},
-- T0221
{id="t0221-01",kind="set",pieces={"Notebook","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Color survey sample",body="The property survey notes a color change near the water line; the sample date is later than the inspection signature.",anchor={print="HouseforSale943"}},
-- T0222
{id="t0222-01",kind="set",pieces={"KeyRing","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The charming address",body="The home inspection marks every room clear, but the key return sheet leaves one bedroom assigned to a visitor.",anchor={print="HouseforSale930"}},
-- T0223
{id="t0223-01",kind="set",pieces={"SeedBag","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="A small garden behind the listing",body="A seed packet is stored with the house plan; a note asks the inspector to leave the garden dry until the next field visit.",anchor={print="HouseforSale929"}},
-- T0224
{id="t0224-01",kind="set",pieces={"Map","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The large-home key log",body="The house map is tied to a key return that predates the caretaker’s final room check. One door is marked as still in use.",anchor={print="HouseforSale919"}},
-- T0225
{id="t0225-01",kind="set",pieces={"Notebook","Pencil"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Office space and test room",body="The office lease marks every suite available, but the building notebook reserves one floor for a field test through the tenant move-in date.",anchor={print="LeafhillHeights"}},
-- T0226
{id="t0226-01",kind="set",pieces={"SeedBag","Pistol"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Supply order for the rural stop",body="The supply receipt groups seeds, tools, and firearms in one pickup; the return sheet records the vehicle before the delivery was signed.",anchor={print="FarmingAndRuralSupplyDoeValley"}},
-- T0227
{id="t0227-01",kind="set",pieces={"Screwdriver","KeyRing"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Suspension repair and route",body="The repair key is signed out for an engine test; the customer’s road receipt says the vehicle was cleared before the test ended.",anchor={print="LennysCarRepair"}},
-- T0228
{id="t0228-01",kind="set",pieces={"Notebook","Pencil"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Appointment not on the calendar",body="The service appointment is stamped complete, but the customer’s copy says the car was still waiting when the shop closed.",anchor={print="CarFixation"}},
-- T0229
{id="t0229-01",kind="set",pieces={"Screwdriver","PetrolCan"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Oil and brake check",body="The service card lists an oil change and brake check; the field-use tag says the vehicle left before either item was signed off.",anchor={print="AlsAutoShop"}},
-- T0230
{id="t0230-01",kind="set",pieces={"Hammer","Nails"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The hardware order",body="The hardware receipt lists nails and tools for pickup, but the access sheet says the shop closed before the order was collected.",anchor={print="NailsAndNuts"}},
-- T0232
{id="t0232-01",kind="set",pieces={"Hammer","Nails"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Tools at the rural stop",body="The tool receipt lists a watering can with the saws and hammers; the field-use box is checked before the delivery truck is unloaded.",anchor={print="WPDIY"}},
-- T0233
{id="t0233-01",kind="set",pieces={"Screwdriver","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The extra item",body="The store tally closes before the last customer’s tool is returned. The line for items borrowed by the repair crew is blank.",anchor={print="EPToolsLV"}},
-- T0234
{id="t0234-01",kind="set",pieces={"Notebook","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Fire safety checklist",body="The safety sheet marks the detectors checked before the extinguisher was delivered; a note asks the next crew to keep the windows shut.",anchor={print="RosewoodFD"}},
-- T0235
{id="t0235-01",kind="set",pieces={"SheetPaper2","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Storage advice and a locked room",body="The prevention sheet asks residents to store combustible supplies safely; the inspection card says the supply room was already sealed.",anchor={print="BrandenburgFD"}},
-- T0236
{id="t0236-01",kind="set",pieces={"Gloves_LeatherGloves","Notebook"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The open-day roster",body="The firehouse roster marks every visitor checked out before the last demonstration ended. One pair of gloves is still listed for pickup.",anchor={print="LVFD"}},
-- T0237
{id="t0237-01",kind="set",pieces={"Notebook","Pencil"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The public meeting notes",body="The meeting sheet lists a community protection discussion and a separate field visit; the same speaker is recorded at both at once.",anchor={print="MuldraughPD"}},
-- T0238
{id="t0238-01",kind="set",pieces={"Pills","Notebook"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Seminar attendance",body="The seminar roster is complete, but the supply sheet says the demonstration kit was removed before the room was opened.",anchor={print="LVPDHQ"}},
-- T0239
{id="t0239-01",kind="set",pieces={"Pistol","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Safety briefing copy",body="The firearms briefing sheet says the safety check was complete before the range was inspected. A visitor’s card asks whether the samples were secured.",anchor={print="RiversidePD"}},
-- T0240
{id="t0240-01",kind="set",pieces={"Map","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The well-kept property",body="The house key is attached to a property map; the viewing sheet says the rooms were clear before the owner’s final walk-through.",anchor={print="HouseforSale845"}},
-- T0241
{id="t0241-01",kind="set",pieces={"SeedBag","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Self-sustaining garden notes",body="The garden seed packet is stored with a water bottle; the property note says the next owner should wait for a soil test before planting.",anchor={print="HouseforSale851"}},
-- T0242
{id="t0242-01",kind="set",pieces={"KeyRing","Map"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Compact home handoff",body="The compact house key is logged as returned before the moving list is complete. A folded map remains in the room beside the final box.",anchor={print="HouseforSale855"}},
-- T0243
{id="t0243-01",kind="set",pieces={"WaterBottle","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The central address sample",body="The inspection note asks for a water sample before the next tenant; the move-in receipt is already signed.",anchor={print="HouseforSale860"}},
-- T0244
{id="t0244-01",kind="set",pieces={"KeyRing","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Office lease before clearance",body="The office key is issued for the leased suite before the building check is signed. The rent card marks the space occupied that morning.",anchor={print="PremisesforLease863"}},
-- T0245
{id="t0245-01",kind="set",pieces={"KeyRing","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The ideally placed home",body="The key packet includes a water bottle tag from the field crew; the property note asks the new owner not to use the garden tap yet.",anchor={print="HouseforSale867"}},
-- T0246
{id="t0246-01",kind="set",pieces={"FishingRod","HandTorch"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Cabin rules after dark",body="The cabin key is tied to a trail map and a note to leave no litter. The checkout sheet says the guests left before the caretaker reached the road.",anchor={print="CabinforRentDixie"}},
-- T0247
{id="t0247-01",kind="set",pieces={"SheetPaper2","KeyRing"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Town hall agenda",body="The town meeting agenda lists a field update after the public session; the room key is logged returned before residents signed out.",anchor={print="WPTownHall"}},
-- T0248
{id="t0248-01",kind="set",pieces={"Bread","Map"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The seasonal trail stop",body="The diner’s seasonal menu is clipped to a trail map; the supply receipt marks the kitchen closed before the last walking group returned.",anchor={print="DinerInTheWoods"}},
-- T0249
{id="t0249-01",kind="set",pieces={"Book","LetterHandwritten"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="A gathering after dark",body="The prayer gathering notice is folded around a letter asking the caretaker to keep the well covered until the next test.",anchor={print="FallasLakeChurch"}},
-- T0250
{id="t0250-01",kind="set",pieces={"Book","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A preservation request",body="The preservation notice is attached to a demolition schedule; the building survey is signed complete before the listed heritage review.",anchor={print="OldCGECorpBuilding"}},
-- T0251
{id="t0251-01",kind="set",pieces={"RadioBlack","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Friday’s extra set",body="The band schedule lists an extra set after closing; a venue note asks staff to air out the room after the field crew leaves.",anchor={print="RustyRifle"}},
-- T0252
{id="t0252-01",kind="set",pieces={"SeedBag","WaterBottle"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Feed delivery record",body="The feed receipt lists a delivery before the animals were counted; a note asks the driver to leave the water trough sealed until the next shift.",anchor={print="A1Hay"}},
-- T0253
{id="t0253-01",kind="set",pieces={"Map","KeyRing"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Airport route update",body="The airport map marks a flight route open, while the gate list says the passengers were transferred before boarding began.",anchor={print="Airport"}},
-- T0254
{id="t0254-01",kind="set",pieces={"Screwdriver","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Steel order not received",body="The steel delivery slip says the order was received, but the loading dock tally has no matching truck. The inspection line is marked complete.",anchor={print="AMZSteel"}},
-- T0255
{id="t0255-01",kind="set",pieces={"Bread","Bag_ALICEpack"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Jerky for the trip",body="The jerky bundle is packed with a field route note; the receipt says the delivery was paid before the crew’s departure time.",anchor={print="BeefChunk"}},
-- T0256
{id="t0256-01",kind="set",pieces={"Notebook","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Auction lot count",body="The cattle auction ledger lists every lot sold, but the gate key is returned before the buyers’ vehicles are counted.",anchor={print="BrottAuction"}},
-- T0257
{id="t0257-01",kind="set",pieces={"FishFillet","KitchenKnife"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Catch and sample slip",body="The fish order is paired with a pond sample slip dated after the kitchen served lunch. The cook’s note says the catch was fresh.",anchor={print="CatonaHotTinGrill"}},
-- T0258
{id="t0258-01",kind="set",pieces={"Map","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Town boundary map",body="The town map is folded around a gate key; the population sheet says the district was cleared before the last road check.",anchor={print="Coalfield"}},
-- T0259
{id="t0259-01",kind="set",pieces={"HandTorch","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The bunker tour log",body="The tour log lists the bunker ready for visitors; a field note asks guides to keep the ventilation hatch closed until the next reading.",anchor={print="ColdWarBunker"}},
-- T0260
{id="t0260-01",kind="set",pieces={"KeyRing","WaterBottle"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Guest rooms before inspection",body="The guest-house key rack is marked full before the room inspection is signed. One water bottle is tagged for a room without a guest name.",anchor={print="DarkwallowGuestHouse"}},
-- T0261
{id="t0261-01",kind="set",pieces={"Book","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Classroom resource list",body="The college resource list includes a field-study room, but its access key is returned before the class roster is collected.",anchor={print="EkronCollege"}},
-- T0262
{id="t0262-01",kind="set",pieces={"EmptyJar","Pencil"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The firehouse recipe",body="The chili recipe is stored with a firehouse inventory; the cook’s jar count is complete, but the meal list leaves one shift unserved.",anchor={print="FiveAlarmChili"}},
-- T0263
{id="t0263-01",kind="set",pieces={"Bandage","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Elder-care delivery",body="The care log lists a routine delivery, while the field sample box is marked outside the room before the resident’s check-in.",anchor={print="GoldenSunset"}},
-- T0264
{id="t0264-01",kind="set",pieces={"Pistol","Pistol2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The missing ammunition count",body="The sales ledger lists a firearm transfer complete, but the return count for ammunition is blank. The range receipt is dated the next day.",anchor={print="GunsUnlimitedEchoCreek"}},
-- T0265
{id="t0265-01",kind="set",pieces={"Hammer","Nails"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Hardware for the next repair",body="The hardware receipt lists nails and repair tools; a field note says to hold the shipment until the soil test is finished.",anchor={print="HobbsandPerkinsHardware"}},
-- T0266
{id="t0266-01",kind="set",pieces={"KeyRing","Map"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A property near the route",body="The house key is tied to a route map, and the sale card says the rooms were clear before the road inspection was finished.",anchor={print="HouseforSale787"}},
-- T0267
{id="t0267-01",kind="set",pieces={"WaterBottle","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Central listing sample",body="The listing packet includes a water-test appointment after the move-in date. A note asks the owner to leave the kitchen tap unused until then.",anchor={print="HouseforSale799"}},
-- T0268
{id="t0268-01",kind="set",pieces={"KeyRing","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Quiet home inspection",body="The sale form marks the property quiet and empty, but the key log records a room opened after the inspector left.",anchor={print="HouseforSale818"}},
-- T0269
{id="t0269-01",kind="set",pieces={"Pistol","Notebook"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Range inspection record",body="The range log records a target inspection and a field briefing on the same page; the safety officer’s sign-off is missing.",anchor={print="IrvingtonGunClub"}},
-- T0270
{id="t0270-01",kind="set",pieces={"Scissors","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The dress appointment",body="The fitting card is marked complete before the bride’s pickup time; the shop key remains checked out to an unnamed assistant.",anchor={print="LoveDuet"}},
-- T0271
{id="t0271-01",kind="set",pieces={"Screwdriver","KeyRing"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The appliance inventory",body="The furniture delivery sheet marks the appliances tested, but the installer’s key is returned before the power check is signed.",anchor={print="MadDansDen"}},
-- T0273
{id="t0273-01",kind="set",pieces={"VHS_Retail","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Festival schedule copy",body="The festival schedule is marked complete before the gates opened; a note leaves one band’s arrival time blank and asks the crew to keep the side road clear.",anchor={print="MusicFest93"}},
-- T0274
{id="t0274-01",kind="set",pieces={"Notebook","WaterBottle"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Egg route sample",body="The farm delivery card lists a water sample with the egg shipment; the sample is dated after the cartons were collected.",anchor={print="OvoFarms"}},
-- T0275
{id="t0275-01",kind="set",pieces={"SeedBag","Pizza"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A shopping-center pickup",body="The garden supply receipt is paired with a meal order; the center’s pickup log says the doors were cleared before the last customer collected either.",anchor={print="Pondview"}},
-- T0276
{id="t0276-01",kind="set",pieces={"Book","KeyRing"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The Saturday tour key",body="The manor tour key is signed out beside a field note asking the guide to keep visitors away from the north lawn until the test is over.",anchor={print="QuillManor"}},
-- T0277
{id="t0277-01",kind="set",pieces={"SheetPaper2","KeyRing"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="The watch discount card",body="The discount card is stamped paid before the watch stock was counted; the closing sheet says every customer left before the store was checked.",anchor={print="Sammies"}},
-- T0278
{id="t0278-01",kind="set",pieces={"HandTorch","Map"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="The weekly ghost route",body="The tour map marks the basement route open; the guide’s note asks visitors to stay away from the ventilation room until the next reading.",anchor={print="Sanatorium"}},
-- T0279
{id="t0279-01",kind="set",pieces={"KeyRing","WaterBottle"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="Airport room turnover",body="The room key is marked returned before the airport pickup arrived; a water bottle is tagged for a guest whose name is missing from the ledger.",anchor={print="SleepEazzzeInn"}},
-- T0280
{id="t0280-01",kind="set",pieces={"Screwdriver","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Scrapyard repair event",body="The repair event receipt lists a vehicle prize, but the inspection sheet marks its fuel test complete before the scrapyard opened.",anchor={print="StuartandLogScrapyard"}},
-- T0281
{id="t0281-01",kind="set",pieces={"Book","Map"},where={{place="mapNamed",spot="ground",lean="containment",rival="agricultural"}},title="A shop tour in two languages",body="The store map is folded into a book with a handwritten translation; the entry log says the room was empty before the last visitor signed out.",anchor={print="TheWizardsKeep"}},
-- T0282
{id="t0282-01",kind="set",pieces={"WaterBottle","SheetPaper2"},where={{place="mapNamed",spot="ground",lean="agricultural",rival="containment"}},title="Friday’s entertainment",body="The bar’s entertainment list is clipped to a water check for the back room; the beverage delivery was marked complete before the door was opened.",anchor={print="Twiggys"}},
-- T0321
{id="t0321-01",kind="set",pieces={"Saw","Plank"},where={{place="mapNamed",spot="furniture",lean="containment",rival="agricultural"}},title="A repair set aside",body="The tools match a small repair, but the spare was prepared before anyone recorded a fault.",anchor={scene="RBTrashed"}},
}}
