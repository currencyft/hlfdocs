## Setup Java Class Path and Java Home 

### Setup Java Class Path

- Type the command below to list installed java versions 

    - /usr/libexec/java_home -V

- Copy one of the version's locations like below
    - /Library/Java/JavaVirtualMachines/jdk-13.0.2.jdk/Contents/Home

- Open zshrc file
    - nano ~/.zshrc

- Paste the followng at the end
    - export PATH="/Library/Java/JavaVirtualMachines/jdk-13.0.2.jdk/Contents/Home:$PATH"


### Setup Java Home
- While zshrc file is still open

- Paste the following at the end
    - export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-13.0.2.jdk/Contents/Home


### If an error occurs and the zshrc file nor terminal commands like sudo and nano could no longer be accessed
- Open the Terminal from Applications
    - Click on Settings from the Terminal icon
    - Click on General
    - On "Shells open with"
        - Click on "Command (complete path)
- Next Open Finder
    - Click on "Go" at the top menu
    - Click on "Home"
    - Press Shift + Home + .
    - Hidden files will appear
    - Scroll Down
    - Locate zshrc file
    - Double click to open
    - Undo your last insertions.
    - Close it again
- Go to the terminal 
    - The terminal commands will be restored.


