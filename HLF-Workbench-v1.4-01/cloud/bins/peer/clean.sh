rm -rf ledger 

killalll peer 2>/dev/null 

fuser -n tcp -k 7050

fuser -n tcp -k 7051

fuser -n tcp -k 7052

fuser -n tcp -k 7053

fuser -n tcp -k 5984

rm ./*.log  2> /dev/null

docker kill $(docker ps -q)

docker rm $(docker ps -a -q)


echo "done"

