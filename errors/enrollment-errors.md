## FatalErrors That Grounded Progress

### org.apache.http.conn.HttpHostConnectException: Connect to localhost:7054 [localhost/127.0.0.1, localhost/0:0:0:0:0:0:0:1] failed: Connection refused

- This error above was encountered at the time ClientHandshake Erro 003 Client TLS handshake was also experienced. This error prevented the Handler which was running the Hyperledger Fabric Gateway SDK from connecting to the hyperledger fabric server.

#### SOLUTION
- I had to uninstall and re-install the whole hyperledger fabric which didn't solve the problem.
- I stopped docker images and volumes and pruned and re-installed but this didn't solve the problem.
- Finally I had to delete the whole of docker volume in Docker Desktop.
    - I then re-installed hyperledger fabric with the latest version and the HttpConnectException was gone.