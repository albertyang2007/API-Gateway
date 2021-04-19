#!/usr/bin/env bash
echo '===this command use docker pull to download image==='
echo '===this command should be run in docker env, parm is images.txt==='
echo '===usage: downloadAllImages.sh images.txt==='
imagesFile=$1

cat $imagesFile | while read line; do
  echo 'docker pull....'$line
  docker pull $line
  echo 'docker pull end'
done
