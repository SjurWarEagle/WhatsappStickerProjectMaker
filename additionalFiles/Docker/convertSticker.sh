# App Logo
ANDROID_ASSETS_BASEDIR=../../../Android/app/src/main/assets
cd /projectDir/imageConverter/originalImages/sticker

# Delete previous generated Sticker
for imageFile in $(find . \( ! -regex '\.' \) -type d -maxdepth 1 ); do
  rm -rf "${ANDROID_ASSETS_BASEDIR}/$(basename ${imageFile})"/*
done

# Generate Normal Sticker
for imageFile in $(find . \( ! -regex '\.' \) \( ! -regex '.*tray_.*' \) -type f -maxdepth 2 ); do
  convert -background none -resize 512x512 ${imageFile} "${ANDROID_ASSETS_BASEDIR}/${imageFile%.*}.webp"
done

# Generate Tray Icon
for imageFile in $(find . -iname tray*png \( ! -regex '\.' \) -type f -maxdepth 2 ); do
  convert -background none -resize 96x96 ${imageFile} "${ANDROID_ASSETS_BASEDIR}/${imageFile}"
done
