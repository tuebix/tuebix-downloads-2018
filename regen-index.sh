#!/usr/bin/env bash

set -o errexit
set -o nounset

cd $(dirname $0)

echo -e "# Index\n" > index.md

echo -e "## Folien\n" >> index.md

git ls-files | grep -vE "README.md|index.md" | grep -E "\.(pdf|txt|md)$" | sed -E "s/(.*)/- [\1](\1)/" >> index.md

echo -e "\n## Audio\n" >> index.md

git ls-files | grep -E "\.ogg$" | sed -E "s/(.*)/- [\1](\1)/" >> index.md
