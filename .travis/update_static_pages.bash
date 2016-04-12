#!/bin/bash

set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

${DIR}/regenerate_doc_index.py

if [ $(git diff-index --quiet --cached HEAD) ] ; then 
  git config user.name "DUNE Community Bot"
  git config user.email "dune-community.bot@wwu.de"
  git add ${DIR}/../docs/index.md
  git commit -m '[doc] index update'
  git push 
  git diff-index
fi
