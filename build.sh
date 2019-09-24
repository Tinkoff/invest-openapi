#!/bin/bash

docker run -v $PWD:/docs squidfunk/mkdocs-material build --config-file=/docs/src/mkdocs.yml

rm -rf docs
mv src/site docs
rm -rf src/site