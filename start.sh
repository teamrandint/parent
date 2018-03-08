sudo docker run -d -p 44457:44457 --name database --net net teamrandint/database 
sudo docker run -d -p 44455:44455 --name audit --net net teamrandint/auditserver 
sudo docker run -d -p 44458:44458 --name trans --net net teamrandint/transactionserver
sudo docker run -d -p 44456:44456 --name web --net net teamrandint/webserver
