#!/usr/bin/env bash
echo '===this command is to tag the docker image to a private registry==='
echo '===this command should be run in docker env, parm is images.txt==='
echo '===usage: downloadAllImages.sh images.txt==='
imagesFile=$1

cat $imagesFile | while read line;
do
  arr=(${line//\// })
  str='eyaweiw.cn:5000'
  for((i=1;i<${#arr[@]};i++))
  do
    str+=/"${arr[$i]}"
  done
  echo 'docker tag '$line $str
  docker tag $line $str
done
