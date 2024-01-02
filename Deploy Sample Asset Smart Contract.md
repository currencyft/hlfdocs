## Deploy sample AssetTransfer smart contract

### Navigate to existing installation
- Navigate to hyperledger fabric ~/fabric-samples/asset-transfer-basic
- Copy the chaincode-java
- Paste it into an external folder
    
    ```
    /Users/{username}/sample
    /Users/{username}/sample/chaincode-java
- Navigate to hyperledger fabric network ~/fabric-samples/test-network folder
    
    ```
    cd ~/fabric-samples/test-network
- Deploy the Smart Contract
    
    ```
    JAVA_HOME=/Users/peteaston/Library/Java/JavaVirtualMachines/corretto-11.0.21/Contents/Home ./network.sh deployCC -ccn basic -ccp /Users/peteaston/ge/cbdchandler/chaincode-java -ccl java -c channel1
- Set the environment variables for peer1 
    
    ```
    source ./setOrg1Peer.sh
- Invoke an empty call to test the network

    ```
    peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --channelID channel1 -n basic --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -c '{"function":"","Args":[]}'

- Place an InitLedger call
    
    ```
    peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --channelID channel1 -n basic --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -c '{"function":"InitLedger","Args":[]}'

