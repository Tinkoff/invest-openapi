#!/bin/bash

rm -rf docs

docker run -v $PWD:/docs squidfunk/mkdocs-material build --config-file=/docs/src/mkdocs.yml --site-dir ../docs

mv swagger-ui docs/
mv swagger.yaml docs/swagger-ui/
