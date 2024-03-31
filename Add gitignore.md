1. remove existing git

rm -rf .git*

2. add the gitignore files with configurations

node_modules/
.next/
codesnippets/

3. initialize git

git init

4. add files

git add .

5. do first commit

git commit -m "first commit"

6. change branch

git branch -M main

7. add origin 

git remote add origin https://github.com/comvarse/airbnb-clone.git

8. push to main

git push -u origin main
