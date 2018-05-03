read -p "
This is a destructive operation if you already have a
.SpotifyModified.app in this directory. Continue (Y/n)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Nn]$ ]]
then
  exit 1
fi

echo "
copying Spotify.app into local directory as .SpotifyModified.app"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
rm -rf $DIR/../.SpotifyModified.app
cp -r /Applications/Spotify.app $DIR/../.SpotifyModified.app


echo "wiping .unzipped_raw"

pushd . > /dev/null
cd $DIR/..
rm -rf .unzipped_raw
mkdir .unzipped_raw
cd .unzipped_raw

echo "making a copy of the raw source in .unzipped_raw"

for rawfn in $DIR/../.SpotifyModified.app/Contents/Resources/Apps/*;
do
  fn=$(echo $rawfn | tr "/" "\n" | tail -n1)
  mkdir ${fn}
  cd ${fn}
  yes | unzip -a -q $rawfn
  cd $DIR/../.unzipped_raw
done

