#!/bin/bash

#put some file to rawData folder for testing.

starttimeTotal=`date +'%Y-%m-%d %H:%M:%S'`
starttime=`date +'%Y-%m-%d %H:%M:%S'`

grep -iR "java" ./ | wc -l

endtime=`date +'%Y-%m-%d %H:%M:%S'`
start_seconds=$(date --date="$starttime" +%s);
end_seconds=$(date --date="$endtime" +%s);
echo "grep time: "$((end_seconds-start_seconds))"s"



starttime=`date +'%Y-%m-%d %H:%M:%S'`

tar -zcvf rawData.tar ./rawData/ > test.log

endtime=`date +'%Y-%m-%d %H:%M:%S'`
start_seconds=$(date --date="$starttime" +%s);
end_seconds=$(date --date="$endtime" +%s);
echo "tar create time: "$((end_seconds-start_seconds))"s"


starttime=`date +'%Y-%m-%d %H:%M:%S'`

rm -r ./rawData/

endtime=`date +'%Y-%m-%d %H:%M:%S'`
start_seconds=$(date --date="$starttime" +%s);
end_seconds=$(date --date="$endtime" +%s);
echo "delete time: "$((end_seconds-start_seconds))"s"


starttime=`date +'%Y-%m-%d %H:%M:%S'`

tar -zxvf rawData.tar ./rawData/ > test.log
rm rawData.tar

endtime=`date +'%Y-%m-%d %H:%M:%S'`
start_seconds=$(date --date="$starttime" +%s);
end_seconds=$(date --date="$endtime" +%s);
echo "tar unzip time: "$((end_seconds-start_seconds))"s"


start_seconds=$(date --date="$starttimeTotal" +%s);
end_seconds=$(date --date="$endtime" +%s);
echo "total time: "$((end_seconds-start_seconds))"s"

