## Discovery Errors
### org.hyperledger.fabric.sdk.exception.ServiceDiscoveryException: The channel is not configured with any peers with the 'discover' role


#### SOLUTION
- Ensure "discover: true" is added in the channels part of the common connection profile

channels:
  testchannel:
    peers:
      peer1.org1.example.com:
        endorsingPeer: true
        chaincodeQuery: true
        ledgerQuery: true
        eventSource: true
        discover: true