SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "unbundle, $SCRIPT_DIR"

rm -rf $SCRIPT_DIR/../.unbundled
mkdir $SCRIPT_DIR/../.unbundled

for module in $SCRIPT_DIR/../.SpotifyModified.app/Contents/Resources/Apps/*;
do
  pipenv run python $SCRIPT_DIR/../.unbundled/module/unbundled.json
done;