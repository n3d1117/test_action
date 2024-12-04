#!/bin/bash
set -e

# Example: Update a specific file with the new tag
echo "$NEW_TAG" > VERSION.txt

# Configure git
git config user.name github-actions
git config user.email github-actions@github.com

# Commit and push changes
git add VERSION.txt
git commit -m "chore: update version to $NEW_TAG"
git push
