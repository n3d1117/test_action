#!/bin/bash
set -e

sed -i -E "s/(Version\(string: \")[^\"]*(\"\))/\1$NEW_TAG\2/" VERSION.swift

# Configure git
git config user.name "Shape Games CI"
git config user.email "ci@shapegames.com"

# Commit and push changes
git add VERSION.swift
git commit -m "Update SDK version to $NEW_TAG"
git tag $NEW_TAG -f
git push origin HEAD $NEW_TAG --force
