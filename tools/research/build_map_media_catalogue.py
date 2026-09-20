"""Build static source-candidate map bindings; never writes MapMediaContent."""
import json
from pathlib import Path
R=Path(__file__).resolve().parents[2]
d=json.loads((R/'docs/research/vanilla-print-2026-09-19/catalogue.json').read_text(encoding='utf8'))
maps=[x for x in d['records'] if x.get('kind')=='annotated map']; prints=[x for x in d['records'] if x.get('kind')!='annotated map']
q=lambda x:json.dumps(x or '',ensure_ascii=False)
def st(a): return '{'+','.join('['+q(x)+']=true' for x in a)+'}'
def anchor(r):
 a=r.get('anchor') or [0,0]
 if r.get('anchor_usable') and abs(a[0])+abs(a[1])>20:return int(a[0]),int(a[1]),'source stash anchor'
 for s in r.get('stamps',[]):
  if s.get('symbol') and not str(s['symbol']).startswith('Arrow') and abs(s.get('x',0))+abs(s.get('y',0))>20:return int(s['x']),int(s['y']),'explicit map symbol; source candidate'
 return 0,0,'no valid source anchor'
L=['-- Generated from the vanilla-print survey; candidates await native validation.','local M={};local list,bindings,prints,printList={}, {}, {}, {}']
for p in prints:
 loc=','.join('{x=%d,y=%d}'%(int((z['x1']+z['x2'])/2),int((z['y1']+z['y2'])/2)) for z in p.get('locations',[]))
 L+=['prints['+q(p['id'])+']={id='+q(p['id'])+',title='+q(p.get('title') or p['id'])+',text='+q(p.get('text') or '')+',locations={'+loc+'}}', 'printList[#printList+1]='+q(p['id'])]
for r in maps:
 i=r['id'];x,y,source=anchor(r)
 if i=='LouisvilleStashMap15':x,y,source=12546,1393,'reviewed gallery map mark; native validation pending'
 if i=='EkronStashMap6':x,y,source=447,9791,'8B Hutchin’s Drive, Circuital Healing flyer; not a vanilla map mark'
 text=(r.get('text') or '').lower(); rooms,containers=(['police','office','storage'],['desk','filingcabinet','locker']) if ('police' in text or 'gun' in text) else (['office','livingroom','storage'],['desk','dresser','crate'])
 overlap=[p['id'] for p in prints if any(z['x1']<=x<=z['x2'] and z['y1']<=y<=z['y2'] for z in p.get('locations',[]))]
 label=("Circuital Healing, 8B Hutchin's Drive, Ekron" if i=='EkronStashMap6' else 'marked address in '+(r.get('region') or 'Knox'))
 if i=='LouisvilleStashMap15':
  label='Art Gallery of Louisville'; rooms=['police','policestorage','office','postoffice']; containers=['desk','filingcabinet','counter']
 b='{id=%s,label=%s,targets={{x=%d,y=%d}},localRooms=%s,localContainers=%s,destinationContainers=%s,destinationContainerOrder={"desk","filingcabinet","counter","crate","dresser","locker"},printIds={%s},sourceText=%s,anchorSource=%s,relatedDestination=%s,reviewStatus="source candidate; native validation pending"}'%(q(i),q(label),x,y,st(rooms),st(containers),st(['desk','filingcabinet','counter','crate','dresser','locker']),','.join(q(v) for v in overlap),q(r.get('text') or ''),q(source),'true' if i=='EkronStashMap6' else 'false')
 L+=['do local b='+b+';list[#list+1]=b.id;bindings[b.id]=b end']
L+=['M.list=list','M.printList=printList','function M.get(id)return bindings[id] end','function M.print(id)return prints[id] end','return M']
(R/'mod/common/media/lua/shared/ConspiracyFiles/MapMediaCatalogue.lua').write_text('\n'.join(L)+'\n',encoding='utf8')
