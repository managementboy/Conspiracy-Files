"""Read-only offline inventory. No game execution, downloads or installation edits."""
import argparse
import collections
import hashlib
import html
import json
from pathlib import Path
import re
import struct
import zipfile


def utf8_constants(data):
    count = struct.unpack_from('>H', data, 8)[0]
    offset, index, strings = 10, 1, []
    sizes = {3: 4, 4: 4, 5: 8, 6: 8, 7: 2, 8: 2, 9: 4, 10: 4,
             11: 4, 12: 4, 15: 3, 16: 2, 17: 4, 18: 4, 19: 2, 20: 2}
    while index < count:
        tag = data[offset]
        offset += 1
        if tag == 1:
            length = struct.unpack_from('>H', data, offset)[0]
            offset += 2
            strings.append(data[offset:offset + length].decode('utf-8', errors='replace'))
            offset += length
        else:
            offset += sizes[tag]
            if tag in (5, 6):
                index += 1
        index += 1
    return set(strings)


def uncomment(text):
    # Preserve quoted strings and line numbers while excluding Lua comments.
    pattern = r'"(?:\\.|[^"\\])*"|\x27(?:\\.|[^\x27\\])*\x27|--\[\[[\s\S]*?\]\]|--[^\n]*'
    return re.sub(pattern, lambda m: re.sub(r'[^\n]', ' ', m[0]) if m[0].startswith('--') else m[0], text)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--game', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    root, out = args.game, args.out
    out.mkdir(parents=True, exist_ok=True)
    sources = {}

    def read(relative):
        data = (root / relative).read_bytes()
        sources[relative] = hashlib.sha256(data).hexdigest()
        return data.decode('utf-8-sig')

    prefix = 'media/lua/shared/Translate/EN/'
    rendered = json.loads(read(prefix + 'Print_Media.json'))
    plain = json.loads(read(prefix + 'Print_Text.json'))
    stash_text = json.loads(read(prefix + 'Stash.json'))
    definitions = uncomment(read('media/lua/shared/PrintMedia/PrintMediaDefinitions.lua'))
    locations = {}
    for number, line in enumerate(definitions.splitlines(), 1):
        match = re.match(r'\s*(\w+)\s*=\s*\{\s*location', line)
        if match:
            rectangles = []
            for rectangle in re.findall(r'\{([^{}]*\bx1\s*=[^{}]*)\}', line):
                fields = dict((k, int(v)) for k, v in re.findall(r'\b([xy][12])\s*=\s*(-?\d+)', rectangle))
                assert set(fields) == {'x1', 'y1', 'x2', 'y2'}, rectangle
                rectangles.append(fields)
            locations[match[1].lower()] = {'rectangles': rectangles, 'line': number}
    titles = {k[len('Print_Media_'):-len('_title')]: v for k, v in rendered.items() if k.endswith('_title')}
    with zipfile.ZipFile(root / 'projectzomboid.jar') as jar:
        registries = {}
        for kind, class_name in [('brochure', 'Brochure'), ('flyer', 'Flier')]:
            path = 'zombie/scripting/objects/' + class_name + '.class'
            data = jar.read(path)
            sources['projectzomboid.jar!' + path] = hashlib.sha256(data).hexdigest()
            registries[kind] = utf8_constants(data)
    records, missing = [], []
    for media_id, title in titles.items():
        kind = next((k for k, constants in registries.items() if media_id in constants), None)
        if kind is None:
            if not re.search(r'_July\d+$', media_id):
                missing.append({'id': media_id, 'title': title, 'reason': 'Translation exists, absent from inspected flyer/brochure class constants'})
            continue
        layout = rendered.get('Print_Media_' + media_id + '_info', '')
        visual_text = [re.sub(r'\s+', ' ', s.replace('^', '\n')).strip()
                       for s in re.findall(r'<type:text\b[^>]*>([^<]*)', layout) if s.strip()]
        transcript = plain.get('Print_Text_' + media_id + '_info', '').replace('\\n', '\n')
        loc = locations.get(media_id.lower(), {})
        records.append({'id': media_id, 'kind': kind, 'title': title,
                        'text': transcript, 'layout_text': visual_text,
                        'textures': re.findall(r'texture:([^,>]+)', layout),
                        'locations': loc.get('rectangles', []), 'location_source_line': loc.get('line'),
                        'source': prefix + 'Print_Text.json', 'source_key': 'Print_Text_' + media_id + '_info'})
    for file in sorted((root / 'media/lua/shared/StashDescriptions').glob('*StashDesc.lua')):
        relative = file.relative_to(root).as_posix()
        data = uncomment(read(relative))
        starts = list(re.finditer(r'(?:local\s+)?stashMap\s*=\s*StashUtil\.newStash\("([^"]+)"\s*,\s*"([^"]+)"\s*,\s*"([^"]+)"\s*,\s*"([^"]+)"\)', data))
        for i, match in enumerate(starts):
            block = data[match.start():starts[i + 1].start() if i + 1 < len(starts) else len(data)]
            fields = {k: v.strip() for k, v in re.findall(r'stashMap\.(\w+)\s*=\s*([^;\n]+)', block)}
            stamps = []
            for stamp in re.finditer(r'stashMap:addStamp\(\s*(nil|"[^"]*")\s*,\s*(nil|"[^"]*")\s*,\s*(-?[\d.]+)\s*,\s*(-?[\d.]+)', block):
                key = stamp[2].strip('"') if stamp[2] != 'nil' else None
                stamps.append({'symbol': stamp[1].strip('"') if stamp[1] != 'nil' else None,
                               'key': key, 'text': stash_text.get(key) if key else None,
                               'x': float(stamp[3]), 'y': float(stamp[4])})
            records.append({'id': match[1], 'kind': 'annotated map', 'title': match[1],
                            'base_item': match[3], 'source': relative,
                            'source_line': data[:match.start()].count('\n') + 1,
                            'region_source': file.stem.replace('StashDesc', ''), 'fields': fields,
                            'text': '\n'.join(s['text'] or '[MISSING ' + str(s['key']) + ']' for s in stamps if s['key']),
                            'stamps': stamps})
    for relative in ['media/lua/shared/StashDescriptions/StashUtil.lua',
                     'media/lua/client/PZAPI/ui/organisms/PrintMedia.lua',
                     'media/lua/server/Items/Distribution_DeskJunk.lua',
                     'media/lua/server/Items/Distribution_ClosetJunk.lua',
                     'media/lua/server/Items/Distribution_BinJunk.lua',
                     'media/scripts/generated/items/literature.txt']:
        read(relative)
    map_script = uncomment(read('media/scripts/generated/items/map.txt'))
    map_ui = uncomment(read('media/lua/client/ISUI/Maps/ISMapDefinitions.lua'))
    map_bounds = {}
    for m in re.finditer(r'LootMaps\.Init\.(\w+)\s*=\s*function\(mapUI\)([\s\S]*?)\nend', map_ui):
        b = re.search(r'setBoundsInSquares\((\d+),\s*(\d+),\s*(\d+),\s*(\d+)\)', m[2])
        if b:
            map_bounds[m[1]] = list(map(int, b.groups()))
        else:
            grid = re.search(r'lvGridX1\((\d)\), lvGridY1\((\d)\)', m[2])
            if grid:
                col, row = map(int, grid.groups())
                map_bounds[m[1]] = [11700 + 900*col, 750 + 900*row, 12899 + 900*col, 2099 + 900*row]
    ordinary = [{'id': name, 'bounds': map_bounds.get(name), 'category': 'Navigation / base map',
                 'text_status': 'Town badge/legend and cartography; no separate narrative annotation in item definition'}
                for name in re.findall(r'\bitem\s+(\w+)', map_script)]
    for record in records:
        if record['kind'] == 'annotated map':
            record['map_view_bounds'] = map_bounds.get(record['id'])
    assert len({r['id'] for r in records}) == len(records), 'Duplicate media IDs'
    assert all(s['text'] is not None for r in records for s in r.get('stamps', []) if s['key']), 'Missing map translation'
    result = {'game_root': str(root), 'sources_sha256': sources, 'records': records,
              'ordinary_map_items': ordinary,
              'unregistered_print_translations': missing,
              'counts': dict(collections.Counter(r['kind'] for r in records))}
    (out / 'catalogue.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n', encoding='utf-8', newline='\n')
    lines = ['# Offline vanilla print inventory', '', 'Source extraction; classification and interpretation are a separate review.', '']
    for r in records:
        lines += ['## ' + r['id'] + ' — ' + r['title'], '', '**Type:** ' + r['kind'], '']
        if r['kind'] == 'annotated map':
            lines += ['**Region source:** ' + r['region_source'], '', '**World setup:** `' + json.dumps(r['fields']) + '`', '',
                      '**Marks:** `' + json.dumps([{k:v for k,v in s.items() if k != 'text'} for s in r['stamps']]) + '`', '']
        else:
            lines += ['**Destination rectangles:** `' + json.dumps(r['locations']) + '`' if r['locations'] else '**Destination:** no rectangle in the inspected print-media definitions.', '']
        lines += ['**Source:** `' + r['source'] + '` ' + str(r.get('source_line', r.get('source_key', ''))), '', r['text'] or '[No plain transcript]', '']
        if r.get('layout_text'):
            lines += ['**Text extracted from visual layout (cross-check):**', '', ' / '.join(r['layout_text']), '']
    (out / 'transcripts.md').write_text('\n'.join(line.rstrip() for line in '\n'.join(lines).splitlines())+'\n', encoding='utf-8', newline='\n')
    print(json.dumps({'counts': result['counts'], 'no_print_location': [r['id'] for r in records if r['kind'] != 'annotated map' and not r['locations']],
                      'no_plain_text': [r['id'] for r in records if not r['text']], 'unregistered': missing}, indent=2))


if __name__ == '__main__':
    main()
