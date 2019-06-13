#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
rm -rf docs/
hugo --gc --minify -t introduction -d docs -v -b https://tahahusa.in
echo "tahahusa.in" >> docs/CNAME

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
