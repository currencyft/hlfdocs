##Git tutorial
1. create a folder
    mkdir foldername
2. navigate into the foldername
    cd foldername
3. initialize git inside the folder
    git init
4. Erase existing git user from osx keychain if it exists using the command below
    git credential-osxkeychain erase 
5. Press enter. And type the following below:
    host=github.com
6. Press enter again and type the following
    protocol=https
7. Press enter again
8. Press enter for the last time
9. set the global username details for the git account
    git config --global user.name {username}
    git config --global user.email {emailaddress}
10. clone a git repo
    git clone _url_
11. A prompt will ask for Username: {username}
12. Press Enter
13. A prompt will ask for Password: {githubkey}
14. Press Enter
15. The git repo will be downloaded
