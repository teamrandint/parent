cd ../auditserver
docker build \
--build-arg auditaddr=172.20.0.3 \
--build-arg auditport=44455 \
-t teamrandint/auditserver . 

cd ../transaction-server
docker build \
--build-arg transaddr=172.20.0.6 \
--build-arg transport=44458 \
--build-arg dbaddr=172.20.0.4 \
--build-arg dbport=44457 \
--build-arg auditaddr=172.20.0.3 \
--build-arg auditport=44455 \
--build-arg quoteclientaddr=172.20.0.7 \
--build-arg quoteclientport=44459 \
-t teamrandint/transactionserver .

cd ../WebServer
docker build \
--build-arg webaddr=172.20.0.5 \
--build-arg webport=44456 \
--build-arg auditaddr=172.20.0.3 \
--build-arg auditport=44455 \
--build-arg transaddr=172.20.0.6 \
--build-arg transport=44458 \
-t teamrandint/webserver . 

cd ../database
docker build \
--build-arg dbaddr=172.20.0.4 \
--build-arg dbport=44457 \
-t teamrandint/database . 

cd ../quoteserver
docker build \
--build-arg quoteaddr=172.20.0.7 \
--build-arg quoteport=44459 \
--build-arg auditaddr=172.20.0.3 \
--build-arg auditport=44455 \
-t teamrandint/quoteserver .

cd ..
rm images.tar
docker save teamrandint/transactionserver teamrandint/database teamrandint/webserver teamrandint/auditserver > images.tar
