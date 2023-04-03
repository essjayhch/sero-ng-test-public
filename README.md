# DevOps Brief

## Objective

To develop a system for ingesting and storing National Grid consumption data every hour and providing access to the data through a public API. We expect the API to increase in load linearly over the next three years

## Requirements

- Infrastructure must be managed by Terraform
- You must use the GCP platform
- You must have Node installed on your machine

## Deliverables

- A system for ingesting National Grid consumption data every hour
- A persistent data store for storing the ingested data
- A public API for accessing the stored data (supplied)
- A deployed API and infrastructure
- Example usage of the API using CURL or Postman

## Bonus points

- Implement monitoring and logging capabilities
- CI/CD pipeline that deploys the infra and code
- Documentation on how to use the API

## Instructions

- You must setup a persistent data store and update the `.env` file in the data directory to point to your chosen data store and update the provider block and update the provider block in the schema.prisma file to be the chosen DB provider e.g. postgressql, mysql, cockroachdb
- There are two ways to ingest the data, either by a cloud function or a simple NodeJS application that could be containerized (this can be found in the `data` directory)
- There are two ways to fetch the data, either by a cloud function or a simple NodeJS application that could be containerized (this can be found in the `data` directory)
- Prisma is being used as the ORM for this project - When setting up your persistent store, you can choose from any of the supported **SQL** DB's listed on Prismas website (https://www.prisma.io/docs/reference/database-reference/supported-databases)
- When you are ready, just run `npx prisma db push` to migrate your DB schema (you can do this locally or via a CI/CD pipeline)

- To build the applications do the following
  - `cd data`
  - `npm install`
  - `npx prisma generate`
  - `npm run build`

The above commands will output the compiled code in the `dist` directory inside the `data` directory

You can then deploy the code to a cloud function or containerize it and deploy it to a container platform


# DevOps
One can find deployment subsystems within the workspaces folder. Currently a test environment has been stood out, with various modules.
Linting is applied through CircleCI (in order to avoid learning cloud build). There are currently no attached credentials for this module, so you won't be able to rerun these.

## CI
The Continuous integration will attempt to build the artefact and deploy it to the cloudfunction in gcp.

## Continuous Deployment
There is a deployment gate at code deploy to minimise the churn on the system. In an ideal world, this would be coupled with tag based deploys so that a specific version can be built and deployed accordingly

## Artefacts
Artefacts are built around the SHA of the commit that generated it.

## CloudFunction output
The provided application has been deployed and curl run against it.
```
curl https://europe-west2-bouncing-panda.cloudfunctions.net/sero-fetch-9
{"status":"ok","data":[{"id":"clg1z32pf0000s601h2qv8g8h","from":"2023-01-01T09:30Z","to":"2023-01-01T10:00Z","forecast":82,"actual":78,"createdAt":"2023-04-04T08:02:39.603Z","updatedAt":"2023-04-04T08:02:39.603Z"}]}%
```

The ingester:
```
curl https://europe-west2-bouncing-panda.cloudfunctions.net/sero-ingest
{"status":"ok","data":[{"from":"2023-01-01T09:30Z","to":"2023-01-01T10:00Z","intensity":{"forecast":82,"actual":78,"index":"low"}},{"from":"2023-01-01T10:00Z","to":"2023-01-01T10:30Z","intensity":{"forecast":80,"actual":84,"index":"low"}},{"from":"2023-01-01T10:30Z","to":"2023-01-01T11:00Z","intensity":{"forecast":77,"actual":86,"index":"low"}}]}%
```
## Monitoring
A dashboard for monitoring for cloud functions in the project has been added in monitoring sub-module
