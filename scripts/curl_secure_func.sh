REGION=us-central1
FUNCTION_NAME=gogcp-python-all
export CF_TRIGGER_URL=$(gcloud functions describe $FUNCTION_NAME --format="value(httpsTrigger.url)")

echo $CF_TRIGGER_URL

TOKEN=$(gcloud auth print-identity-token)

curl -s -H "Authorization: Bearer $TOKEN" $CF_TRIGGER_URL