#  Launches the orderer
#  You may override orderer properties in this file

# Change the logging leve to the desired level

export  FABRIC_LOGGING_SPEC=info

export FABRIC_CFG_PATH=$PWD

mkdir -p ledger 

orderer 2> ./ledger/orderer.log  &
