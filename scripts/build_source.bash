SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -rf $SCRIPT_DIR/../.src_dirs
mkdir $SCRIPT_DIR/../.src_dirs

for module in $SCRIPT_DIR/../.SpotifyModified.app/Contents/Resources/Apps/*;
do
  pipenv run python $SCRIPT_DIR/../.unbundled/module/unbundled.json
done;