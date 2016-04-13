#!/bin/bash

set -e
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

${DIR}/regenerate_doc_index.py

if git diff-index --quiet HEAD -- ; then 
  echo "no changes to index"
else
  git config user.name "DUNE Community Bot"
  git config user.email "dune-community.bot@wwu.de"
  git add ${DIR}/../docs/index.md
  git commit -m '[doc] index update'
  git push 
  git diff-index
fi
