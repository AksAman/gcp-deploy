REGION=us-central1
FUNCTION_NAME=gogcp-all
export CF_TRIGGER_URL=$(gcloud functions describe $FUNCTION_NAME --format="value(httpsTrigger.url)")

echo $CF_TRIGGER_URL

# curl -s $CF_TRIGGER_URL

hey -n 10000 -c 1000 $CF_TRIGGER_URL