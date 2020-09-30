if [ -n "$(git status --porcelain --ignore-submodules)" ]; then
  echo "Git status isn't clean!"
  exit
fi

GIT_VERSION="$(git rev-parse HEAD)"

echo "Generating and publishing based on commit $GIT_VERSION"

cd public
shopt -s extglob
rm -rf !(.git|CNAME)
cd ..

hugo --buildFuture

cd public
git add .
git commit -m "Generated from commit $GIT_VERSION" -m "$(hugo version)"
git push
cd ..

git commit -m "[public] Update ref" public
git push
