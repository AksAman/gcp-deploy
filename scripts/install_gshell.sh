#!/bin/sh

# Install pre-requisites
sudo apt-get install apt-transport-https ca-certificates gnupg -y

# Add the gcloud CLI distribution URI as a package source. If your distribution supports the signed-by option, run the following command:
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

## OR if above command fails
# echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud public key. If your distribution's apt-key command supports the --keyring argument, run the following command
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

## OR If your distribution's apt-key command doesn't support the --keyring argument, run the following command:
# curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

## OR If your distribution (Debian 11+ or Ubuntu 21.10+) doesn't support apt-key, run the following command:
# curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg

# Install gcloud cli
sudo apt-get update && sudo apt-get install google-cloud-cli -y

# INIT gcloud
gcloud init