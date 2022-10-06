FUNCTION_NAME=gogcp-python-all
REGION=us-central1
gcloud alpha functions add-iam-policy-binding $FUNCTION_NAME --member=allUsers --region $REGION --role=roles/cloudfunctions.invoker

REGION=asia-south1
gcloud alpha functions add-iam-policy-binding $FUNCTION_NAME --member=allUsers --region $REGION --role=roles/cloudfunctions.invoker