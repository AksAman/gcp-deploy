PROJECT_ID=$(gcloud config get-value project)
FUNCTION_NAME=gogcp-python-all

# delete cloud run
REGION=us-central1
gcloud functions delete $FUNCTION_NAME --region $REGION --quiet


REGION=asia-south1
gcloud functions delete $FUNCTION_NAME --region $REGION --quiet