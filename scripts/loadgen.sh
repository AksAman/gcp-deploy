# REGION=us-central1
# PROJECT_NAME=gogcp
# export CLOUD_RUN_SERVICE_URL=$(gcloud run services describe $PROJECT_NAME --region $REGION --format 'value(status.url)')
echo $CLOUD_RUN_SERVICE_URL

curl -s $CLOUD_RUN_SERVICE_URL/api/users