#!/bin/sh

set -e

[ "${TRAVIS_BRANCH}" != "main" ] && exit 0

git config --global user.email "cko.hodnotenie@gmail.com"
git config --global user.name "Andrej Chudy"

git clone -b gh-pages https://github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output
cp -r ../_book/* ./
git add --all *
git commit -m "Update the book" || true
git push -q origin gh-pages