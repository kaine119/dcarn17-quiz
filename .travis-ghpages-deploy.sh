cp index.html dist/index.html
cd dist
git init

git config user.name "Travis CI"
git config user.email "mui.kaien@dhs.sg"

git add .
git commit -m "[TRAVIS] Deploy to github pages"

git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1