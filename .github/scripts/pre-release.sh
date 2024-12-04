#!/bin/bash
set -e

sed -i '' "s/\"[^\"]*\"/\"$NEW_VERSION\"/g" Version.swift

# Configure git
git config user.name github-actions
git config user.email github-actions@github.com

# Commit and push changes
git add VERSION.txt
git commit -m "chore: update version to $NEW_TAG"
git push
