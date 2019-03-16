#!/usr/bin/env bash

set -o errexit
set -o nounset

cd $(dirname $0)

echo -e "# Index\n" > index.md
git ls-files | grep -v "index.md" | grep -E "*.(pdf|txt|md)$" | sed -E "s/(.*)/- [\1](.\/\1)/" >> index.md
