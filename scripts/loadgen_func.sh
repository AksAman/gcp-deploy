TOKEN=$(gcloud auth print-identity-token)


REGION=us-central1
FUNCTION_NAME=gogcp-python-all
export CF_TRIGGER_URL=$(gcloud functions describe $FUNCTION_NAME --region $REGION --format="value(httpsTrigger.url)")

echo $CF_TRIGGER_URL

# curl -s $CF_TRIGGER_URL

hey -n 10000 -c 1000 -H "Authorization: Bearer $TOKEN"  $CF_TRIGGER_URL


REGION=asia-south1
FUNCTION_NAME=gogcp-python-all
export CF_TRIGGER_URL=$(gcloud functions describe $FUNCTION_NAME --region $REGION --format="value(httpsTrigger.url)")

echo $CF_TRIGGER_URL

# curl -s $CF_TRIGGER_URL

hey -n 10000 -c 1000 -H "Authorization: Bearer $TOKEN"  $CF_TRIGGER_URL