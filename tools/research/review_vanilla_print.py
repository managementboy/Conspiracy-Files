"""Apply the 2026-09-19 source-reading review and build a local searchable catalogue."""
import collections
import html
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / 'docs/research/vanilla-print-2026-09-19'
data = json.loads((OUT / 'catalogue.json').read_text(encoding='utf-8'))
records = data['records']

def ids(text):
    return set(text.split())

groups = {
    'Industry, repairs and technical supplies': ids('McCoyLoggingCorp LectromaxManufacturingJobAd CircuitalHealing AMZSteel OldCGECorpBuilding LouisvilleBruiser ScarletOakDistillery LennysCarRepair CarFixation AlsAutoShop AmericanTire NailsAndNuts WPDIY EPToolsLV HobbsandPerkinsHardware StuartandLogScrapyard KnoxPackKitchens MadDansDen'),
    'Civic services, education and care': ids('LSU EkronCollege BrooksLibrary WPTownHall RosewoodFD BrandenburgFD LVFD MuldraughPD LVPDHQ RiversidePD GoldenSunset SunsetPinesFuneralHome'),
    'Employment and personal history': ids('SpiffosHiringDixie SpiffosHiringLouisville SpiffosHiringWestPoint PileoCrepeJobAdCrossRoadsMall HitVidsJobAdMarchRidge MarchRidgeSchoolJobAd KnoxBankJobAdRosewood GreenesJobAdEkron MailCarrierAdEkron'),
    'Heritage and existing mysteries': ids('ArtGalleryofLouisville Coalfield QuillManor Sanatorium DarkwallowGuestHouse'),
    'Shelter, preparedness and military history': ids('ColdWarBunker YourLocalShelterBrandenburg ReadyPrep'),
    'Agriculture and rural supplies': ids('FarmersMarket FarmingAndRuralSupplyDoeValley A1Hay OvoFarms BeefChunk BrottAuction'),
    'Gatherings, events and community': ids('MuldraughBakeSale KnoxGunOwnersClubGetTogether RiversideIndependenceDayPartyAllWelcome FourthofJulyCelebrationDixieMobilePark MusicFest93 FallasLakeChurch ElveeArena'),
    'Travel, vehicles and accommodation': ids('NolansUsedCars UpscaleMobility Airport Delilah SunstarMotel HavishamSuites SleepEazzzeInn'),
    'Property and storage': ids('UStoreItRiverside UStoreItLouisville UStoreItMuldraugh BensCabin CabinforRentDixie RedOakApartments DuCaseApartments HighStreetApartments LowryCourt LeafhillHeights MeadshireEstate'),
}

# Each map was read, including its symbols and configured world effects.
map_groups = {
 'Personal stories and relationships': {
  'BBurg': [1,3,4,6,8], 'Irvington': [2,3,4,5,8,10],
  'Louisville': [1,2,5,7,8,14,16], 'MarchRidge': [3,4,7,8,9,10],
  'Mul': [2,6,8,15,17,18], 'Riverside': [1,2,4,5,6,7,8,9],
  'Rosewood': [3,5], 'World': [1,4,5,12,13,14,19,20],
  'Wp': [1,2,4,5,6,8,9,11,12,14]},
 'Routes, resources and refuge': {
  'BBurg': [2,5], 'Ekron': [1,2,3,4,5,7,8], 'Irvington': [6,7,9],
  'Louisville': [3,4,6,9,10,11,13], 'MarchRidge': [1,2,5,6],
  'Mul': [1,3,5,7,11,12,13,14,16,19], 'Riverside': [3,10],
  'Rosewood': [1,2,4], 'World': [2,3,6,7,8,10,15,21,22,23],
  'Wp': [3,7,15,16]},
 'Threats, conflict and hostile testimony': {
  'BBurg': [7], 'Ekron': [6], 'Mul': [4,9,10], 'World': [18], 'Wp': [10,13]},
 'Technical, military and infrastructure leads': {'World': [9,11,16,17]},
 'Events and places before the outbreak': {'Irvington': [1], 'Louisville': [12]},
 'Heritage and existing mysteries': {'Louisville': [15]},
}
map_categories = {}
for category, prefixes in map_groups.items():
    for prefix, numbers in prefixes.items():
        for n in numbers:
            key = prefix + 'StashMap' + str(n)
            assert key not in map_categories
            map_categories[key] = category

notes = {
 'HouseforSale895': 'Source discrepancy: plain-text reader says $52,000; the English artwork shows $35,000. Both name 1114 Main Street, West Point. Do not build a price discrepancy mystery from this asset mismatch.',
 'CircuitalHealing': 'Strong electrician opening: the original advert explicitly covers radios, TVs and word processors. A mod-authored repair record could connect a customer or serial number to a later destination.',
 'LectromaxManufacturingJobAd': 'Industrial machining job: saw blades, lathe and hydraulic press. The name alone is not evidence of electronics work.',
 'WorldStashMap11': 'Best direct relay lead: Dish 3/Tower 2, signal loss near 6 GHz, power problem, test with Lexington. Keep this technical report as testimony; it does not establish a conspiracy or identify Site 31.',
 'ColdWarBunker': 'Tourism text explicitly describes a shed/radio tower, decommissioned military bunker and liability waivers. Good later travel/tool setting; separate from a relay station.',
 'LouisvilleStashMap15': 'The owner screenshot is this map. Its Target mark at 12546,1393 falls inside the art-gallery brochure rectangle. Its building anchor 12619,1406 is different: use the semantic target, not the anchor, for the gallery.',
 'ArtGalleryofLouisville': 'Verified match to Natalie’s marked gallery. Provides address and upstairs modern-art context. A new inventory/transfer clue could extend the request without silently creating an art-rescue mechanic.',
 'LSU': 'Connects naturally to Natalie’s stated employment. Academic subjects in advertising do not prove the cause of the Knox Event.',
 'MuldraughPD': 'Original agenda names generator thefts, illegal dumping and a stolen Chevalier Dart. Excellent bounded local mysteries; any connection between them would be authored by this mod.',
 'OldCGECorpBuilding': 'Demolition dispute, manufacturing history and distinctive skybridge provide a strong permit/archive trail. No wrongdoing is proven by the preservation campaign.',
 'YourLocalShelterBrandenburg': 'Exact shelter address, paid membership, 60 comfortable/120 maximum capacity. Strong bureaucratic allocation or access-record mystery.',
 'SunsetPinesFuneralHome': 'Death administration is explicit in the advert. Suits records and mistaken identity; do not assume a particular corpse is available.',
 'OvoFarms': 'Tours are explicitly discontinued. Useful discrepancy to investigate, without assuming the farm caused the outbreak.',
 'QuillManor': 'Names the Brenford family, a disappearance and company history. Preserve these identities and chronology; do not assign them as the survivor’s family by inference.',
 'Coalfield': 'An 1882 disappearance and reconstructed tourist town. Distinguish historic legend, reenactment and a new contemporary mystery.',
 'Sanatorium': 'Historical tuberculosis institution and ghost-tour advertising. Treat haunting as marketing/testimony, not an established supernatural fact.',
 'DarkwallowGuestHouse': 'Suggestive past in the wording, but no specific crime established. Needs a concrete authored question before becoming an investigation.',
 'WorldStashMap17': 'Photography, patrol blind spot and sensor timing are written on the map. Source text is not proof that active patrols or timed sensors exist as mechanics.',
 'EkronStashMap6': 'Hostile graffiti with no actionable destination. Keep as ambient testimony; do not turn its self-harm instruction into a player objective.',
 'WorldStashMap18': 'Symbol-only account of fire, danger and conflict; marks alone do not prove corresponding live events or actors.',
 'UpscaleMobility': 'Vehicle model, owner-role and price details can motivate ownership/service-record connections; buyer roles are advertising claims.',
 'MarchRidgeStashMap3': 'Vanilla definition includes traps=1. Extra clues must account for existing stash preparation and hazards.',
 'FarmingAndRuralSupplyDoeValley': 'Internal ID says DoeValley; printed destination says Fallas Lake. Preserve both and use the configured rectangle.',
 'PizzaWhirledJobAdRosewood': 'Despite JobAd in the ID, the visible text is a pizza promotion, not recruitment.',
}

region_names = {'BBurg': 'Brandenburg', 'Brandenburg': 'Brandenburg', 'Ekron': 'Ekron', 'Irvington': 'Irvington',
                'Louisville': 'Louisville', 'MarchRidge': 'March Ridge', 'Mul': 'Muldraugh', 'Wp': 'West Point',
                'Rosewood': 'Rosewood', 'Riverside': 'Riverside', 'World': 'World / countryside'}

for r in records:
    if r['kind'] == 'annotated map':
        r['category'] = map_categories[r['id']]
        r['region'] = region_names[r['region_source']]
        x, y = (int(r['fields'].get(k, '0')) for k in ('buildingX', 'buildingY'))
        r['anchor'] = [x, y]
        r['anchor_usable'] = x > 10 and y > 10
        r['location_status'] = 'Source anchor plus individual map marks; inspect which mark the text refers to' if r['anchor_usable'] else 'Placeholder-like anchor; use individual map marks, no building target inferred'
        r['points'] = [[s['x'], s['y'], s['symbol'] or 'Text position'] for s in r['stamps']]
        r['note'] = notes.get(r['id'], 'Preserve the original statement and vanilla stash effects. A named person, cache or marked place can support a related clue; the statement is not automatically true.')
    else:
        r['category'] = next((category for category, members in groups.items() if r['id'] in members), '')
        if not r['category']:
            if r['id'].startswith(('HouseforSale', 'Premises')):
                r['category'] = 'Property and storage'
            elif r['id'].startswith('Fossoil'):
                r['category'] = 'Travel, vehicles and accommodation'
            else:
                r['category'] = 'Shops, leisure and everyday life'
        r['region'] = ' / '.join(t for t in ['Louisville','Brandenburg','Irvington','Ekron','Echo Creek','March Ridge','Muldraugh','West Point','Riverside','Rosewood','Valley Station','Fallas Lake','Doe Valley'] if t.lower() in (r['title']+' '+r['text']).lower()) or 'See printed directions and exact rectangle'
        r['location_status'] = 'Vanilla reveal-on-map rectangle; not an exact loot/container location'
        r['points'] = [[(b['x1']+b['x2'])/2, (b['y1']+b['y2'])/2, 'Rectangle centre'] for b in r['locations']]
        r['note'] = notes.get(r['id'], 'Use the printed service, address or event as a reason to visit. A related mod-authored record could be discovered there; the advert itself need not become suspicious.')
    r['original_images'] = [(Path(data['game_root']) / p).as_uri() for p in r.get('textures', [])]
    r['review'] = 'Plain-text reading version and source coordinates inspected; artwork contact sheets reviewed with focused full-size checks. Artwork may differ from the reading version. Category is editorial. No live-world visit verified.'

assert len(map_categories) == sum(r['kind'] == 'annotated map' for r in records)
(OUT/'catalogue.json').write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n',encoding='utf-8', newline='\n')
lines = ['# Categorised index', '', 'Every row links to the full-text entry in the searchable HTML catalogue. Coordinates are source evidence, not live-world verification.', '',
         '| Item | Type | Category | Place / region wording | Coordinate reference |', '|---|---|---|---|---|']
for r in records:
    coordinate = ', '.join(map(str, r['anchor'])) if r['kind']=='annotated map' and r['anchor_usable'] else '; '.join(', '.join(map(str,p[:2])) for p in r['points'][:3])
    lines.append('| ['+r['title']+'](catalogue.html#'+r['id']+') | '+r['kind']+' | '+r['category']+' | '+r['region']+' | '+coordinate+' |')
(OUT/'INDEX.md').write_text('\n'.join(lines)+'\n',encoding='utf-8', newline='\n')
ordinary = ['# Ordinary map items', '', 'These are navigation surfaces, separate from the 125 annotated designs. Bounds are x1, y1, x2, y2 in world squares. The generic Map item has no fixed map ID.', '', '| Item | Bounds | Category |', '|---|---|---|']
for r in data['ordinary_map_items']:
    ordinary.append('| '+r['id']+' | '+str(r['bounds'])+' | '+r['category']+' |')
(OUT/'ORDINARY_MAPS.md').write_text('\n'.join(ordinary)+'\n',encoding='utf-8', newline='\n')

payload=json.dumps(records,ensure_ascii=False).replace('<','\\u003c')
page=r'''<!doctype html><html lang="en"><meta charset="utf-8"><title>Knox paper trails — offline catalogue</title>
<style>body{margin:0;background:#f1eee4;color:#26332f;font:16px system-ui}header{padding:30px 5%;background:#213e39;color:#fff}h1{margin:0}main{max-width:1100px;margin:25px auto;padding:0 20px}input,select{padding:12px;margin:5px;border:1px solid #9aa69f;border-radius:5px}input{width:40%}article{background:white;border:1px solid #cbd2ca;border-radius:8px;padding:22px;margin:16px 0}h2{margin:0 0 6px}.meta{color:#596961;font-size:14px}.note{border-left:4px solid #b38a32;padding:12px;background:#fbf7e9}pre{white-space:pre-wrap;overflow-wrap:anywhere;font:15px/1.55 system-ui}summary{cursor:pointer;padding:8px 0;font-weight:600}table{border-collapse:collapse;font-size:13px}td,th{padding:6px;border:1px solid #ddd}svg{width:100%;height:350px;background:#edf2ef}.small{font-size:13px}a{color:#2c6860}</style>
<header><h1>Knox paper trails</h1><p>258 locally catalogued designs · 125 annotated maps · 111 flyers · 22 brochures</p><p>Source text, destinations and mystery possibilities. Offline research — no live-world verification.</p></header>
<main><p>The coordinates below locate advertised destinations and map marks. They do not say where a particular copy spawns in your save.</p>
<input id="query" placeholder="Search text, place, ID or mystery idea"><select id="kind"><option value="">All types</option></select><select id="category"><option value="">All categories</option></select><p id="count"></p><div id="entries"></div></main>
<script>const data=PAYLOAD;
const esc=s=>String(s??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
for(const name of ['kind','category'])for(const v of [...new Set(data.map(r=>r[name]))].sort()){let o=document.createElement('option');o.value=o.textContent=v;document.getElementById(name).append(o)}
function plot(r){let p=r.points;if(!p.length)return '';let xs=p.map(p=>p[0]),ys=p.map(p=>p[1]);let loX=Math.min(...xs)-30,loY=Math.min(...ys)-30,w=Math.max(80,Math.max(...xs)-loX+30),h=Math.max(80,Math.max(...ys)-loY+30);return `<svg viewBox="${loX} ${loY} ${w} ${h}" preserveAspectRatio="xMidYMid meet" aria-label="Source coordinates, no terrain">`+p.map((q,i)=>`<circle cx="${q[0]}" cy="${q[1]}" r="${Math.max(w,h)/100}" fill="${q[2]=='Text position'?'#879e97':'#b24a37'}"><title>${esc(q.join(', '))}</title></circle>`).join('')+'</svg><p class="small">Coordinate sketch only. Red: symbols or destination centres. Grey: text positions. North is up; no terrain or walkable route is implied.</p>'}
function render(){let q=document.getElementById('query').value.toLowerCase(),k=document.getElementById('kind').value,c=document.getElementById('category').value;let rows=data.filter(r=>(!k||r.kind===k)&&(!c||r.category===c)&&(!q||JSON.stringify(r).toLowerCase().includes(q)));document.getElementById('count').textContent=rows.length+' designs';document.getElementById('entries').innerHTML=rows.map(r=>`<article id="${esc(r.id)}"><h2>${esc(r.title)}</h2><p class="meta">${esc(r.kind)} · ${esc(r.category)} · ${esc(r.id)}</p><p>${esc(r.region)}</p><p class="note">${esc(r.note)}</p><details><summary>Read full text</summary><pre>${esc(r.text||'Symbols only — no written annotation in this definition.')}</pre></details><details><summary>Locate in Knox</summary><p>${esc(r.location_status)}</p>${r.anchor?'<p>Stash building anchor: '+esc(r.anchor.join(', '))+(r.anchor_usable?'':' — do not use as destination')+'</p>':''}<pre>${esc(JSON.stringify(r.locations||r.stamps,null,2))}</pre>${plot(r)}</details><details><summary>Source and inspection evidence</summary><p>${esc(r.review)}</p><pre>${esc(r.source)}\n${esc(r.source_key||r.source_line)}\n${esc(JSON.stringify(r.fields||{},null,2))}</pre>${r.layout_text?'<h3>Text extracted from visual layout</h3><pre>'+esc(r.layout_text.join('\n'))+'</pre>':''}${r.textures?'<p>Original texture paths within the installed game:</p><pre>'+esc(r.textures.join('\n'))+'</pre>':''}</details></article>`).join('')}
for(const id of ['query','kind','category'])document.getElementById(id).addEventListener('input',render);render();if(location.hash){let id=decodeURIComponent(location.hash.slice(1));document.getElementById(id)?.scrollIntoView()}
</script></html>'''.replace('PAYLOAD',payload)
page = page.replace('${esc(r.region)}</p>', '${esc(r.region)}</p>${r.original_images.length?\'<details><summary>Original artwork in your local game folder</summary>\'+r.original_images.map(u=>\'<a href="\'+esc(u)+\'">Open full-size original</a><br>\').join(\'\')+\'</details>\':\'\'}')
(OUT/'catalogue.html').write_text(page,encoding='utf-8', newline='\n')
print(json.dumps({'categories':dict(collections.Counter(r['category'] for r in records)), 'count':len(records)},indent=2))
