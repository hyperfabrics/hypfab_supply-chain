# Copyright 2018 @ http://ACloudFan.com 
# Part of a online course. Please check it out at http://www.acloudfan.com

# Script for the generation of the 
# genesis block & create channel tx files
# Both files written under the artefacts subfolder


#1 Generate the Genesis block
export FABRIC_CFG_PATH=$PWD
GENESIS_FILE=./artefacts/commercialpaper-genesis.block
CHANNEL_NAME=ordererchannel
echo "====> Generating Genesis"
configtxgen -profile CommercialPaperOrdererGenesis -channelID $CHANNEL_NAME -outputBlock $GENESIS_FILE

#3 Generate the airline channel transaction file
CHANNEL_TX_FILE=./artefacts/commercialpaper-channel.tx
CHANNEL_NAME=commercialpaperchannel
echo "====> Generating Channel Tx"
configtxgen -profile CommercialPaperChannel -outputCreateChannelTx $CHANNEL_TX_FILE -channelID $CHANNEL_NAME


