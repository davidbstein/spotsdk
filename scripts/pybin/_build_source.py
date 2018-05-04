import json
import hashlib

def derive_name(refs):
  return "script"

class FileList():
# id, source, deps, entry
  def __init__(self, path):
    with open(path) as f:
      file_list_raw = json.loads(f.read())
    self.file_list = {f['id']: f for f in to_ret}
    self._add_refs()
    self._name_files()

  def _add_refs(self):
    for f_id, f in self.file_list.items():
      f['refs'] = {}
    for f_id, f in self.file_list.items():
      for dep_path, dep_id in f['deps']:
        file_list[dep_id]['refs'][f_id] = dep_path

  def _name_files(self):
    for f_id, f in self.file_list.items():
      name = derive_name(f['refs'])
      md5 = haslib.md5()
      md5.update(f['source'])
      hash = md5.hexdigest()[-5:]
      f['name'] = "{id}-{name}-{hash}.js".format(
        id=f_id, hash=hash, name=name
      )

  def create_files(file_list):
    raise NotImplemented()
