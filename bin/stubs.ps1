cd protos

protoc --go_out=./golang/orders --go_opt=paths=source_relative --go-grpc_out=./golang/orders --go-grpc_opt=paths=source_relative ./order.proto
protoc --go_out=./golang/payments --go_opt=paths=source_relative --go-grpc_out=./golang/payments --go-grpc_opt=paths=source_relative ./payment.proto
protoc --go_out=./golang/discounts --go_opt=paths=source_relative --go-grpc_out=./golang/discounts --go-grpc_opt=paths=source_relative ./discount.proto