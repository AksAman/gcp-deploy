FUNCTION_NAME=gogcp-all

CF_TRIGGER_URL="https://us-central1-learninggcp-364602.cloudfunctions.net/gogcp-all"
gcloud alpha functions add-iam-policy-binding $FUNCTION_NAME --member=allUsers --role=roles/cloudfunctions.invoker