resource "google_compute_instance" "primary" {
  for_each = { for instance in var.instances : instance.compute_name => instance }

  name         = each.value.compute_name
  machine_type = each.value.machine_type
  zone         = each.value.zone

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  network_interface {
    network = each.value.network

    access_config {
      # Ephemeral IP
    }
  }

  metadata_startup_script = each.value.metadata_startup_script

  metadata = {
    ssh-keys = each.value.metadata_key
  }

  tags = ["web", "dev", "ssh"]

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}