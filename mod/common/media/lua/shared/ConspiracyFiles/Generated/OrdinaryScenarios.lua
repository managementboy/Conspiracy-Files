-- Event-complete ordinary scenarios. Data only; the shared story builder owns
-- placeholder binding, discovery gating, carrier validation and placement.
local M={}
local InventoryScenarios=require("ConspiracyFiles/Generated/InventoryScenarios")
local AdministrativeScenarios=require("ConspiracyFiles/Generated/AdministrativeScenarios")
local CorrespondenceScenarios=require("ConspiracyFiles/Generated/CorrespondenceScenarios")

local scenarios={
 ["transfer-nobody-arranged"]={{
   ["question"]="Why was a mechanic transferred to a mill without leaving the roadside?",
   ["centralAxis"]="records",
   ["event"]="McCoy moved the cost of a roadside truck repair onto the mill budget by entering the mechanic as transferred.",
   ["outcome"]="The mechanic repaired the truck at the roadside. The transfer moved the bill, and the yard reported no repair expense.",
   ["readings"]={"The truck got repaired because somebody found a budget that would pay.","The yard bought a clean expense report by sending its breakdown to another department on paper."},
   ["organisation"]="McCoy Logging Co.",
   ["grounding"]="McCoyLoggingCorp",
   ["essential"]={"claim","response","review"},
   ["anchors"]={
    ["claim"]={
     ["kind"]="dispatch",
     ["title"]="Transfer notice / {CODE}",
     ["observation"]="A transfer slip with a mill crew stamp over a handwritten truck number.",
     ["source"]="McCOY LOGGING CO.\n{DATE1} / {CODE}\nEffective today: {P1} transferred from haulage to mill maintenance until repair completed.\nReport destination: MILL.\nRetained copy and time enquiries: {B}.\nTransport allowance: none. Employee already at assigned location.",
     ["note"]="I have a transfer to the mill with no travel allowance because the mechanic is supposedly there already. The truck number has been stamped over. I would check the time record at {B} before trusting either destination."
    },
    ["response"]={
     ["kind"]="Wrench",
     ["title"]="Roadside wrench, marked {P1}",
     ["observation"]="A wrench in the verge grass by the haul truck, shaft stamped {P1}.",
     ["source"]="The broken fan belt lies beside it; the tracks leave the verge once.",
     ["note"]="The repair happened here. A transfer says it was at the mill.",
     ["wear"]="fair"
    },
    ["review"]={
     ["kind"]="receipt",
     ["title"]="Transfer closed / {CODE}",
     ["observation"]="An expense return with a large zero ringed beside YARD REPAIRS.",
     ["source"]="{DATE3}\n{CODE}: temporary mill assignment closed. {P1} returned to haulage roster.\nBelt and labour charged to mill maintenance; roadside job accepted.\nYARD REPAIRS: $0.\nPlease carry this improvement forward in the monthly report.",
     ["note"]="The bill was accepted, the mechanic returned on paper, and the yard got its zero. I can see what improved: the report."
    }
   },
   ["comparisons"]={{
     ["requires"]={"claim","response"},
     ["from"]="response",
     ["to"]="claim",
     ["kind"]="disputes-delivery",
     ["text"]="The transfer sends {P1} to the mill. A wrench and the snapped fan belt lie in the verge, and the truck's tracks leave it only once."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="corroborates",
     ["text"]="The closing entry puts the roadside repair on the mill account, exactly as accounts instructed."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="The truck was fixed where it broke down. The transfer moved the cost, not the mechanic; the yard then reported no repair expense."
    }},
   ["optional"]={{["key"]="bench-wrench",["role"]="records",["kind"]="Wrench",["wear"]="greasy, the jaws worn smooth",
    ["title"]="Wrench, marked {P1}",
    ["observation"]="A wrench filed in with the paperwork.",
    ["source"]="Tape on the handle carries a name in pen: {P1}.",
    ["note"]="It is in the drawer with the transfer notice. Nothing here says it is theirs."}}
  },{
   ["question"]="Why does a transferred storage clerk still work at the same counter?",
   ["centralAxis"]="records",
   ["event"]="U-Store It renamed its counter a temporary claims office and transferred its clerk there to count a storm response team without adding staff.",
   ["outcome"]="One clerk did both the normal counter work and storm claims. The extra team in the report was the same person under a second heading.",
   ["readings"]={"The clerk kept the place running and handled the claims as well.","Management counted an extra team by giving one exhausted clerk two headings."},
   ["organisation"]="U-Store It",
   ["grounding"]="UStoreItMuldraugh",
   ["essential"]={"claim","response","review"},
   ["anchors"]={
    ["claim"]={
     ["kind"]="dispatch",
     ["title"]="Emergency staff transfer / {CODE}",
     ["observation"]="A staffing notice with TEMPORARY typed hard enough to puncture one letter.",
     ["source"]="U-STORE IT\n{DATE1}\n{P1} transferred to storm-claims office until further notice.\nNormal lockup counter to remain fully staffed. No additional hours authorised.\nClaims-office correspondence and retained roster: {B}.\nEmergency response team established.",
     ["note"]="An extra claims office, a fully staffed counter, and no extra hours. I want to see the roster at {B}. Someone has either found another clerk or invented one."
    },
    ["response"]={
     ["kind"]="PenFancy",
     ["title"]="Counter pen, marked {P1}",
     ["observation"]="A counter pen on its chain at the storage desk, barrel engraved {P1}.",
     ["source"]="The chain is worn bright where one person has reached for it.",
     ["note"]="The clerk is still at this counter. A transfer says otherwise.",
     ["wear"]="fair"
    },
    ["review"]={
     ["kind"]="receipt",
     ["title"]="Response staffing return / {CODE}",
     ["observation"]="A weekly return with the same initials in two boxes.",
     ["source"]="{DATE3}\n{CODE}: counter staffing maintained, one clerk. Storm response team deployed, one clerk.\nBoth entries: {P1}. Combined paid hours: one shift.\nClaims sign returned to store. Temporary assignment closed.\nStaffing target achieved without recruitment.",
     ["note"]="They reported two staffed functions and paid for one shift. The sign has gone back into storage; the staffing achievement can stay."
    }
   },
   ["comparisons"]={{
     ["requires"]={"claim","response"},
     ["from"]="response",
     ["to"]="claim",
     ["kind"]="disputes-delivery",
     ["text"]="The notice has a fully staffed counter and a response team as well. The counter pen's chain is worn bright by one pair of hands."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="corroborates",
     ["text"]="The return counts the two headings separately while paying {P1}, whose pen wore that one chain, for a single shift."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="No extra clerk arrived. U-Store It made a response team by dividing one counter and one person into two reporting lines."
    }},
   ["optional"]={{["key"]="counter-leaflets",["role"]="records",["kind"]="Magazine",["wear"]="curled at the corners",["quantity"]=12,["roomIntent"]="natural",
    ["title"]="Twelve magazines",
    ["observation"]="Twelve of them, squared off in a carton under the counter.",
    ["source"]="Nothing written on any of them beyond the print.",
    ["note"]="A dozen kept at a counter that was being staffed by one person under two headings."}}
  }},
 ["signed-by-someone-absent"]={{
   ["question"]="How did an absent account holder sign for generator fuel?",
   ["centralAxis"]="absence",
   ["event"]="Fossoil would only accept the printed account holder name, so the account holder instructed a colleague to sign that name to release fuel.",
   ["outcome"]="The colleague signed the required name and received the fuel. A later stock check accounted for the delivery; the signature rule concealed the actual receiver.",
   ["readings"]={"The fuel reached the generator because the workers worked around the signature rule.","The signature check made the record less truthful than the people using it."},
   ["organisation"]="Fossoil",
   ["grounding"]="Fossoil1",
   ["essential"]={"claim","response","review"},
   ["anchors"]={
    ["claim"]={
     ["kind"]="dispatch",
     ["title"]="Fuel receipt / {CODE}",
     ["observation"]="A fuel docket with a heavy handwritten name in an otherwise clean signature box.",
     ["source"]="FOSSOIL\n{DATE1}\nEquipment account {CODE}: 180 gallons delivered.\nReceived by: {P2}.\nDriver checked signature against printed account name: MATCH.\nRetained copy and delivery enquiries: {B}.\nGoods must not be released to an unlisted name.",
     ["note"]="The driver checked that the name matched. I cannot tell from this whether anyone checked the person. There is a delivery file at {B}."
    },
    ["response"]={
     ["kind"]="Generator_Blue",
     ["title"]="Fuelled generator, marked {P1}",
     ["observation"]="A generator with its fuel book wired on, the last line initialled {P1}.",
     ["source"]="The tank is full and the account holder's chair is dusted over.",
     ["note"]="Somebody drew this fuel. The signature belongs to somebody absent.",
     ["wear"]="good"
    },
    ["review"]={
     ["kind"]="receipt",
     ["title"]="Fuel account reconciliation / {CODE}",
     ["observation"]="A tank ticket stapled to a signed correction.",
     ["source"]="{DATE3}\n{CODE}: 180-gallon receipt agrees with tank entry. Generator run logged after receipt.\nActual receiver: {P1}; account holder {P2} absent, instruction attached.\nFossoil account correction accepted. Original receipt retained: signature complies.",
     ["note"]="The correction names {P1} and accounts for the fuel. They kept the inaccurate signature because it complies. I would trust the correction before the box."
    }
   },
   ["comparisons"]={{
     ["requires"]={"claim","response"},
     ["from"]="response",
     ["to"]="claim",
     ["kind"]="disputes-delivery",
     ["text"]="The docket records {P2} receiving the fuel and the driver checking it. The generator's fuel book is initialled beside a chair thick with dust."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="corroborates",
     ["text"]="The reconciliation names the real receiver of the generator's fuel and accepts the account holder instruction."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="The fuel arrived and the stock check accounts for it. {P1} used the absent account holder name because Fossoil rejected any other signature; the rule produced the false name."
    }},
   ["optional"]={{["key"]="dockets-wrench",["role"]="records",["kind"]="PipeWrench",["wear"]="heavy, stained dark at the grip",
    ["title"]="Pipe wrench, marked {P1}",
    ["observation"]="A pipe wrench standing behind the fuel dockets.",
    ["source"]="A name is scratched into the shaft: {P1}.",
    ["note"]="The name on the tool is not the name on the receipt. Only one of them signed anything."}}
  },{
   ["question"]="Why is the absent Sunstar manager signing night deliveries?",
   ["centralAxis"]="absence",
   ["event"]="Sunstar required its manager name on linen receipts while leaving the night clerk a signature stamp to keep deliveries moving.",
   ["outcome"]="The clerk used the authorised stamp while the manager was absent. The linen arrived, and a signature complaint ended with the stamp locked away and no replacement receiver appointed.",
   ["readings"]={"The clerk followed the only procedure that let the rooms get clean sheets.","The manager delegated the signature and kept the right to complain about it."},
   ["organisation"]="Sunstar Motel",
   ["grounding"]="SunstarMotel",
   ["essential"]={"claim","response","review"},
   ["anchors"]={
    ["claim"]={
     ["kind"]="dispatch",
     ["title"]="Linen delivery docket / {CODE}",
     ["observation"]="The manager name is printed in purple ink, including the same tiny break through two letters.",
     ["source"]="SUNSTAR MOTEL\n{DATE1}\nLinen received: 24 sheet sets.\nManager signature: {P2}. Delivery time 23:10.\nSupplier queries and retained docket: {B}.\nOnly manager signature accepted for account deliveries.",
     ["note"]="It calls this a manager signature, but the purple lettering looks stamped. The supplier copy at {B} might tell me who was at the desk."
    },
    ["response"]={
     ["kind"]="CombinationPadlock",
     ["title"]="Night-door padlock, marked {P1}",
     ["observation"]="The delivery-door padlock, tag inked {P1}, hanging open on its hasp.",
     ["source"]="The dial is set and the manager's key board is still full.",
     ["note"]="The door was opened at night by somebody whose key never moved.",
     ["wear"]="good"
    },
    ["review"]={
     ["kind"]="receipt",
     ["title"]="Signature complaint / {CODE}",
     ["observation"]="A complaint return with a small key drawn beside the final instruction.",
     ["source"]="{DATE3}\nDocket {CODE}: all 24 sets counted into stock. Night clerk followed posted instructions.\n{P2}: signatures must not suggest I was present. Lock my stamp in office.\nSupplier still requires manager signature. Replacement night authorisation: pending.\nComplaint closed.",
     ["note"]="They confirmed the sheets and locked up the solution. The next night clerk still needs the manager signature. I expect the guests will get the benefit of that improvement."
    }
   },
   ["comparisons"]={{
     ["requires"]={"claim","response"},
     ["from"]="response",
     ["to"]="claim",
     ["kind"]="disputes-delivery",
     ["text"]="The docket carries a manager signature at 23:10. The delivery-door padlock hangs open while the manager's key is still on its board."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="corroborates",
     ["text"]="The complaint accepts the clerk opened the padlock as instructed, then removes the stamp without replacing that authority."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="{P1} received the linen using the authorised manager stamp. The absent signature was a desk procedure; closing the complaint left the next delivery harder to receive."
    }},
   ["optional"]={{["key"]="linen-stack",["role"]="records",["kind"]="Sheet",["wear"]="laundered, still folded",["quantity"]=11,["roomIntent"]="natural",
    ["title"]="Eleven sheets",
    ["observation"]="Eleven of them on the shelf, folded to the same width.",
    ["source"]="No laundry mark on any of them.",
    ["note"]="Twenty-four sets were signed for. Eleven are here, and the person who signed was not."}}
  }},
 ["two-start-dates"]={{
   ["question"]="Why does a mill worker become new again on the next personnel card?",
   ["centralAxis"]="records",
   ["event"]="McCoy ended a seasonal yard engagement and opened a permanent mill file without carrying service across for the meal allowance.",
   ["outcome"]="The worker had two real engagements, but the new file reset allowance eligibility while experience remained useful for training the next recruit.",
   ["readings"]={"The dates belong to two jobs, but the same experienced worker did both.","McCoy remembered the experience when it needed a trainer and forgot it when a meal cost money."},
   ["organisation"]="McCoy Logging Co.",
   ["grounding"]="McCoyLoggingCorp",
   ["essential"]={"claim","response","review"},
   ["anchors"]={
    ["claim"]={
     ["kind"]="dispatch",
     ["title"]="Seasonal crew card / {CODE}",
     ["observation"]="A crew card with meal-allowance boxes punched along one edge.",
     ["source"]="McCOY LOGGING CO.\n{DATE1}\n{P1}, seasonal yard loading. Work recorded against this card.\nMeal allowance after completed qualifying service.\nRetained time and allowance records: {B}.\nKeep card on transfer; previous hours must be checked.",
     ["note"]="The card says to keep it because the hours matter after a transfer. I would take it to the allowance records at {B}. There are already holes punched into the promise."
    },
    ["response"]={
     ["kind"]="Shovel",
     ["title"]="Worn mill shovel, marked {P1}",
     ["observation"]="A shovel at the mill face, its handle taped and initialled {P1}.",
     ["source"]="The blade is worn back a full inch by years of the same hands.",
     ["note"]="A new starter, or a long habit nobody wrote down.",
     ["wear"]="poor"
    },
    ["review"]={
     ["kind"]="receipt",
     ["title"]="Allowance appeal / {CODE}",
     ["observation"]="A ruled answer clipped to the rejected meal claim.",
     ["source"]="{DATE3}\n{CODE} / {P1}: both employment dates confirmed. Yard hours paid in full.\nMeal claim rejected: permanent service below qualifying period.\nPrior experience accepted for training assignment. Prior service excluded for allowance.\nNo discrepancy remains.",
     ["note"]="They paid the yard work and explained both dates. The meal was refused under the new date, while the training job kept the old experience. No discrepancy they are willing to feed."
    }
   },
   ["comparisons"]={{
     ["requires"]={"claim","response"},
     ["from"]="response",
     ["to"]="claim",
     ["kind"]="disputes-delivery",
     ["text"]="The crew card says the previous hours must be checked on transfer. The mill shovel is worn back an inch by years of the same hands."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="corroborates",
     ["text"]="The appeal applies the new start to meals while retaining the experience the worn shovel shows for training."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="The dates represent seasonal and permanent engagements. The practical result is a reset meal allowance for a worker McCoy still trusts to train someone else."
    }},
   ["optional"]={{["key"]="yard-crowbar",["role"]="records",["kind"]="Crowbar",["wear"]="bent slightly out of true",
    ["title"]="Crowbar, marked {P1}",
    ["observation"]="A crowbar kept with the crew cards.",
    ["source"]="A name is punched along the flat: {P1}.",
    ["note"]="Somebody marked their tools. The personnel file has started them again as a new employee."}}
  },{
   ["question"]="Why was an experienced Fossoil attendant charged as a new starter?",
   ["centralAxis"]="records",
   ["event"]="A billing-file transfer created a second employment start for a continuously employed Fossoil attendant and triggered a second uniform deposit.",
   ["outcome"]="Payroll confirmed continuous service and refunded the duplicate deposit; the billing system retained the new start date.",
   ["readings"]={"The duplicate charge was corrected once someone compared the files.","A new employee existed just long enough for accounts to take another deposit."},
   ["organisation"]="Fossoil",
   ["grounding"]="Fossoil1",
   ["essential"]={"claim","response","review"},
   ["anchors"]={
    ["claim"]={
     ["kind"]="dispatch",
     ["title"]="Attendant starter record / {CODE}",
     ["observation"]="A starter record with a uniform deposit receipt pinned through the name.",
     ["source"]="FOSSOIL\n{DATE1}\n{P1} starts attendant service. Uniform issued; deposit withheld.\nKeep this receipt while employed. Refund and personnel copies: {B}.\nLost receipts may delay repayment. Uniform still belongs to Fossoil.",
     ["note"]="This records {P1} starting work and paying the deposit. Keeping a receipt seems to be part of the uniform. The refund copy should be at {B}."
    },
    ["response"]={
     ["kind"]="Broom",
     ["title"]="Forecourt broom, marked {P1}",
     ["observation"]="The forecourt broom, head worn to a stub, its stale marked {P1}.",
     ["source"]="Its bristles splay the way one attendant's sweep wears them.",
     ["note"]="New on the payroll, old on the forecourt.",
     ["wear"]="poor"
    },
    ["review"]={
     ["kind"]="receipt",
     ["title"]="Deposit correction / {CODE}",
     ["observation"]="A repayment slip bearing both personnel file numbers.",
     ["source"]="{DATE3}\n{CODE}: uninterrupted service verified from payroll. One uniform issued; two deposits taken.\nSecond deposit repaid. Original deposit remains held until uniform returned.\nNew start date retained for billing file. Do not process another starter charge from this date.",
     ["note"]="The second deposit came back. The date stays, with instructions not to believe what it normally means. I would keep both receipts."
    }
   },
   ["comparisons"]={{
     ["requires"]={"claim","response"},
     ["from"]="response",
     ["to"]="claim",
     ["kind"]="disputes-delivery",
     ["text"]="The starter record has {P1} beginning work and being issued a uniform. The forecourt broom is worn to a stub by one attendant's sweep."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="corroborates",
     ["text"]="Payroll confirms the continuous service the worn broom shows and reverses the extra charge."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="One job, one uniform, two recorded starts. The billing transfer caused a duplicate deposit; the worker got that second payment back."
    }},
   ["optional"]={}
  }},
 ["resignation-after-payslip"]={{
   ["question"]="Why was final pay prepared before the cook resigned?",
   ["centralAxis"]="records",
   ["event"]="Sunstar prepared a cook exit after the cook refused to work unpaid during a diner inventory closure, then asked for a resignation to complete the file.",
   ["outcome"]="The cook signed a dated departure statement explaining the refused unpaid shift. Final wages were paid, and the motel filed the departure as voluntary.",
   ["readings"]={"The cook chose to leave rather than work the closed diner for free.","Sunstar offered unpaid work or a ready-made departure, then reported a voluntary resignation."},
   ["organisation"]="Sunstar Motel",
   ["grounding"]="SunstarMotel",
   ["essential"]={"claim","response","review"},
   ["anchors"]={
    ["claim"]={
     ["kind"]="dispatch",
     ["title"]="Final wages prepared / {CODE}",
     ["observation"]="A final-pay voucher with the signature section left empty.",
     ["source"]="SUNSTAR MOTEL\n{DATE1}\nFinal wages prepared for diner cook {P2}. Departure date: today.\nResignation required before personnel file may close.\nCollection and retained paperwork: {B}.\nDo not mark dismissed; voluntary notice expected.",
     ["note"]="They prepared the final wages and decided it was voluntary before getting the resignation. I want the rest of that paperwork at {B}."
    },
    ["response"]={
     ["kind"]="Saucepan",
     ["title"]="Kitchen pan, marked {P1}",
     ["observation"]="A cook's own saucepan still on the range, handle banded {P1}.",
     ["source"]="It is seasoned, scoured and put back in its usual place.",
     ["note"]="The cook was still cooking when the final pay was prepared.",
     ["wear"]="fair"
    },
    ["review"]={
     ["kind"]="receipt",
     ["title"]="Departure recorded / {CODE}",
     ["observation"]="A personnel return folded around a paid wage receipt.",
     ["source"]="{DATE3}\n{CODE}: final wages collected by {P2}; departure statement received.\nVoluntary resignation entered. Statement retained; no unpaid inventory hours claimed or paid.\nVacancy report: personal departure. Kitchen inventory remains incomplete.",
     ["note"]="The cook got the wages owed. The motel got a voluntary departure and an unfinished stock count. Nobody seems to have volunteered for the counting."
    }
   },
   ["comparisons"]={{
     ["requires"]={"claim","response"},
     ["from"]="response",
     ["to"]="claim",
     ["kind"]="disputes-delivery",
     ["text"]="The voucher expects a voluntary notice. The cook's own pan is seasoned, scoured and back in its place on the range."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="corroborates",
     ["text"]="The return confirms the statement arrived and the wages were collected, with the cook's pan still on the range. No inventory hours were claimed, and none were paid."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="The cook refused an unpaid inventory shift and left. Sunstar prepared the exit first, obtained the statement afterward, and filed it as voluntary."
    }},
   ["optional"]={{["key"]="counted-tins",["role"]="records",["kind"]="TinnedSoup",["wear"]="dusty on the lids",["quantity"]=9,["roomIntent"]="natural",
    ["title"]="Nine tins of soup",
    ["observation"]="Nine of them on the shelf, turned label-out.",
    ["source"]="A pencil tick on each lid.",
    ["note"]="Somebody counted these and marked every one. The inventory was never finished."}}
  },{
   ["question"]="Why did U-Store It issue final pay before receiving a resignation?",
   ["centralAxis"]="records",
   ["event"]="A clerk gave notice by telephone because the resignation form was locked in the office, and U-Store It mailed that form to be returned before releasing the final-pay file.",
   ["outcome"]="The worker completed the shift and received final pay on the telephone notice; the written form arrived later after a round trip through the mail.",
   ["readings"]={"The desk paid the worker rather than wait for its own locked form.","U-Store It made a departing employee apply in writing to explain a departure it had already processed."},
   ["organisation"]="U-Store It",
   ["grounding"]="UStoreItMuldraugh",
   ["essential"]={"claim","response","review"},
   ["anchors"]={
    ["claim"]={
     ["kind"]="dispatch",
     ["title"]="Telephone notice entry / {CODE}",
     ["observation"]="A call entry with FORM TO FOLLOW underlined twice.",
     ["source"]="U-STORE IT\n{DATE1}\n{P2} gives notice by telephone, effective after today shift. Resignation form locked in manager office; no spare key at counter.\nMail blank form and final-pay correspondence to {B}.\nDo not accept notice on an unauthorised sheet.",
     ["note"]="The notice is here, but the permitted sheet is locked away. They will post it to {B}. A storage firm keeping its own departure form securely out of reach."
    },
    ["response"]={
     ["kind"]="Mop",
     ["title"]="Store mop, marked {P1}",
     ["observation"]="A mop stood in its bucket by the unit doors, stale marked {P1}.",
     ["source"]="The water is grey and not yet dried in the wringer.",
     ["note"]="Somebody worked this shift. The pay says the job had ended.",
     ["wear"]="fair"
    },
    ["review"]={
     ["kind"]="notepad",
     ["title"]="Returned resignation form / {CODE}",
     ["observation"]="A returned form still carrying its stamped envelope.",
     ["source"]="{DATE3}\n{P2}: I confirm the notice given on {DATE1} and the shift completed that day. I have received my final pay.\nOffice entry: authorised form returned; exit file closed.\nPostage charged to staffing costs.",
     ["note"]="The form has completed the round trip and agrees with the original notice. The only extra staffing cost was postage."
    }
   },
   ["comparisons"]={{
     ["requires"]={"claim","response"},
     ["from"]="response",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="The pay voucher closes the job while the mop water by the unit doors is still grey in the wringer."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="corroborates",
     ["text"]="The returned form confirms the earlier notice and the shift the wet mop finished."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="The later resignation date is the date a required form returned. The worker had already given notice, finished and been paid; the form was the last thing still employed."
    }},
   ["optional"]={}
  }},
 ["address-that-only-receives"]={{
   ["question"]="Why did the delivery address receive mill parts it was forbidden to release?",
   ["centralAxis"]="movement",
   ["event"]="McCoy made a receiving desk responsible for urgent belts while requiring the stopped mill to acknowledge delivery before the desk could issue them.",
   ["outcome"]="A foreman signed receipt while the belt was still at the desk, obtained its release, and recorded the actual mill arrival afterward.",
   ["readings"]={"The foreman broke the circular instruction and got the repair moving.","The urgent-delivery procedure required a false receipt before it allowed a real delivery."},
   ["organisation"]="McCoy Logging Co.",
   ["grounding"]="McCoyLoggingCorp",
   ["essential"]={"claim","response","review"},
   ["anchors"]={
    ["claim"]={
     ["kind"]="dispatch",
     ["title"]="Urgent belt routing / {CODE}",
     ["observation"]="An urgent routing sheet with HOLD stamped immediately below PRIORITY.",
     ["source"]="McCOY LOGGING CO.\n{DATE1}\nReplacement drive belt received at holding desk. Mill line stopped.\nNo release until destination signs receipt. Do not leave desk stock unattended.\nRetained instruction and receipt copies: {B}.\nPriority: immediate.",
     ["note"]="The belt is urgent, but cannot leave until the place it has not reached signs for it. The receipt copies at {B} ought to show how anyone escaped that sentence."
    },
    ["response"]={
     ["kind"]="Ratchet",
     ["title"]="Mill-part ratchet, marked {P1}",
     ["observation"]="A ratchet left in the delivery bay with mill parts, grip stamped {P1}.",
     ["source"]="The parts carry a HOLD - DO NOT RELEASE tie that has been cut.",
     ["note"]="The parts were released. Something says they should not have been.",
     ["wear"]="fair"
    },
    ["review"]={
     ["kind"]="receipt",
     ["title"]="Mill repair return / {CODE}",
     ["observation"]="A repair return with the actual arrival time written beside the earlier receipt number.",
     ["source"]="{DATE3}\nJob {CODE} completed {DATE2}: belt arrived after advance receipt, fitted, mill line restarted.\nHolding desk quantity reconciled. No stock missing.\nAdvance signature noted. Delivery procedure complied with in full.",
     ["note"]="The belt reached the mill and the line restarted. They even recorded the order correctly here. Full compliance required doing the receipt before the receiving."
    }
   },
   ["comparisons"]={{
     ["requires"]={"claim","response"},
     ["from"]="response",
     ["to"]="claim",
     ["kind"]="disputes-delivery",
     ["text"]="The routing sheet releases nothing until the destination signs for it. The parts sit in the bay with their HOLD tie cut and a ratchet left beside them."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="corroborates",
     ["text"]="The repair return confirms the held parts moved after that signature and were fitted to restart the line."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="The parts were trapped by a circular release rule. {P1} signed early, collected the belt and repaired the line; no belt went missing."
    }},
   ["optional"]={{["key"]="desk-screwdriver",["role"]="records",["kind"]="Screwdriver",["wear"]="the blade rounded off",
    ["title"]="Screwdriver, marked {P1}",
    ["observation"]="A screwdriver left on the holding desk.",
    ["source"]="A name in marker down the handle: {P1}.",
    ["note"]="The desk is where the belt waited to be signed for. The tool has a name and the receipt has a signature."}}
  },{
   ["question"]="Why did Sunstar receive food while its diner could not use any?",
   ["centralAxis"]="movement",
   ["event"]="Sunstar accepted dry goods during a stock count but forbade opening counted cases, so the kitchen requisitioned its own delivery as a transfer.",
   ["outcome"]="The goods reached the diner through a recorded internal transfer, which the motel counted as a second delivery and billed to the kitchen budget.",
   ["readings"]={"The kitchen found a procedure that let it serve the food already delivered.","The motel counted one shipment twice and charged its kitchen to move it across the storeroom."},
   ["organisation"]="Sunstar Motel",
   ["grounding"]="SunstarMotel",
   ["essential"]={"claim","response","review"},
   ["anchors"]={
    ["claim"]={
     ["kind"]="dispatch",
     ["title"]="Dry goods received / {CODE}",
     ["observation"]="A delivery list with every unopened case ticked in blue.",
     ["source"]="SUNSTAR MOTEL\n{DATE1}\nDiner dry goods received into counted store stock. Do not break cases while kitchen count is open.\nDiner service to continue. No outside food purchases authorised.\nRetained delivery and requisition copies: {B}.",
     ["note"]="Food delivered, food unopened, meals still expected. The kitchen must have found some way through the requisitions at {B}, or served the guests a very well-counted cupboard."
    },
    ["response"]={
     ["kind"]="GridlePan",
     ["title"]="Diner griddle, marked {P1}",
     ["observation"]="The diner griddle, cold, its handle tagged {P1}.",
     ["source"]="Its gas bayonet is capped, and crates of food stand beside it.",
     ["note"]="Food arrived for a kitchen that could not cook it.",
     ["wear"]="poor"
    },
    ["review"]={
     ["kind"]="receipt",
     ["title"]="Internal delivery settled / {CODE}",
     ["observation"]="A receipt showing one supplier charge and a separate internal handling charge.",
     ["source"]="{DATE3}\n{CODE}: supplier shipment received {DATE1}; same goods issued to diner {DATE2}.\nKitchen confirms goods used for service. No second supplier shipment.\nMonthly deliveries completed: 2. Internal handling charged to kitchen.\nStock count closed.",
     ["note"]="The guests got the food. Accounts got two deliveries out of one shipment and charged the kitchen for moving its own tins. The count finally closed with something for everyone."
    }
   },
   ["comparisons"]={{
     ["requires"]={"claim","response"},
     ["from"]="response",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="The requisition converts the held supplier goods into an internal delivery, while the diner griddle stands cold with its gas capped."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="corroborates",
     ["text"]="The settlement confirms the same goods reached the cold griddle and explicitly rules out a second supplier shipment."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="One shipment reached the diner by an internal transfer between shelves. Sunstar counted two deliveries and billed the kitchen for the second one."
    }},
   ["optional"]={{["key"]="store-sponges",["role"]="records",["kind"]="Sponge",["wear"]="unused, still dry",["quantity"]=8,["roomIntent"]="natural",
    ["title"]="Eight sponges",
    ["observation"]="Eight of them in the store, still in their wrapper.",
    ["source"]="Nothing marked on the packet.",
    ["note"]="The store was counted case by case. These were never opened either."}}
  }}
}

local function copy(value)
 if type(value)~="table" then return value end
 local out={}
 for key,item in pairs(value) do out[key]=copy(item) end
 return out
end
function M.get(id,variant)
 local family=scenarios[id] or InventoryScenarios[id] or AdministrativeScenarios[id] or CorrespondenceScenarios[id]
 local scenario=family and family[variant]
 if type(variant)~="number" or variant~=math.floor(variant) or not scenario then return nil end
 local out=copy(scenario)
 -- This retained copy and its counterpart both have actual bound addresses.
 -- Naming the origin lets the reader locate an unnumbered counterpart without
 -- turning either house into the business that issued the correspondence.
 if not out.anchors.claim.source:find("{A}",1,true) then
  out.anchors.claim.source=out.anchors.claim.source.."\nLocal copy filed at: {A}."
 end
 return out
end
return M
