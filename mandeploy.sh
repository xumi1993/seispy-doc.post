make html
cp -r ./build/html/* ./public
cd ./public
git add .
git commit -m "manual commit"
git push origin gh-pages