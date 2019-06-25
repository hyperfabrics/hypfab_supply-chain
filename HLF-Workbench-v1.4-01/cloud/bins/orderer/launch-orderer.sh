#  Launches the orderer
#  You may override orderer properties in this file

# Change the logging leve to the desired level

export  FABRIC_LOGGING_SPEC=info
export  FABRIC_LOGGING_FORMAT= "%{color}%{time:2006-01-02 15:04:05.000 MST} [%{module}] %{shortfunc} -> %{level:.4s} %{id:03x}%{color:reset} %{message}"

export FABRIC_CFG_PATH=$PWD

mkdir -p ledger 

orderer 2> ./ledger/orderer.log  &
