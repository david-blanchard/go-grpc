cd orders
grpcurl -d '{  "userId": "user_123",  "items": [{"productId": "product_1", "quantity": 2}, {"productId": "product_2", "quantity": 1}]}' -plaintext localhost:50052 orders.OrderService/PlaceOrder