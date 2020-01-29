# App Logo
ANDROID_ASSETS_BASEDIR=../../../Android/app/src/main/assets
cd /projectDir/imageConverter/originalImages/sticker

for imageFile in $(find . \( ! -regex '\.' \) -type f -maxdepth 2 ); do
  convert -background none -resize 512x512 ${imageFile} "${ANDROID_ASSETS_BASEDIR}/${imageFile}"
done
