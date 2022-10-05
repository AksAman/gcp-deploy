REGION=us-central1
FUNCTION_NAME=gogcp-python-all
export CF_TRIGGER_URL=$(gcloud functions describe $FUNCTION_NAME --format="value(httpsTrigger.url)")

echo $CF_TRIGGER_URL

# curl -s $CF_TRIGGER_URL

hey -n 100 -c 10 $CF_TRIGGER_URL