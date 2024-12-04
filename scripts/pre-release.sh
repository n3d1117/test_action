#!/bin/bash
set -e

sed -i -E "s/(Version\(string: \")[^\"]*(\"\))/\1$NEW_TAG\2/" VERSION.swift

# Commit and push changes
git add VERSION.swift
git commit -m "chore: update version to $NEW_TAG"
git tag -a $NEW_TAG -m "$NEW_TAG" -f
git push origin main --follow-tags
git push origin $NEW_TAG -f
