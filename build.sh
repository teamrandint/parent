go build -o ./bin/transaction_server /home/jarred/go/src/seng468/transaction-server/transaction_server.go
go build -o ./bin/WebServer /home/jarred/go/src/seng468/WebServer/WebServer.go
go build -o ./bin/WorkloadGen /home/jarred/go/src/seng468/WebServer/WorkloadGen/WorkloadGen.go


cd $GOPATH/src/seng468/auditserver
docker build -t teamrandint/auditserver . # builds image teamrandint/auditserver:latest

cd $GOPATH/src/seng468/transaction-server
docker build -t teamrandint/transactionserver . # builds image teamrandint/transactionserver:latest