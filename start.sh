sudo docker network create net --driver bridge --subnet 172.20.0.0/16

sudo docker run -d -p 44457:44457 --name database --net net --ip 172.20.0.4 teamrandint/database 
sudo docker run -d -p 44455:44455 --name audit --net net --ip 172.20.0.3 teamrandint/auditserver 
sudo docker run -d -p 44458:44458 --name trans --net net --ip 172.20.0.6 teamrandint/transactionserver
sudo docker run -d -p 44456:44456 --name web --net net --ip 172.20.0.5 teamrandint/webserver
