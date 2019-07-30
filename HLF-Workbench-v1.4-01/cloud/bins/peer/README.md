# File contains the IP_Addresses and the instructions to setup of network

notes.txt
==========

Papernet :
18.220.137.253

Digibank Peer:
18.191.153.20

Magnetocorp Peer:
18.219.76.190

#Fabric-CA:
#18.208.245.251


Setup:
Change the addresses in 

Cloud/configtx.yaml

Cloud/set-env.sh

Cloud/bins/Peer/set-env.sh


gen-gensis-channel-artifects.sh to generate genesis blocks

gen-crypto-identiies to generate peer tar files

NOTE: To check ports: sudo netstat -tulpn | grep LISTEN


Orderer Setup:

sudo apt update -y - Execute the command on the orderer instance 

sudo apt install libgrpc-dev -y 

Copy all the files to Orderer instance after generating the configtx and orderer genesis block 
// Better to clone the files from git repo to avoid '\r' errors

Untar identity generated files 

Download new fabric-samples binaries 

chmod 755 orderer

Copy fabric-samples/bin/orderer to /usr/local/bin

orderer version - To check if the orderer installed properly 

./launch-orderer.sh 

Check orderer log at ledger/orderer.log




Peer Setup:

NOTE: Change the ORG names in set-env.sh

sudo apt update -y -Execute the command on the peer instance 

sudo apt install libgrpc-dev -y

Copy all the files to peer instance after generating the commercial-paper-genesis.block

Untar identity generated files

chmod 755 *

Copy peer binary to /usr/local/bin

peer version -To check if the peer installed properly 

. set-env.sh  (Check the file properly)

sudo ./docker.sh

./create-commercial-paper-channel.sh  (Only to be executed only once only on one peer)

./launch-peer.sh

./join-channel.sh 


./chain-test.sh to test the channel


 



 

NOTE: To genrate tls certificates
mkdir -p tls

openssl req -new -newkey rsa:4096 -x509 -sha256 -days 1024 -nodes -out server.crt -keyout server.key

openssl req -x509 -new -nodes -key server.key -sha256 -days 1024 -out ca.crt

