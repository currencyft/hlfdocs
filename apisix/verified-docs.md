1. Installation

curl -sL https://run.api7.ai/apisix/quickstart | sh

2. Validate Installation

curl "http://127.0.0.1:9080" --head | grep Server

3. Create a Route
edd1c9f034335f136f87ad84b625c8f1

curl -i "http://127.0.0.1:9180/apisix/admin/routes" -X PUT -d '
{
  "id": "getting-started-ip",
  "uri": "/ip",
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "httpbin.org:80": 1
    }
  }
}'

4. Validate the Route

curl "http://127.0.0.1:9080/ip"

5. Enable Load Balancing

curl -i "http://127.0.0.1:9180/apisix/admin/routes" -X PUT -d '
{
  "id": "getting-started-headers",
  "uri": "/headers",
  "upstream" : {
    "type": "roundrobin",
    "nodes": {
      "httpbin.org:443": 1,
      "mock.api7.ai:443": 1
    },
    "pass_host": "node",
    "scheme": "https"
  }
}'

6. Validate Load Balancing

curl "http://127.0.0.1:9080/headers"

7. Generate 100 requests

hc=$(seq 100 | xargs -I {} curl "http://127.0.0.1:9080/headers" -sL | grep "httpbin" | wc -l); echo httpbin.org: $hc, mock.api7.ai: $((100 - $hc))

8. Create a Consumer using an API Secret Key to enable key-auth authentication

curl -i "http://127.0.0.1:9180/apisix/admin/consumers" -X PUT -d '
{
  "username": "tom",
  "plugins": {
    "key-auth": {
      "key": "secret-key"
    }
  }
}'

9. Enable Authentication

curl -i "http://127.0.0.1:9180/apisix/admin/routes/getting-started-ip" -X PATCH -d '
{
  "plugins": {
    "key-auth": {}
  }
}'

10. Validate the authentication

- Send request without any key

curl -i "http://127.0.0.1:9080/ip"

- Send request with a wrong key

curl -i "http://127.0.0.1:9080/ip" -H 'apikey: wrong-key'

- Send request with the correct key

curl -i "http://127.0.0.1:9080/ip" -H 'apikey: secret-key'

11. Disable authentication

curl "http://127.0.0.1:9180/apisix/admin/routes/getting-started-ip" -X PATCH -d '
{
  "plugins": {
    "key-auth": {
      "_meta": {
        "disable": true
      }
    }
  }
}'

12. Validate that authentication is disabled

- Send request without authentication

curl -i "http://127.0.0.1:9080/ip"


13. Enable Rate Limiting

curl -i "http://127.0.0.1:9180/apisix/admin/routes/getting-started-ip" -X PATCH -d '
{
  "plugins": {
    "limit-count": {
        "count": 2,
        "time_window": 10,
        "rejected_code": 503
     }
  }
}'

14. Validate Rate Limiting

count=$(seq 100 | xargs -I {} curl "http://127.0.0.1:9080/ip" -I -sL | grep "503" | wc -l); echo \"200\": $((100 - $count)), \"503\": $count

15. Disable Rate Limiting

curl -i "http://127.0.0.1:9180/apisix/admin/routes/getting-started-ip" -X PATCH -d '
{
    "plugins": {
        "limit-count": {
            "_meta": {
                "disable": true
            }
        }
    }
}'

16. Validate Disabled Rate Limiting

count=$(seq 100 | xargs -i curl "http://127.0.0.1:9080/ip" -I -sL | grep "503" | wc -l); echo \"200\": $((100 - $count)), \"503\": $count