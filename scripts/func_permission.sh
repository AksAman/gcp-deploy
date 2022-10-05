FUNCTION_NAME=gogcp-all
gcloud alpha functions add-iam-policy-binding $FUNCTION_NAME --member=allUsers --role=roles/cloudfunctions.invoker