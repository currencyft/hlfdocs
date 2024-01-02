## Deploy sample AssetTransfer smart contract

### Navigate to existing installation
- Navigate to hyperledger fabric ~/fabric-samples/asset-transfer-basic
- Copy the chaincode-java
- Paste it into an external folder
    ```
    /Users/{username}/sample
    /Users/{username}/sample/chaincode-java
- Navigate to hyperledger fabric ~/fabric-samples/test-network folder
    - cd ~/fabric-samples/test-network
- Stop Hyperledger fabric
    - ./network.sh down
- Start the network 
    - ./network.sh up createChannel -c channel1 -ca -s couchdb

