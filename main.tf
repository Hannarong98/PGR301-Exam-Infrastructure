resource "google_cloud_run_service" "pgr301-exam" {
  name = var.image_name
  location = var.deploy_region
  project = var.project_id

  template {
    spec {
      containers {
        image = "gcr.io/pgr301-exam-hannarong/examapp@sha256:9882de0fdfa48142e282a7faded8f825b83701210f79459b25a4dc5f437d2fd0"
        env {
          name = "LOGZ_TOKEN"
          value = var.logz_token
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