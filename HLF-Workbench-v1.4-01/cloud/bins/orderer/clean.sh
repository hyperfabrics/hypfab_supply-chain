# Copyright 2018 @ http://ACloudFan.com 
# Part of a online course. Please check it out at http://www.acloudfan.com

# Cleans up the ledger so as to get a clean restart of the orderer
killall orderer 2>/dev/null

rm -rf ./ledger 2> /dev/null
rm -f ./*log 2> /dev/null
fuser -n tcp -k 7050

docker kill $(docker ps -q)

docker rm $(docker ps -a -q)

echo "Done."