# Copyright 2018 @ http://ACloudFan.com 
# Part of a online course. Please check it out at http://www.acloudfan.com

# EDIT THIS To Control the Peer Setup
export ORDERER_ADDRESS=18.220.137.253:7050

export FABRIC_LOGGING_SPEC=info

export CORE_PEER_LOCALMSPID=DigibankMSP

export CORE_PEER_ID=digibank-peer1

export PEER_ORG=digibank
# Admin identity used for commands
export CORE_PEER_MSPCONFIGPATH=./fabric-ca/client/digibank/admin/msp