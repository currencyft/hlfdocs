git init

git credential-osxkeychain erase (press enter)
    host=github.com (press enter)
    protocol=https (press enter) (press enter)

git config --global user.name currencyft
git config --global user.email currencyft@gmail.com

git remote add origin https://github.com/currencyft/api-gateway-app.git

git add .

to-configure-local-repo: configure it on the root of the projects, if not remove it from the repo using the command below:
    git rm --cached git-localconfig-repo

git commit -m "first commit"

git branch -M main

 git push -u origin main




