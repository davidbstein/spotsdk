# Generates a "module" folder - which is the base for building an extension
MODULE=$1
TARGET="$(pwd)/$2"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/color_functions.bash
pushd .

cp -r $SCRIPT_DIR/templates/module $TARGET/$MODULE
cd $TARGET/$MODULE

for subdir in $(find $SCRIPT_DIR/../.unbundled/$MODULE -type d | \
                xargs python -c "import sys; print('\n'.join([a[len(sys.argv[1])+1:] for a in sys.argv[2:]]))")
do
  mkdir -p $subdir
done

mkdir src
cp -r $SCRIPT_DIR/../.unzipped_raw/$MODULE .original
rm .original/bundle.js
cp -r $SCRIPT_DIR/../.sources/$MODULE/src .original/src

popd