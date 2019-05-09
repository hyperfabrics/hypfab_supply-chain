# Copyright 2018 @ http://ACloudFan.com 
# Part of a online course. Please check it out at http://www.acloudfan.com

# Used for generation of he genesis block and the commercialpaper channel tx file
export FABRIC_CFG_PATH=$PWD/../../config

mkdir -p ../../artefacts

# Genesis block generation
configtxgen -profile CommercialPaperOrdererGenesis -outputBlock ../../artefacts/commercialpaper-genesis.block -channelID ordererchannel

# Commercial Paper channel creation
configtxgen -profile CommercialPaperChannel -outputCreateChannelTx ../../artefacts/commercialpaper-channel.tx -channelID commercialpaperchannel

