SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "build source, $SCRIPT_DIR"

rm -rf $SCRIPT_DIR/../.unbundled
mkdir $SCRIPT_DIR/../.unbundled

for module_path in $SCRIPT_DIR/../.SpotifyModified.app/Contents/Resources/Apps/*;
do
  module=$(echo $module_path | tr "/" "\n" | tail -n1)
  echo $SCRIPT_DIR/../.unbundled/$module/unbundled.json
  #pipenv run python $SCRIPT_DIR/../.unbundled/$module/unbundled.json
  exit
done;