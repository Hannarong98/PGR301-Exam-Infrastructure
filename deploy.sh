#!/bin/bash
if [ "$TRAVIS_BRANCH" == "master" ]; then
  set -ex
  export TF_VAR_logz_token=$LOGZ_TOKEN
  export TF_VAR_logz_url=$LOGZ_URL
  terraform init
  terraform plan
  terraform apply --auto-approve
  terraform output
  set +x
fi
