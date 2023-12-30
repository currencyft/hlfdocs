use the link below to understand bringing up the network

https://hyperledger-fabric.readthedocs.io/en/latest/test_network.html?highlight=hyperledger%20chaincode

1. Inside IntelliJ, click on Gradle tab on the right
2. The Gradle panel opens
3. Click on "distribution" drop down
4. Right click on "distTar" and click Run
5. Right click on "distZip" and click Run
6. Right click on "installDist" and click Run
7. Proceed below

Setup the Java home
1. list all java versions running on the system by typing the command below
    /usr/libexec/java_home -V
2. below is listed
    /opt/homebrew/Cellar/openjdk@17/17.0.9/libexec/openjdk.jdk/Contents/Home
3. next configure JAVA_HOME
    nano ~/.zshrc
4. Copy and paste the java path in 2. above into the end of the .zshrc file
5. Save and close
6. Enter the code below to activate the path
    source ~/.zshrc
7. Test the java path
    echo $JAVA_HOME
8. We will get the path below
    /opt/homebrew/Cellar/openjdk@17/17.0.9/libexec/openjdk.jdk/Contents/Home


### START THE HYPERLEDGER FABRIC
cd ~
cd hlfpte
cd fabric-samples
cd test-network

./network.sh down

./network.sh up createChannel -c channel1 -ca -s couchdb

$JAVA_HOME ./network.sh deployCC -ccn walletcc -ccp /Users/peteaston/ge/walletcc/walletcc -ccl java -c channel1