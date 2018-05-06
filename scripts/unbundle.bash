#############################################
# STUPID ECMA VERSION UPGRADER
#
# I've submitted a pull request to browser-unpack
# that resolves this that can be checked at:
# https://github.com/substack/browser-unpack/pull/19
echo "TODO: automate this and remove the prompt"
read -p "
you must have gone to node_modules/browser-unpack/index.html and change ecmaVersion to 8. Continue (Y/n)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Nn]$ ]]
then
  exit 1
fi
###############################################



SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/color_functions.bash

rm -rf $SCRIPT_DIR/../.unbundled
mkdir $SCRIPT_DIR/../.unbundled

for module_path in $SCRIPT_DIR/../.SpotifyModified.app/Contents/Resources/Apps/*;
do
  module=$(echo $module_path | tr "/" "\n" | tail -n1)
  echo_lightblue "unbundling $module"
  rm -rf $SCRIPT_DIR/../.unbundled/$module
  cp -r $SCRIPT_DIR/../.unzipped_raw/$module $SCRIPT_DIR/../.unbundled/$module
  cd $SCRIPT_DIR/../.unbundled/$module
  #$SCRIPT_DIR/../node_modules/browser-unpack/bin/cmd.js < bundle.js > unbundled.json
  npx browser-unpack < bundle.js > unbundled.json
  cd -
done;
