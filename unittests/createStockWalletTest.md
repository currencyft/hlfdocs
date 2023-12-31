## Deploy createStockWalletTest



1. Deploy chaincode and run some tests
    
    - ./network.sh down
    
    - ./network.sh up createChannel -c channel1 -ca -s couchdb
    
    - JAVA_HOME=/Users/peteaston/Library/Java/JavaVirtualMachines/corretto-11.0.21/Contents/Home ./network.sh deployCC -ccn walletcc -ccp /Users/peteaston/ge/cbdc/walletcc -ccl java -c channel1
    
    - source ./setOrg1Peer.sh
    
    - peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --channelID channel1 -n walletcc --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -c '{"function":"","Args":[]}'
    
    - peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --channelID channel1 -n walletcc --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -c '{"function":"testInfo","Args":[]}'


    - peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem --channelID channel1 -n walletcc --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -c '{"function":"createStockWallet","Args":["{\"username\":\"stockwallet\",\"signature\":\"MEQCIFHoNaCcEJ1jiQwnzcNr6fVsHO64sh80LYh981V0aZptAiBRgGrD+F7NSnWdDCF9eFUMm550jiGaqKAzq076J8MYsw\u003d\u003d\",\"public_key\":\"MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE5Xfmw+pADwgyz4HGZOSp5IHKp8KbrFzfIsq+bwGjGQCY3q//s8bO/ZdS6fy4my9FC+VTqoSO5liNUPANwE3sHw\u003d\u003d\",\"owner_wallet_address\":\"currency_consortium\"}"]}'


    - Response

        - Chaincode invoke successful. result: status:200 payload:"{\"walletId\":\"692e1ef90a8d461d6e422816cd1516ca12d0e52020812ebef0e6ee0a680b5110\",\"balance\":200000,\"ownerWalletAddress\":\"currency_consortium\",\"combinedWalletKey\":\"stock_wallet\",\"guid\":\"8ef5269b-2733-3e71-b85a-3752e70554b4\",\"scale\":2,\"currency\":\"DXCD\",\"publicKey\":\"MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE5Xfmw+pADwgyz4HGZOSp5IHKp8KbrFzfIsq+bwGjGQCY3q//s8bO/ZdS6fy4my9FC+VTqoSO5liNUPANwE3sHw==\",\"type\":\"STOCK_WALLET\",\"version\":\"1\",\"clientIdentity\":\"ca.org1.example.com\"}"

