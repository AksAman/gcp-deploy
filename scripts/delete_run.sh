REGION=us-central1
PROJECT_NAME=gogcp-python

gcloud run services delete $PROJECT_NAME --region $REGION --platform managed # --quiet

# delete containers
PROJECT_ID=$(gcloud config get-value project)
HOSTNAME=gcr.io
DIGEST=$(gcloud container images list-tags $HOSTNAME/$PROJECT_ID/$PROJECT_NAME --filter='-tags:*' --format="get(digest)" --limit=1000)

for i in $DIGEST; do
  gcloud container images delete --force-delete-tags $HOSTNAME/$PROJECT_ID/$PROJECT_NAME@$i #--quiet
done