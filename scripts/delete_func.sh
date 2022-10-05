PROJECT_ID=$(gcloud config get-value project)
REGION=us-central1
FUNCTION_NAME=gogcp-python-all

# delete cloud run
gcloud functions delete $FUNCTION_NAME --region $REGION # --quiet