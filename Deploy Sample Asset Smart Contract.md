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
- Set the environment for peer1 
    ```
    source ./setOrg1Peer.sh

