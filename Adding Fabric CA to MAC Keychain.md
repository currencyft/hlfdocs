## Install root certificate﻿

- When getting the error javax.net.ssl.SSLHandshakeException, I was searching for a solution. This is not yet the solution but I needed to add the fabric root cert to keychain to see if it can solve the handshake exception problem

### Install the hyperledger fabric root certificate to keychain
- Open up Keychain Access by searching it on Spotlight (click the Magnifying glass located in the upper right corner).

- Select File | Import Items and navigate to the downloaded file.

    - The root cert if located as below
    ```
    /Users/peteaston/hlfa/fabric-samples/test-network/organizations/fabric-ca/ordererOrg/ca-cert.pem

- In the Destination Keychain field, select System and click ***Open***.

- Right-click the certificate in Keychain Access and select ***Get Info***.

- Expand the Trust section and under ***When using this certificate***, select ***Always Trust***.