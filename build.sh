cd $GOPATH/src/seng468/auditserver
docker build \
--build-arg auditaddr=localhost \
--build-arg auditport=44455 \
-t teamrandint/auditserver . 

cd $GOPATH/src/seng468/transaction-server
docker build \
--build-arg transaddr=localhost \
--build-arg transport=44458 \
--build-arg dbaddr=localhost \
--build-arg dbport=44457 \
--build-arg auditaddr=localhost \
--build-arg auditport=44455 \
-t teamrandint/transactionserver .

cd $GOPATH/src/seng468/WebServer
docker build \
--build-arg webaddr=localhost \
--build-arg webport=44456 \
--build-arg auditaddr=localhost \
--build-arg auditport=44455 \
--build-arg transaddr=localhost \
--build-arg transport=44458 \
-t teamrandint/webserver . 

cd $GOPATH/src/seng468/database
docker build \
--build-arg dbaddr=localhost \
--build-arg dbport=44457 \
-t teamrandint/database . 

docker save teamrandint/transactionserver teamrandint/database teamrandint/webserver teamrandint/auditserver > images.tar