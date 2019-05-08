# Copyright 2018 @ http://ACloudFan.com 
# Part of a online course. Please check it out at http://www.acloudfan.com

# Gives a clean start to 3 peers
# Execute orderer/bins/clean-launch-orderer.sh before this script

# Clean peers
echo "++++++ Cleaning the previous run"
./clean.sh

# As Digibank admin create the channel by submitting the transaction
echo "+++++ Creating the application channel = commercialpaperchannel"
. set-env.sh  digibank  7050   admin
./create-channel.sh

# Give some time for the transaction to go through
echo "++++ Sleeping for 3 seconds"
sleep 3s

# Launch the digibank-peer1
echo "+++ digibank-peer1 Launching & Joining commercialpaperchannel - will sleep for 3 seconds"
. set-env.sh  digibank  8050   admin
./launch-peer.sh digibank  8050   digibank-peer1
sleep 3s
./join-channel.sh

# Launch the digibank-peer2
echo "++ digibank-peer2 Launching & Joining commercialpaperchannel - will sleep for 3 seconds"
. set-env.sh  digibank  8052   admin
./launch-peer.sh digibank  8052   digibank-peer2
sleep 3s
./join-channel.sh

# Launch the magnetocorp-peer1
echo "+ magnetocorp-peer1 Launching & Joining commercialpaperchannel - will sleep for 3 seconds"
. set-env.sh  magnetocorp  9050   admin
./launch-peer.sh magnetocorp  9050   magnetocorp-peer1
sleep 3s
./join-channel.sh

echo "Done. All 3 peers launched in background. Please check peer logs at /peers"
