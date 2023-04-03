#!/bin/bash

if [ "$1" != "" ];
then
  stamp="-$1"
fi
gsutil cp ../data/dist/fetch/fetch.zip gs://sero-test-europe-west2-app/fetch$stamp.zip
gsutil cp ../data/dist/fetch/ingest.zip gs://sero-test-europe-west2-app/ingest$stamp.zip
