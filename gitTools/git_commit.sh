#!/bin/bash

# Prompt the user for commit message and branch
echo "Enter commit message:"
read commit_message
echo "Enter branch you want to commit to:"
read branch

# Add all changes
if git add .; then
    echo "Changes added successfully."
else
    echo "Error adding changes. Exiting."
    exit 1
fi

# Commit changes with the provided message
if git commit -m "$commit_message"; then
    echo "Changes committed successfully."
else
    echo "Error committing changes. Exiting."
    exit 1
fi

# Check if the branch exists before pushing changes
if git rev-parse --verify --quiet "$branch"; then
    # Push changes to the specified remote branch
    if git push origin "$branch"; then
        echo "Changes pushed successfully to branch $branch."
    else
        echo "Error pushing changes to branch $branch. Exiting."
        exit 1
    fi
else
    echo "Error: Branch $branch does not exist. Exiting."
    exit 1
fi
