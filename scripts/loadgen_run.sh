# REGION=us-central1
# PROJECT_NAME=gogcp
# export CLOUD_RUN_SERVICE_URL=$(gcloud run services describe $PROJECT_NAME --region $REGION --format 'value(status.url)')
echo $CLOUD_RUN_SERVICE_URL

hey -n 10000 -c 1000 $CLOUD_RUN_SERVICE_URL/api/users
