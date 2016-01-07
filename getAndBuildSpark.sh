#!/bin/bash 

echo $HTTP_PROXY
if [ ! -f spark-1.5.1.tgz ]; then
	wget -O spark-1.5.1.tgz http://d3kbcqa49mib13.cloudfront.net/spark-1.5.1.tgz
fi

if [ -f spark-1.5.1.tgz ]; then
	tar zxf spark-1.5.1.tgz
	pushd spark-1.5.1
	./make-distribution.sh --name with-hive --tgz -Phadoop-2.6 -Phive -Phive-thriftserver -Pyarn
	mv spark-1.5.1-bin-with-hive.tgz $(dirs +1)
	popd
else 
   	exit 1;
fi 

exit 0;
