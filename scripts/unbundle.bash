SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "unbundle, $SCRIPT_DIR"

rm -rf $SCRIPT_DIR/.unbundled
mkdir $SCRIPT_DIR/.unbundled

