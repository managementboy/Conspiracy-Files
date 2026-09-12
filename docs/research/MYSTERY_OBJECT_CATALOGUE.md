# Installed mystery-object candidates — Build42.20.4

Initial installed-source audit2026-09-06 for P4-R68. Source root: C:/Program Files (x86)/Steam/steamapps/common/ProjectZomboid/media/scripts/generated/items. Exact item declarations below were found locally; proposed narrative uses are design suggestions, not verified gameplay capabilities. This is a curated starting catalogue, not an exhaustive whitelist or a mandatory set for each case.

| Family | Verified item names (Base namespace) | Useful story roles | Current confidence / needed work |
|---|---|---|---|
| Personal records | Note, Notepad, Notebook, Journal, Diary1, Diary2, LetterHandwritten | anonymous lead, private account, dated contradiction | Note/Notebook/Diary1 carriers already used; inspect remaining native reading behavior |
| Public/transaction records | Receipt, Newspaper, Newspaper_Recent, Newspaper_New, Newspaper_Dispatch_New, Newspaper_Herald_New, Newspaper_Knews_New, Newspaper_Times_New | movement/time clue, purchase, public account versus private evidence | Newspaper carrier proven; receipt/date/name behavior needs inspection |
| Identification | IDcard and named variants, CreditCard and stolen variant, BusinessCard/Personal/Nolans, Badge | observed name, organisation, suggested occupation | direct corpse ID observation/persistence passed; other variants need native acceptance; badge does not itself prove current occupation |
| Citations | ParkingTicket, SpeedingTicket | name plus place/date if exposed | observer allowlist implemented; native exposed fields not yet fully audited |
| Keys | Key1, CarKey; key.txt also declares KeyPadlock | access relation, vehicle connection, container link | actual working house-key adapter is the next development segment; current generated tagged key remains decorative |
| Images | Photo, Photo_Secret, Photo_VeryOld, Photo_Hass, PhotoBook, PhotoAlbum, PhotoAlbum_Old | person/place association, object detail, earlier state of a location | declarations verified; generic icon/photo item does not guarantee custom image display; avoid describing a visually shown photo we cannot render |
| Location records | Map; named town/city map variants | route, meeting place, annotated location | world-map clue marks proven; physical map text/annotation behavior needs separate adapter checks |
| Recorded material | VHS_Home, VHS_Retail | witness account, recorded event, timestamp | native items exist; custom playable content not verified or promised |
| Equipment | Camera, CameraDisposable, CameraExpensive, CameraFilm, RadioReceiver, RadioTransmitter, WalkieTalkie1–5, RadioBlack, RadioRed | material association, communication context, technical role | existence verified; equipment presence alone does not establish a conspiracy, recording or occupation |

Generator direction: define minimum factual relationships for a coherent case, then select eligible carriers and optional corroborating/contradicting evidence. Count and types vary with template/available placements; no fixed seven-object checklist or fixed three/four split. Preserve independent containers, bounded storage/save budgets and the first-house opening. Working mechanisms require verified adapters; decorative labels must not promise working access or playback.

First integration target: anonymous document in starting house, locally named person/corpse, a working house key observed from the same source, and a later observed key/door match that supports association with the earlier document. Keep original clue anonymous and add derived journal interpretation. Do not use invisible descriptor names as player knowledge.
