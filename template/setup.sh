cd "$(dirname "$0")"
cd ./

set -eu

if [ $# -ne 1 ]; then
	exit 1
fi

mkdir ../$1

cp ./index.html ../$1/index.html
cp ./main.js ../$1/main.js
cp ./thumbnail.png ../$1/thumbnail.png
cp ./thumbnail@2x.png ../$1/thumbnail@2x.png
cp ./entitlements.plist ../$1/entitlements.plist

sed -e "s/SCREENSAVER_NAME=\"WKWebViewScreenSaver\"/SCREENSAVER_NAME=\"$1\"/" ./_build.sh >> ../$1/build.sh
sed -e "s/SCREENSAVER_NAME/$1/g" ./WKWebViewScreenSaverView.mm >> ../$1/$1.mm
sed -e "s/SCREENSAVER_NAME/$1/g" ./Info.plist >> ../$1/Info.plist

echo $1