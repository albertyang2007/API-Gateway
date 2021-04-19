#!/usr/bin/env bash
echo '===show all image and tag in k8s namespace==='
echo '===this command should be run in k8s kubectl, parms is namespace==='
echo '===usage showAllImage.sh namespace'

namespace=$1

images=$(kubectl get pods -n $namespace -o jsonpath="{..image}" |tr -s '[[:space:]]' '\n' |sort |uniq)
imageArr=($images)
echo '' > images.txt

for a in "${imageArr[@]}";
do
  echo "$a" >> images.txt;
done

echo 'all images in namespace '$namespace' had been save to images.txt'
