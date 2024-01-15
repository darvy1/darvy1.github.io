#!/bin/bash

# Prompt the user for commit message and branch
echo "Enter commit message:"
read commit_message
echo "Enter branch you want to commit to:"
read branch

git add .
git commit -m "$commit_message"
echo Committed staged changes to "$branch" in "$commit_message"
git push
