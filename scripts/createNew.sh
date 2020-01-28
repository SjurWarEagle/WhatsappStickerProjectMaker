#!/bin/sh
# Configuration
PROJECTNAME=Experiments
APPLICATIONID1="de"
APPLICATIONID2="tkunkel"
APPLICATIONID3="experiments"
APPLICATIONID="${APPLICATIONID1}.${APPLICATIONID2}.${APPLICATIONID3}"
USE_IOS=no
USE_ANDROID=yes

# Logic
echo "Creating $PROJECTNAME"
rm -rf ../tmp
mkdir -p ../tmp
cd ../tmp
rm -rf *
mkdir -p original
cd original
git clone https://github.com/WhatsApp/stickers

if [ $USE_ANDROID = "yes" ]; then
    echo "Need Android"
  else
    echo "Not using iOS, deleting it"
    rm -rf stickers/Android
fi

if [ $USE_IOS = "yes" ]; then
    echo "Need iOS"
  else
    echo "Not using iOS, deleting it"
    rm -rf stickers/iOS
fi
# Some cleanup
rm -rf stickers/.github
rm -rf stickers/.git
rm -rf stickers/README.md
rm -rf stickers/CONTRIBUTING.md
rm -rf stickers/CODE_OF_CONDUCT.md

# make this our new project
mv stickers $PROJECTNAME
cd $PROJECTNAME

echo "replacing com.example.samplestickerapp with $APPLICATIONID"
find ./ -type f -exec sed -i "s/com.example.samplestickerapp/${APPLICATIONID}/g" {} \;
mv Android/app/src/main/java/com Android/app/src/main/java/$APPLICATIONID1
mv Android/app/src/main/java/$APPLICATIONID1/example Android/app/src/main/java/$APPLICATIONID1/$APPLICATIONID2
mv Android/app/src/main/java/$APPLICATIONID1/$APPLICATIONID2/samplestickerapp Android/app/src/main/java/$APPLICATIONID1/$APPLICATIONID2/$APPLICATIONID3

# Copy Additional Files
echo 'Copy Additional Files'
cp -r ../../../additionalFiles/Docker .
cp -r ../../../additionalFiles/imageConverter .
cp -r ../../../additionalFiles/Jenkins .
find ./Jenkins -type f -exec sed -i "s/WhatsApp-Sticker-XXX/WhatsApp-Sticker-${APPLICATIONID3}/g" {} \;
find ./Jenkins -type f -exec sed -i "s/__IDENTIFIER__/${APPLICATIONID3}/g" {} \;
cp -r ../../../additionalFiles/tools .
cp -r ../../../additionalFiles/buildprocess/* .
find ./Android -type f -exec sed -i "s/THENAME_/${APPLICATIONID3}_/g" {} \;
find ./Android -type f -exec sed -i "s/com.example.samplestickerapp/${APPLICATIONID}/g" {} \;
