## Deploy createStockWalletTest



1. Deploy chaincode and run some tests

    <code style="width:300px; background-color:#ccc;">./network.sh down
    
    ./network.sh up createChannel -c channel1 -ca -s couchdb
    
    JAVA_HOME=/Users/peteaston/Library/Java/JavaVirtualMachines/corretto-11.0.21/Contents/Home ./network.sh deployCC -ccn walletcc -ccp /Users/peteaston/ge/walletcc/walletcc -ccl java -c channel1
    
    source ./setOrg1Peer.sh
    
    peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --channelID channel1 -n walletcc --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -c '{"function":"","Args":[]}'
    
    peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --channelID channel1 -n walletcc --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -c '{"function":"testInfo","Args":[]}'

    </code>