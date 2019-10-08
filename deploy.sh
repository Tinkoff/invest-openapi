#!/bin/bash

ocker run --rm -it -v ~/.ssh:/root/.ssh -v $PWD:/docs squidfunk/mkdocs-material gh-deploy --config-file=/docs/src/mkdocs.yml
