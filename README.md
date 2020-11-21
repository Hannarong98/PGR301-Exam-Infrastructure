## PGR301-Exam-Infrastructure

[![Build Status](https://travis-ci.com/Hannarong98/PGR301-Exam-Infrastructure.svg?token=DqMpxq41VWvgzW8Fy3oq&branch=master)](https://travis-ci.com/Hannarong98/PGR301-Exam-Infrastructure) <a href="https://www.statuscake.com" title="Website Uptime Monitoring"><img src="https://app.statuscake.com/button/index.php?Track=5749379&Days=1&Design=3" /></a>

Prerequisite
---
#### You have to have the following requirements to begin
* Created storage bucket
* Service account with following roles
    * `roles/run.admin`
    * `roles/run.serviceAgent`
    * `roles/containerregistry.ServiceAgent`


Usage
---
### Set desired travis endpoint
* For _travis-ci.com_ user
    * `travis endpoint --pro --set-default`
    * Alternatively `travis endpoint --com --set-default`
* For _travis-ci.org_ user
    * `travis endpoint --org --set-default`
#### Encrypt following secrets
* `travis encrypt-file terraform-credentials.json --add`
    * `terraform-credentials.json` contains google service account private key __DO NOT__ commit this file
* `travis encrypt LOGZ_TOKEN="YOUR_LOGZ_IO_TOKEN"  --add`
* `travis encrypt LOGZ_TOKEN="YOUR_LOGZ_IO_LISTENER_URL" --add`
* `travis encrypt STATUS_CAKE_API_KEY="YOUR_STATUS_CAKE_API_KEY" --add`


#### Configurations

* In `.travis.yml` add
    * `GCP_PROJECT_ID` to your project id as global env
* In `variables.tf` change these default values
    * `deploy_region`
    * `project_id`
    * `service_runner`
    * `status_cake_website_name`
    * `status_cake_check_rate`
    * `status_cake_contact_group`
* In `provider.tf` change the following field value
    * `bucket`
* In `main.tf` you can change `google_cloud_run_service` resource name
    * And then you have to change some values in `google_cloud_run_service_iam_policy` block
* Non mentioned fields are configured and encrypted at the `Encrypt secrets` step

Links
---

[Application](https://github.com/Hannarong98/PGR301-Exam-application)