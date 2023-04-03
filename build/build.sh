#!/bin/bash

cd ../data
npm install
npm run build
mkdir dist/fetch
mkdir dist/ingest
cp -r prisma dist/fetch
cp -r prisma dist/ingest
cp -r package.json dist/fetch
cp -r package.json dist/ingest
cp -r dist/fetchConsumptionDataFunction.js dist/fetch/function.js
cp -r dist/ingestConsumptionDataFunction.js dist/ingest/function.js
cd dist/fetch
zip -r fetch.zip .
cd ../ingest
zip -r ingest.zip
