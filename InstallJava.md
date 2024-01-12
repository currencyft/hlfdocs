## Install Java
### Recommended approach
### Alternative Java Install
1. run the command below to install java
    
    ```brew install openjdk@17```
2. after installation run the codes below to add java to symlink, add java to class path and make java seen by compilers
    
    ```sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk```
    
    
    ```echo 'export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"' >> ~/.zshrc```
    
    
    ```export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"```

3. Setup JAVA_HOME
    
    ```export JAVA_HOME=$(/usr/libexec/java_home -v 17)```
    
    or 
    
    ```export JAVA_HOME=$(/usr/libexec/java_home -v 11)```

4. To setup more than one jdk, run the steps 1 to 2 again.
    - However, open .zshrc file again
    - Comment out the new path set and leave the old path in order to retain the prefered version

    ```
    export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
    #export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
    ```