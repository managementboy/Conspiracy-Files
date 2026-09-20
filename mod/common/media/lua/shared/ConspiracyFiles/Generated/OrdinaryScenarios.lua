-- Event-complete ordinary scenarios. Data only; the shared story builder owns
-- placeholder binding, discovery gating, carrier validation and placement.
local M={}
local InventoryScenarios=require("ConspiracyFiles/Generated/InventoryScenarios")
local AdministrativeScenarios=require("ConspiracyFiles/Generated/AdministrativeScenarios")
local CorrespondenceScenarios=require("ConspiracyFiles/Generated/CorrespondenceScenarios")

local scenarios={
 ["transfer-nobody-arranged"]={{
   ["question"]="Why was a mechanic transferred to a mill without leaving the roadside?",
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
     ["kind"]="notebook",
     ["title"]="Roadside job record / {CODE}",
     ["observation"]="A job page with rain spots inside a broad greasy handprint.",
     ["source"]="{DATE2}\nJob {CODE}; work performed {DATE1}.\n{P1}: haul truck, broken fan belt, roadside throughout. Truck drove away after repair. Did not attend mill.\n{P2}, accounts: yard repairs allocation exhausted. Charge the mechanic to MILL for this job. Do not move the truck to make the form true.",
     ["note"]="{P1} stayed beside the broken truck. Accounts sent the cost to the mill and specifically told everyone to leave the truck alone. A transfer that saves on travel."
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
     ["kind"]="recontextualises",
     ["text"]="The roadside entry explains why the transfer offered no transport: {P1} never went to the mill."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="recontextualises",
     ["text"]="The closing entry puts the roadside repair on the mill account, exactly as accounts instructed."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="The truck was fixed where it broke down. The transfer moved the cost, not the mechanic; the yard then reported no repair expense."
    }},
   ["optional"]={}
  },{
   ["question"]="Why does a transferred storage clerk still work at the same counter?",
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
     ["kind"]="notebook",
     ["title"]="Counter shift book / {CODE}",
     ["observation"]="A counter book divided down the middle with a ruler.",
     ["source"]="{DATE2}\n{P1}: moved CLAIMS sign to left end of counter. RENTALS sign stays right. Only clerk on shift.\nSame customers keep changing queues. Told tenants a claim does not suspend the rent.\n{P2}: record each half of the counter separately for the response report.",
     ["note"]="The new office is the left end of the old counter. {P1} has to record two queues while being the only person serving either. I suppose moving the sign was the transfer."
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
     ["kind"]="recontextualises",
     ["text"]="The counter book places the transferred clerk at both signs on the same counter."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="recontextualises",
     ["text"]="The return counts the two headings separately while paying {P1} for a single shift."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="No extra clerk arrived. U-Store It made a response team by dividing one counter and one person into two reporting lines."
    }},
   ["optional"]={}
  }},
 ["signed-by-someone-absent"]={{
   ["question"]="How did an absent account holder sign for generator fuel?",
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
     ["kind"]="notepad",
     ["title"]="Account holder instruction / {CODE}",
     ["observation"]="A carbon message retained behind a tank-reading sheet.",
     ["source"]="{DATE2}\nCopy of instruction for delivery on {DATE1}.\n{P1}: I will be away. Sign {P2} on the receipt; they rejected your own name last time. Put your real name in our fuel book.\nWe need the generator running more than we need a third returned delivery.\n{P2}",
     ["note"]="{P2} told {P1} to use the listed name and leave a truthful record elsewhere. The first two rejected deliveries seem to have taught them what the check was checking."
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
     ["kind"]="recontextualises",
     ["text"]="The retained instruction explains why {P2} appears on a delivery received by {P1}."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="recontextualises",
     ["text"]="The reconciliation names the real receiver and accepts the account holder instruction."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="The fuel arrived and the stock check accounts for it. {P1} used the absent account holder name because Fossoil rejected any other signature; the rule produced the false name."
    }},
   ["optional"]={}
  },{
   ["question"]="Why is the absent Sunstar manager signing night deliveries?",
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
     ["kind"]="notebook",
     ["title"]="Night desk instructions / {CODE}",
     ["observation"]="A desk instruction card with a purple fingerprint on the reverse.",
     ["source"]="{DATE2}\n{P1}, night desk: until {P2} returns, use manager-name stamp for linen. Do not sign your own name; supplier will take sheets away.\nTwenty-four sets accepted on {DATE1}.\nStamp kept under desk bell. Guests must not be left waiting while we locate the manager.",
     ["note"]="The instructions put the absent manager under the desk bell. {P1} was told to stamp the deliveries so the guests could have sheets."
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
     ["kind"]="recontextualises",
     ["text"]="The night instructions explain the stamped name on the 23:10 docket while {P2} was away."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="recontextualises",
     ["text"]="The complaint accepts the clerk followed instructions, then removes the stamp without replacing that authority."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="{P1} received the linen using the authorised manager stamp. The absent signature was a desk procedure; closing the complaint left the next delivery harder to receive."
    }},
   ["optional"]={}
  }},
 ["two-start-dates"]={{
   ["question"]="Why does a mill worker become new again on the next personnel card?",
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
     ["kind"]="notebook",
     ["title"]="Permanent crew entry / {CODE}",
     ["observation"]="A roster page with NEW EMPLOYEE written above TRAINER.",
     ["source"]="{DATE2}\n{P1}: seasonal engagement ended; permanent mill engagement starts today.\nAssign new recruit to shadow {P1}, who knows the yard procedure.\nMeal-allowance service starts from permanent date. Do not carry punches from seasonal card.",
     ["note"]="Experienced enough to train the recruit, new enough to start earning lunch again. The two dates are doing different jobs for McCoy."
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
     ["kind"]="recontextualises",
     ["text"]="The permanent entry explains the later start and explicitly refuses the punches on the seasonal card."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="recontextualises",
     ["text"]="The appeal applies the new start to meals while retaining the old experience for training."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="The dates represent seasonal and permanent engagements. The practical result is a reset meal allowance for a worker McCoy still trusts to train someone else."
    }},
   ["optional"]={}
  },{
   ["question"]="Why was an experienced Fossoil attendant charged as a new starter?",
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
     ["kind"]="notebook",
     ["title"]="New starter charge / {CODE}",
     ["observation"]="An accounts entry with SAME SHIRT written in the margin.",
     ["source"]="{DATE2}\nNew station billing file opened for {P1}. Start date set to file date.\nAutomatic starter charge: uniform deposit withheld.\nSupervisor: continuous employee, same uniform, no second issue. Accounts request a duplicate-charge form.",
     ["note"]="The employee kept working in the same shirt. Accounts opened a new file and charged for the shirt again. The supervisor has noticed; that earns a form."
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
     ["kind"]="recontextualises",
     ["text"]="The second date comes from a new billing file, which triggered another deposit despite the first receipt."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="recontextualises",
     ["text"]="Payroll confirms continuous service and reverses the extra charge."
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
     ["kind"]="notepad",
     ["title"]="Cook departure statement / {CODE}",
     ["observation"]="A signed statement with the printed words PERSONAL REASONS crossed through.",
     ["source"]="{DATE2}\nI am leaving the Sunstar diner. On {DATE1} I was told the diner was closed for inventory but I should attend unpaid to count the stock. I refused. The desk said my final wages were already prepared if I would sign this.\nPlease leave this explanation attached.\n{P2}",
     ["note"]="{P2} would not count stock for free. The desk had an exit ready and wanted the signature. I can see why the cook crossed out personal reasons."
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
     ["kind"]="recontextualises",
     ["text"]="The cook statement explains why final wages were ready before the requested resignation."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="recontextualises",
     ["text"]="The final entry pays the wages, retains the explanation, and still reports a personal departure."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="The cook refused an unpaid inventory shift and left. Sunstar prepared the exit first, obtained the statement afterward, and filed it as voluntary."
    }},
   ["optional"]={}
  },{
   ["question"]="Why did U-Store It issue final pay before receiving a resignation?",
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
     ["kind"]="receipt",
     ["title"]="Final pay despatched / {CODE}",
     ["observation"]="A payment voucher clipped to a postage entry.",
     ["source"]="{DATE2}\n{P2}: last shift completed. Final pay issued against telephone notice.\nBlank resignation form enclosed separately for signature and return.\nExit-file status: employed, pending written notice. Do not roster or pay further shifts.",
     ["note"]="The shift is finished and the pay has gone out. The file keeps {P2} employed until the posted form comes back, with strict instructions not to employ them."
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
     ["text"]="The pay voucher follows the logged telephone notice while the authorised form is still in the post."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="recontextualises",
     ["text"]="The returned form confirms the earlier notice, completed shift and received pay."
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
     ["kind"]="notebook",
     ["title"]="Advance receipt / {CODE}",
     ["observation"]="A receipt with STILL AT DESK added beneath the foreman signature.",
     ["source"]="{DATE2}\n{P1}, foreman: signing destination receipt in advance solely to release the belt. Belt still at holding desk; I will carry it back.\n{P2}, desk: signed receipt supplied, issue permitted.\nDo not alter the printed word RECEIVED.",
     ["note"]="{P1} signed for the belt before taking it and wrote that down. The desk accepted the signature provided the printed lie remained tidy."
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
     ["kind"]="recontextualises",
     ["text"]="The advance receipt gets around the hold on the urgent routing sheet by signing before delivery."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="recontextualises",
     ["text"]="The repair return confirms the belt arrived after that signature and was fitted to restart the line."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="The parts were trapped by a circular release rule. {P1} signed early, collected the belt and repaired the line; no belt went missing."
    }},
   ["optional"]={}
  },{
   ["question"]="Why did Sunstar receive food while its diner could not use any?",
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
     ["kind"]="notebook",
     ["title"]="Kitchen requisition / {CODE}",
     ["observation"]="A kitchen requisition with the same room named under FROM and TO.",
     ["source"]="{DATE2}\n{P1}: requisition received tins for tonight service. Transfer from store stock to kitchen stock. Both shelves are in same storeroom.\n{P2}, accounts: treat as internal delivery, two handling units. Cases may be opened once issued.",
     ["note"]="The tins can cross from one shelf to another if it is called a delivery. There is a handling charge for that distance. At least the case can then be opened."
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
     ["text"]="The requisition converts the held supplier goods into an internal delivery so their cases can be opened."
    },{
     ["requires"]={"response","review"},
     ["from"]="review",
     ["to"]="response",
     ["kind"]="recontextualises",
     ["text"]="The settlement confirms the same goods reached service and explicitly rules out a second supplier shipment."
    },{
     ["requires"]={"claim","response","review"},
     ["from"]="review",
     ["to"]="claim",
     ["kind"]="recontextualises",
     ["text"]="One shipment reached the diner by an internal transfer between shelves. Sunstar counted two deliveries and billed the kitchen for the second one."
    }},
   ["optional"]={}
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
