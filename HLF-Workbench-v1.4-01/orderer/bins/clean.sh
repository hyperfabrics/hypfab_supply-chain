# Copyright 2018 @ http://ACloudFan.com 
# Part of a online course. Please check it out at http://www.acloudfan.com

# Cleans up the orderer process
killall orderer 2> /dev/null

# Remove the ledger data from the local filesystem
rm -rf $PWD/../../ledger  2> /dev/null
# Remove the orderer log
rm $PWD/../orderer.log  2> /dev/null
# Remove the genesis & channel files
rm $PWD/../../artefacts/*  2> /dev/null

echo "Done."
echo "To Relaunch execute ./gen-config.sh and then ./launch-orderer.sh"
