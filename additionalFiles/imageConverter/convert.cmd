docker build -f ../docker/Dockerfile-convert . -t whatsapp-convert
docker run --rm  --volume C:/IdeaProjects/whatsappstickereagle/images-original:/images/ whatsapp-convert sh -c "cd /images/cohh ;rm -rf converted; mkdir -p converted; for i in cohh*.png ; do convert -background none -resize 512x512 \"\$i\" \"converted/\${i%.*}.webp\" ; done"
