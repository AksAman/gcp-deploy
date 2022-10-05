REGION=us-central1
FUNCTION_NAME=gogcp-all
# export CLOUD_RUN_SERVICE_URL=$(gcloud run services describe $PROJECT_NAME --region $REGION --format 'value(status.url)')
# export CF_TRIGGER_URL=$(gcloud functions describe $FUNCTION_NAME --format="value(httpsTrigger.url)")

CF_TRIGGER_URL="https://us-central1-learninggcp-364602.cloudfunctions.net/gogcp-all"
echo $CF_TRIGGER_URL

curl -s $CF_TRIGGER_URL/api/users