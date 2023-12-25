cd "$(dirname "$0")"
cd ./

set -eu

SCREENSAVER_NAME="WKWebViewScreenSaver"
echo ${SCREENSAVER_NAME}

rm -r -f ${SCREENSAVER_NAME}.saver
mkdir -p ${SCREENSAVER_NAME}.saver/Contents/{MacOS,Resources}
cp ./Info.plist ./${SCREENSAVER_NAME}.saver/Contents/

clang++ -std=c++20 -Wc++20-extensions -bundle -fobjc-arc -O3 -framework Cocoa -framework ScreenSaver -framework Webkit ./${SCREENSAVER_NAME}.mm -o ./${SCREENSAVER_NAME}.saver/Contents/MacOS/${SCREENSAVER_NAME}

codesign --force --options runtime --deep --entitlements "./entitlements.plist" --sign "Developer ID Application" --timestamp --verbose ${SCREENSAVER_NAME}.saver

cp ./thumbnail@2x.png ./${SCREENSAVER_NAME}.saver/Contents/Resources/
cp ./thumbnail.png ./${SCREENSAVER_NAME}.saver/Contents/Resources/
cp ./index.html ./${SCREENSAVER_NAME}.saver/Contents/Resources/
cp ./main.js ./${SCREENSAVER_NAME}.saver/Contents/Resources/

echo "** BUILD SUCCEEDED **"