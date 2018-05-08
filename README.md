# spotsdk - build plugins for Spotify on OSX

This is a toolkit for building plugins for the Spotify app on OSX. It started as an attempt to make a generic "plugins for chromium apps" tool, but I scoped it down so I could do it in a single vacation. Spotify felt like a good motivating target.

Pull requests and bug reports extremely welcome.

# setup

## initial config

```bash
# load and unzip app
./scripts/setup.bash

# unbundle source code
./scripts/unbundle.bash

# create folders full of source code
./script/build_source_files.bash
```

## building a plugin

If you've downloaded a plugin (or want to use one of the ones in the `examples` folder), you'll need to generate a `spa` file and then 

```
## TODO: how to download and build a plugin
```

## Setting up a new plugin

A plugin modifies a single pane or feature of the app. You can look through the `.sources` file that was generated during setup to see the various modules available for you to modify.

```
# create a blank plugin in a given folder
./scripts/generate_editable_module.bash module_name.spa /path/to/target/folder
```

After creating your blank project look over the README in that folder for insturctions on editing, building, and publishing your plugin.

