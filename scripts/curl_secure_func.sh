#!/bin/bash

REGION=us-central1
FUNCTION_NAME=gogcp-python-all
export CF_TRIGGER_URL=$(gcloud functions describe $FUNCTION_NAME --format="value(httpsTrigger.url)")

echo $CF_TRIGGER_URL

TOKEN=$(gcloud auth print-identity-token)

# hey -n 20 -c 5 -H "Authorization: Bearer $TOKEN" $CF_TRIGGER_URL
# curl -s -H "Authorization: Bearer $TOKEN" $CF_TRIGGER_URL
for i in {1..10}
do
    curl -w "@scripts/curl-format.txt" -s -H "Authorization: Bearer $TOKEN" $CF_TRIGGER_URL
    sleep 2
    echo $i
done