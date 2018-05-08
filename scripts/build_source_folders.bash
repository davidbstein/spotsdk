SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "build source, $SCRIPT_DIR"

rm -rf $SCRIPT_DIR/../.sources
mkdir $SCRIPT_DIR/../.sources

for module_path in $SCRIPT_DIR/../.SpotifyModified.app/Contents/Resources/Apps/*;
do
  module=$(echo $module_path | tr "/" "\n" | tail -n1)
  rm -rf $SCRIPT_DIR/../.sources/$module
  mkdir $SCRIPT_DIR/../.sources/$module
  cd $SCRIPT_DIR/../.sources/$module
  for subdir in $(find $SCRIPT_DIR/../.unbundled/$module -type d | \
                xargs python -c "import sys; print('\n'.join([a[len(sys.argv[1])+1:] for a in sys.argv[2:]]))")
  do
    mkdir $SCRIPT_DIR/../.sources/$module/$subdir
  done
  mkdir $SCRIPT_DIR/../.sources/$module/src
  echo $SCRIPT_DIR/../.unbundled/$module/unbundled.json
  pipenv run python \
      $SCRIPT_DIR/pybin/_build_source.py \
      $SCRIPT_DIR/../.unbundled/$module/unbundled.json \
      $SCRIPT_DIR/../.sources/$module/src
  cd $SCRIPT_DIR/..
  exit
done;