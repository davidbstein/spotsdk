read -p "
This is a destructive operation if you already have a
.SpotifyModified.app in this directory. Continue (Y/n)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Nn]$ ]]
then
  exit 1
fi

echo "
copying Spotify.app into local directory as .SpotifyModified.app
"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
rm -rf $DIR/../.SpotifyModified.app
cp -r /Applications/Spotify.app $SCRIPT_DIR/../.SpotifyModified.app

echo "
wiping .unzipped_raw
"

rm -rf $SCRIPT_DIR/../.unzipped_raw
mkdir $SCRIPT_DIR/../.unzipped_raw

echo "
making a copy of the raw source in .unzipped_raw
"

for rawfn in $SCRIPT_DIR/../.SpotifyModified.app/Contents/Resources/Apps/*;
do
  cd $SCRIPT_DIR/../.unzipped_raw
  fn=$(echo $rawfn | tr "/" "\n" | tail -n1)
  mkdir ${fn}
  cd ${fn}
  yes | unzip -a -q $rawfn
  cd $SCRIPT_DIR/..
done

echo "
unbundling all subcomponents
"

./scripts/unbundle.bash

echo "
creating src folders
"

./scripts/build_source.bash

