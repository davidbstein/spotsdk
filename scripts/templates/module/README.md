# Editable Module

this is a copy of a module. It contains at least the following folders:

- __`.original`__ - contains a copy of all original files and folders,
  except `bundle.js`. You should treat this as read only, as it will
  self-repair after some utilities execute.
  - __`src`__ - source files generated from `bundle.js`
- `src` - source files that will overwrite their original. see the 
  "editing src" section below.
- `build.bash` - executing this will build this module, creating a 
  new `.spa` file ready for loading into an OSX application tree.

It also contains the folder structure of the original module.

# Editing files:

## editing static files.

Refer to `.original` to see how the module was originally configured.
Any files you create in the main folder structure will be added to 
the one that is generated by `build.bash`. Files here will overwrite
original files with the same name and relative path.

## editing src

Source files are a little finiky. Each source file follows the naming
convention:

`<file_name>-<id>-<hash>.js`

The reason for this is beacuse of how `require` works in unbundled
code. Each file also conatins a JSON object in a comment block of the
form:

```
/*
{
  "id": <file_id>,
  "name": "<path>/<name>.js",
  "deps": {"REQUIRE_STRING": <reference_file_id>, ...},
  "entry": false, // only true if this is the ENTRY_POINT file
}
*/
```

This is important. `id` sets a unique ID for the file, and `deps` is the 
way that `require` works. In the exmaple above, `require(REQUIRE_STRING)` 
will return the `export` value of the file with ID `<reference_file_id>`.
Right now I make some assumtions about the positioning of newlines - if
I remember I will open an issue in the tracker to fix this.

The build system will overwrite anything with the same ID and HASH as a
file in `.original/src` with anything in `src` before building. The
build system will also throw an error if there are duplicate IDs that
do not have the same hash. It will also throw errors if a javascript 
file does not conform to the naming convention.

I recommend starting local ID space with a prefix (ie, start at 10001).