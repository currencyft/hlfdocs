## Installations
Install xcode
1. Check that xcode is install by typing in the command below
    
    ```xcode-select -v```
2. If not installed type the below code to install the command line tools
    
    ```xcode-select --install```
3. then install brew below

Install brew
1. Install brew
    
    ```h -c “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)”```
2. type mac password if password prompt comes up
3. installation should run through to end
4. then install git below


Install Git
1. check version
    
    ```git --version```
2. install git
    
    ```brew install git```
3. set the class path
    
    ```export PATH=/usr/local/bin:$PATH```
4. check version again
    
    ```git --version```
5. version of git should be in the folder below for mac
    
    ```/opt/homebrew/bin/git```


Install Node
1. update brew 
    
    ```brew upgrade```
2. install node
    
    ```brew install node```
3. check that node is installed
    
    ```node -v```
4. check that npm is installed
    
    ```npm -v```


Install nvm
1. install nvm
    
    ```brew install nvm```
2. Add nvm to shell profile: To make nvm available whenever a new terminal window is opened
    
    ```source $(brew --prefix nvm)/nvm.sh```
3. To install a specific Node.js version, e.g. version 16, use the following command
    
    ```nvm install 16```
4. Latest version of Node.js can be installed by running the following command
    
    ```nvm install node```
4. List all available Node.js versions that can be installed with nvm, with command below:
    
    ```nvm ls-remote```
5. Use the desired version of installed Node.js
    
    ```nvm use 16```
6. Set the default Node.js
    
    ```nvm alias default 16```

Install curl
1. install curl
    
    ```brew install curl```
2. check curl
    
    ```which curl```
3. this version is obtained
    
    ```/usr/bin/curl```
4. execute the following commands to override the defualt curl from macOS
    
    ```echo 'export PATH="/opt/homebrew/opt/curl/bin:$PATH"' >> ~/.zshrc```


    ```export LDFLAGS="-L/opt/homebrew/opt/curl/lib"```
    
    
    ```export CPPFLAGS="-I/opt/homebrew/opt/curl/include"```
5. close the terminal and re-open it again
6. execute the following command
    
    ```which curl```
7. the new curl folder will be obtained
    
    ```/opt/homebrew/opt/curl/bin/curl```

Install golang
1. head over to the web page https://go.dev/dl/
2. download the arm version for mac book m3 chip
3. double click the installer to install go

Install hyperledger fabric
1. run the following command to install the latest version of hyperledger fabric
    
    curl -sSL http://bit.ly/2ysbOFE | bash -s


Install Java
1. run the command below to install java
    
    brew install openjdk@17
2. after installation run the codes below to add java to class path
    
    sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
    
    echo 'export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"' >> ~/.zshrc
    
    export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"


Install jq

1. Run the comand below to install jq
    
    brew install jq


