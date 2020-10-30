#!/usr/bin/env bash

read -p "Commit Message: " msg

git config user.name "kimseongrim"
git config user.email "kimseongrim@qq.com"

git add --all
git commit -m "$msg"
git push
