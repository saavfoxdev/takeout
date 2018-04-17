# Tag last commit as 'latest'.

if [ "$TRAVIS_BRANCH" = "master" -a "$TRAVIS_PULL_REQUEST" = "false" ]; then
  git config --global user.email "leomaxi@outlook.com"
  git config --global user.name "leomaxi"

  git remote add release "https://${GH_TOKEN}@github.com/ole-vi/takeout.git"

  git push -d release latest
  git tag -d latest
  git tag -a "latest" -m "[Autogenerated] This is the latest version pushed to the master branch."
  git push release --tags

  echo -e "Done with tags.\n"

fi