cd $GOPATH/src/seng468/auditserver
docker build \
--build-arg auditaddr=172.20.0.3 \
--build-arg auditport=44455 \
-t teamrandint/auditserver . 

cd $GOPATH/src/seng468/transaction-server
docker build \
--build-arg transaddr=172.20.0.6 \
--build-arg transport=44458 \
--build-arg dbaddr=172.20.0.4 \
--build-arg dbport=44457 \
--build-arg auditaddr=172.20.0.3 \
--build-arg auditport=44455 \
-t teamrandint/transactionserver .

cd $GOPATH/src/seng468/WebServer
docker build \
--build-arg webaddr=172.20.0.5 \
--build-arg webport=44456 \
--build-arg auditaddr=172.20.0.3 \
--build-arg auditport=44455 \
--build-arg transaddr=172.20.0.6 \
--build-arg transport=44458 \
-t teamrandint/webserver . 

cd $GOPATH/src/seng468/database
docker build \
--build-arg dbaddr=172.20.0.4 \
--build-arg dbport=44457 \
-t teamrandint/database . 

docker save teamrandint/transactionserver teamrandint/database teamrandint/webserver teamrandint/auditserver > images.tar