FROM python:3.7-slim

# Checkout and install dagster libraries needed to run the gRPC server
# exposing your repository to dagit and dagster-daemon, and to load the DagsterInstance

RUN pip install \
    dagster==0.14.17 \
    dagster-postgres==0.14.17 \
    dagster-docker==0.14.17 \
    requests==2.27.1 \
    psycopg2-binary==2.9.3 \
    boto3==1.21.21 \
    dagster-dbt==0.14.17 \
    dbt-core \
    dbt-postgres

# Add repository code

WORKDIR /opt/dagster/
ENV PYTHONPATH=/app

COPY ./example_project /opt/dagster