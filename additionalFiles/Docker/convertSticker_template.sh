cd /images/cohhCollect
rm -rf converted
mkdir -p converted
for i in cohh*.png ; do convert -background none -resize 512x512 "$i" "converted/${i%.*}.webp" ; done

cd /images/cohhChat
rm -rf converted
mkdir -p converted
for i in cohh*.png ; do convert -background none -resize 512x512 "$i" "converted/${i%.*}.webp" ; done

cd /images/cohhSeason
rm -rf converted
mkdir -p converted
for i in cohh*.png ; do convert -background none -resize 512x512 "$i" "converted/${i%.*}.webp" ; done
