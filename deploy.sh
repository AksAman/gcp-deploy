gcloud builds submit \
    --config cloudbuild_run.yaml \
    --project $PROJECT_ID --no-source \
    --substitutions= \
    _GIT_SOURCE_BRANCH="master",\
    _GIT_SOURCE_URL="https://github.com/AksAman/gcp-deploy"