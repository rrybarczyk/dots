mkdir ~/Dev
cd ~/Dev
git clone git@github.com:bitcoin/bitcoin.git
sudo apt install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3
sudo apt install -y libevent-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev
# SQLite is requited for descriptor wallet
sudo apt install -y libsqlite3-dev
# ZMQ dependencies (provides ZMQ API)
sudo apt -y install libzmq3-dev

./contrib/install_db4.sh `pwd`


../dist/configure --without-gui --prefix=$BDB_PREFIX
../dist/configure --enable-cxx --without-gui --with-pic --prefix=$BDB_PREFIX

