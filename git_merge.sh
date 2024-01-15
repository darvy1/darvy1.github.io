#!/bin/bash

echo "Enter branch you want to move to"
read branch
echo "Enter branch you want to merge into:" $branch
read mergingBranch

git checkout $branch
git merge $mergingBranch
echo Merged "$mergingBranch" into "$branch"
git push