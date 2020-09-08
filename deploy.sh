#!/bin/bash
cd public

if [ -n "$GITHUB_TOKEN" ]
then
    touch ~/.git-credentials
    chmod 0600 ~/.git-credentials
    echo "https://${GITHUB_TOKEN}:@github.com" > ~/.git-credentials
    git config credential.helper store
    git config user.email "gomijianxu@gmail.com"
    git config user.name "xumi1993"
fi
git add .
git commit -m `date +"%Y.%m.%dT%H:%M%S"`
git push --force origin HEAD:gh-pages
