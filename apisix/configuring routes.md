curl -i "http://127.0.0.1:9180/apisix/admin/routes" -X PUT -d '
{
  "id": "consumerlogin",
  "uri": "/consumerlogin",
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "https://camltest.azurewebsites.net/camluam/api/v1/auth/eNairaConsumerLogin": 1
    }
  }
}'