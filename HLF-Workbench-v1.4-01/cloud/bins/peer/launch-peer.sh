# Initialize the environment variables ORDERER_ADDRESS & MSP ID
source ./set-env.sh

# Peer Need to be launched under its own Identity
export CORE_PEER_MSPCONFIGPATH=./fabric-ca/client/$PEER_ORG/$CORE_PEER_ID/msp


mkdir -p ./ledger

peer node start 2>./ledger/$CORE_PEER_ID.log  &
