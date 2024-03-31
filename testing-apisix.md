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


curl -i "http://127.0.0.1:9081/apisix/admin/routes" -X PUT -d '
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


hc=$(seq 100 | xargs -I {} curl "http://127.0.0.1:9081/headers" -sL | grep "httpbin" | wc -l); echo httpbin.org: $((50 - $hc)), mock.api7.ai: $((50 - $hc))


Key Authentication
curl -i "http://127.0.0.1:9081/apisix/admin/consumers" -X PUT -d '
{
  "username": "tom",
  "plugins": {
    "key-auth": {
      "key": "afadfr3245sgsdgfsdfgs"
    }
  }
}'

Enable Authentication
curl -i "http://127.0.0.1:9081/apisix/admin/routes/getting-started-ip" -X PATCH -d '
{
  "plugins": {
    "key-auth": {}
  }
}'


Validate Authentication
curl -i "http://127.0.0.1:9081/ip"

Send a request with wrong key
curl -i "http://127.0.0.1:9081/ip" -H 'apikey: wrong-key'

Send a request with correct key
curl -i "http://127.0.0.1:9081/ip" -H 'apikey: afadfr3245sgsdgfsdfgs'


Rate Limitiing
curl -i "http://127.0.0.1:9081/apisix/admin/routes/getting-started-ip" -X PATCH -d '
{
  "plugins": {
    "limit-count": {
        "count": 2,
        "time_window": 10,
        "rejected_code": 503
     }
  }
}'

Validate Rate Limiting
count=$(seq 100 | xargs -I {} curl "http://127.0.0.1:9081/ip" -I -sL | grep "503" | wc -l); echo \"200\": $((100 - $count)), \"503\": $count