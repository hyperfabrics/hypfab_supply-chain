# Copyright 2018 @ http://ACloudFan.com 
# Part of a online course. Please check it out at http://www.acloudfan.com

# Use this for testing your cloud setup *or* even local setup :)
# Example ./cc-test.sh  install  
function    usage {
    echo  "Usage: ./chain-test.sh    install | instantiate | invoke | query "
    echo  "Utility for testing peeer/channel setup with chaincode"
}

export FABRIC_LOGGING_SPEC=info  #debug  #info #warning
export FABRIC_CFG_PATH=$PWD/../

# Uses the core.yaml file in current folder - copy of core.yaml under cloud/bins/peer

OPERATION=$1

# Test Chaincode related properties
# Change these if you would like to try out your own chaincode
export CC_CONSTRUCTOR='{"Args":["instantiate"]}'
export CC_NAME="commercialpaper"
export CC_PATH="../../contract"
export CC_VERSION="1.0"
export CC_CHANNEL_ID="commercialpaperchannel"

if [ ! -z $ORDERER_ADDRESS ]; then
    echo "Using the Orderer=$ORDERER_ADDRESS"
else
echo "Setting the Orderer to localhost:7050"
    ORDERER_ADDRESS="localhost:7050"
fi

echo "CC Operation : $OPERATION    for   Org: $CURRENT_ORG_NAME"

# Invoke the "peer chain code" command using the operation
case $OPERATION in
    "install")   
              peer chaincode install  -n $CC_NAME -p $CC_PATH -v $CC_VERSION -l node

              peer chaincode list --installed -C $CC_CHANNEL_ID
        ;;
    "instantiate")
              peer chaincode instantiate -C $CC_CHANNEL_ID -n $CC_NAME  -v $CC_VERSION -c $CC_CONSTRUCTOR  -o $ORDERER_ADDRESS

              #peer chaincode list --instantiated -C commercialpaperchannel
        ;;
    "query")
            echo "Invoke issue transcation  from Magnetocorp"
            peer chaincode invoke -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["issue","Magnetocorp","001","05-04-2019","05-09-2019","5M"]}'
            echo "Invoke issue transcation  from Magnetocorp"
            peer chaincode invoke -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["issue","Magnetocorp","002","06-04-2019","10-10-2019","7M"]}'
            

            echo -n "Paper 001="
            peer chaincode query -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["PaperList.getPaper","001"]}'
            echo -n "Paper 002="
            peer chaincode query -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["PaperList.getPaper","002"]}'
        ;;
    
    "invoke")
            echo "Invoke buy transcation  from Magnetocorp=>Digibank"
            peer chaincode invoke -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["buy","Magnetocorp","001","Magnetocorp","Digibank", "4.5 Million", "07-05-2019"]}'

            echo "Invoke redeem transcation  from Magnetocorp"
            peer chaincode invoke -C $CC_CHANNEL_ID -n $CC_NAME  -c '{"Args":["redeem","Magnetocorp","002","Papernet","12-08-2019"]}'
        ;;
    "clear")
            echo "Cleaning up Chaincode Docker images"
            docker rmi -f $(docker images -q | grep dev-)
        ;;
    *) usage
        ;;
esac



