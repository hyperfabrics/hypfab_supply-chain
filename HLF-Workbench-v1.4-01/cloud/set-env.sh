# Copyright 2018 @ http://ACloudFan.com 
# Part of a online course. Please check it out at http://www.acloudfan.com

# This sets the environment for accessing the cloud

# Make sure that IP Addresses are setup properly
# Use PUBLIC IP Here


export ORDERER_ADDRESS=18.220.137.253:7050
export DIGIBANK_EP=18.191.153.20:7051
export MAGNETOCORP_EP=18.219.76.190:7051

export CA_IP=54.173.103.244
export CA_URL=http://$CA_IP:7054


export FABRIC_LOGGING_SPEC=info

function    usage {
    echo  "Usage: . ./set-env.sh    ORG_NAME"
    echo  "Sets the environment for the specific org"
}

export CURRENT_ORG_NAME=$1

echo "Setting environment for $CURRENT_ORG_NAME"

# Set environment variables based on the ORG_Name
case $CURRENT_ORG_NAME in
    "digibank")   export CORE_PEER_MSPCONFIGPATH=./fabric-ca/client/digibank/admin/msp
              export CORE_PEER_ADDRESS=$DIGIBANK_EP
              export CORE_PEER_LOCALMSPID=DigibankMSP
        ;;
    "magnetocorp") export CORE_PEER_MSPCONFIGPATH=./fabric-ca/client/magnetocorp/admin/msp
              export CORE_PEER_ADDRESS=$MAGNETOCORP_EP
              export CORE_PEER_LOCALMSPID=MagnetocorpMSP
        ;;

    *) usage
esac