
PROJECT_ID=$(gcloud config get-value project)
gcloud builds submit --config cloudbuild_gcf.yaml \
   --project $PROJECT_ID --no-source \
    --substitutions=_GIT_SOURCE_BRANCH="python",_GIT_SOURCE_URL="https://github.com/AksAman/gcp-deploy",_GIT_REPO_NAME="gcp-deploy"
