#!/bin/bash
set -e

sed -i -E "s/(Version\(string: \")[^\"]*(\"\))/\1$NEW_TAG\2/" VERSION.swift

# Configure git
git config user.name github-actions
git config user.email github-actions@github.com

# Commit and push changes
git add VERSION.swift
git commit -m "Update SDK version to $NEW_TAG"
git tag -a $NEW_TAG -m "$NEW_TAG" -f
git push origin HEAD $NEW_TAG --force
