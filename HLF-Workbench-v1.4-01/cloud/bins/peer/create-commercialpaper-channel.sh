# Create the commercialpaper channel
# Orderer Address env variable is getting set in the set-env.sh
source  ./set-env.sh
export CHANNEL_TX_FILE=./commercialpaper-channel.tx

# Execute the channel create command
peer channel create -o $ORDERER_ADDRESS -c commercialpaperchannel -f $CHANNEL_TX_FILE
