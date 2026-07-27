import json, pathlib, sys
root=pathlib.Path(__file__).parent
structure=json.loads((root/'structure.json').read_text())
count=0
for item in structure['items']:
 p=root/item['path']; idx=json.loads((p/'index.json').read_text())
 assert (p/idx['details']['intro']['text']).exists()
 for st in idx['details']['steps']:
  assert (p/st['text']).exists(); assert (p/st['verify']).exists(); count+=1
 assert (p/idx['details']['finish']['text']).exists()
print(f'OK: {len(structure["items"])} scenarios, {count} tasks')
