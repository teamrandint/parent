sudo docker network create net
sudo docker run -d -p --name database --net=net teamrandint/database 
sudo docker run -d -p --name audit --net=net teamrandint/auditserver 
sudo docker run -d -p --name trans --net=net teamrandint/transactionserver
sudo docker run -d -p --name web --net=net teamrandint/webserver
