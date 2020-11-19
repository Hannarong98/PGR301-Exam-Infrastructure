resource "google_cloud_run_service" "pgr301-exam" {
  name = var.service_runner
  location = var.deploy_region
  project = var.project_id

  template {
    spec {
      containers {
        image = "gcr.io/pgr301-exam/examapp@sha256:b2bfe1ddac8287b7a55c22a850c8282c80eb185a1b6816d71f95c98ed4ace9ce"
        env {
          name = "LOGZ_TOKEN"
          value = var.logz_token
        }
        env {
          name = "LOGZ_URL"
          value = var.logz_url
        }
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.pgr301-exam.location
  project = google_cloud_run_service.pgr301-exam.project
  service = google_cloud_run_service.pgr301-exam.name
  policy_data = data.google_iam_policy.noauth.policy_data
}