1. Create a route

curl -i "http://127.0.0.1:9180/apisix/admin/routes" -X PUT -d '
{
  "id": "enaira-camltest",
  "uri": "/camltest",
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "https://camltest.azurewebsites.net/camluam/api/v1/auth/eNairaConsumerLogin": 1
    }
  }
}'

2. Validate route

curl "http://127.0.0.1:9080/camltest"



3. Configure tnx and charges

curl -i "http://127.0.0.1:9180/apisix/admin/routes" -X PUT -d '
{
  "id": "tnx-and-charges",
  "uri": "/tnxandcharges",
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "https://camltest.azurewebsites.net/tnxandcharges/api/v1/pay-from-consumer-wallet": 1
    }
  }
}'

4. Validate route

curl "http://127.0.0.1:9080/tnxandcharges"


4. Integrate Service using Upstream

curl "http://127.0.0.1:9180/apisix/admin/routes/1" -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -X PUT -d '
{
  "methods": ["POST"],
  "host": "camltest.azurewebsites.net",
  "uri": "/camluam/api/v1/auth/eNairaConsumerLogin",
  "upstream_id": "1"
}'


curl "http://127.0.0.1:9180/apisix/admin/routes/1" \
-H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -X PUT -d '
{
  "methods": ["POST"],
  "host": "camltest.azurewebsites.net/camluam/api/v1/auth/eNairaConsumerLogin",
  "uri": "/post/*",
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "httpbin.org:80": 1
    }
  }
}'


curl -i -X POST "http://127.0.0.1:9080/camluam/api/v1/auth/eNairaConsumerLogin?userid=testuser@gmail.com&password=123456789123" -H "Host: camltest.azurewebsites.net"