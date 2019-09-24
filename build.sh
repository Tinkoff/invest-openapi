#!/bin/bash

docker run -v $PWD:/docs squidfunk/mkdocs-material build --config-file=/docs/src/mkdocs.yml --site-dir ../docs
