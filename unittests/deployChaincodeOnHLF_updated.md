## Deploying Chaincode on Hyperledger Fabric 

Use the link below to read up more on deploying chaincodes and bringing up the network


https://hyperledger-fabric.readthedocs.io/en/latest/test_network.html?highlight=hyperledger%20chaincode

Execute the contents of this file if this hasn't been done before.

### After Developing the Chaincode on IntelliJ

1. Inside IntelliJ, click on Gradle tab on the right
2. The Gradle panel opens
3. Click on "distribution" drop down
4. Right click on "distTar" and click Run
5. Right click on "distZip" and click Run
6. Right click on "installDist" and click Run
7. Proceed below

### Setup the Java home
1. List all java versions running on the system by typing the command below
    
    ```/usr/libexec/java_home -V```

- First Install Java version 11 if it is not yet installed
- Then obtain Java version 11 path using this code below.

    ```/usr/libexec/java_home -V```

2. below is listed
    
    ```/opt/homebrew/Cellar/openjdk@17/17.0.9/libexec/openjdk.jdk/Contents/Home```
    ```/Users/peteaston/Library/Java/JavaVirtualMachines/corretto-11.0.21/Contents/Home```

3. next configure JAVA_HOME
    
    ```nano ~/.zshrc```
4. Copy and paste the desired java path in 2. above into the end of the .zshrc file
    - We can set java17 as the default in the class path
    - We can then use java11 for deploying the chaincode

5. Save and close the file opened in 3. above
6. Enter the code below to activate the path
    
    ```source ~/.zshrc```
7. Test the java path
    
    ```echo $JAVA_HOME```
8. We will get the path below
    
    ```/opt/homebrew/Cellar/openjdk@17/17.0.9/libexec/openjdk.jdk/Contents/Home```


### Start the Hyperledger Fabric
1. Start the hyperledger fabric and deploy chaincode

    ```cd ~```
    
    
    ```cd hlfpte```

    
    ```cd hlfpte```
    
    
    ```cd fabric-samples```
    
    
    ```cd test-network```

    
    ```./network.sh down```
    
    
    ```./network.sh up createChannel -c channel1 -ca -s couchdb ```
    
2. Compile and deploy the chaincode. 
    
    - Use the Java 11 path from 2. above as below in the command to compile and deploy the chaincode.

    ```JAVA_HOME=/Users/peteaston/Library/Java/JavaVirtualMachines/corretto-11.0.21/Contents/Home ./network.sh deployCC -ccn walletcc -ccp /Users/peteaston/ge/walletcc/walletcc -ccl java -c channel1```
    
    - **Note that you must install and use Java 11 in the class path to deploy the chaincode otherwise, you will get endorsement failure when calling the contract methods**

    ```Error: endorsement failure during invoke. response: status:500 message:"Undefined contract called"```