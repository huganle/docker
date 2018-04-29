#!/bin/bash -
#
# init script
#
# author: sunshx 2014-09-16
#
daemon(){
	"$@" &>/dev/null &
}

daemon rsyslogd 
daemon /usr/sbin/sshd -D
daemon socklog
daemon /bin/unsafessh serv

# mkdir /shared_data/db/
# mongod --fork --logpath=/var/log/mongod.log --dbpath=/shared_data/db/ --smallfiles --httpinterface --rest --storageEngine wiredTiger --wiredTigerJournalCompressor zlib --wiredTigerCollectionBlockCompressor zlib --wiredTigerIndexPrefixCompression true

export LD_LIBRARY_PATH=/usr/local/lib/

exec "$@"
