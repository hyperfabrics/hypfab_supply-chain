# EDIT THIS To Control the Peer Setup
export PEER_ORG=digibank

export ORDERER_ADDRESS=18.222.200.91:7050

export FABRIC_CFG_PATH=$PWD

export FABRIC_LOGGING_SPEC=info

export CORE_PEER_LOCALMSPID=DigibankMSP

export CORE_PEER_ID=digibank-peer1

# Admin identity used for commands
export CORE_PEER_MSPCONFIGPATH=./fabric-ca/client/digibank/admin/msp
