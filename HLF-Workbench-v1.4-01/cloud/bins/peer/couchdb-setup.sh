sudo apt install apache2 -y

sudo ufw allow 'Apache'

echo "deb https://apache.bintray.com/couchdb-deb {xenial} main" \
    | sudo tee -a /etc/apt/sources.list


curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc \
    | sudo apt-key add -

 sudo apt-get update && sudo apt-get install couchdb -y

 sudo apt install erlang -y

 sudo apt install libicu-dev -y 

 sudo apt install libmozjs-24-0v5 libmozjs-24-bin  -y

 sudo apt install openssl -y

 sudo apt install help2man -y 

 sudo apt install python -y 
 sleep 2

 sudo apt install python-pip -y

 pip install Sphinx

 sudo apt-get --no-install-recommends -y install \
    build-essential pkg-config erlang \
    libicu-dev libmozjs185-dev libcurl4-openssl-dev

sleep 2

source  ./configure

make release ERL_CFLAGS="-I/usr/local/include/js -I/usr/local/lib/erlang/usr/include"



