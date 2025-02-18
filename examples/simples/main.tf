provider "google" {
  # Configurações do provedor Google Cloud
}

module "compute_instances" {
  source = "./google_compute_instance_module"

  instances = [
    {
      compute_name = "instance-1"
      machine_type = "n1-standard-1"
      zone         = "us-central1-a"
      image        = "debian-cloud/debian-10"
      network      = "default"
      metadata_key = "your-ssh-key"
      metadata_startup_script = "apt-get update && apt-get install -y apache2 && echo 'Hello, World!' > /var/www/html/index.html"
    },
    {
      compute_name = "instance-2"
      machine_type = "n1-standard-1"
      zone         = "us-central1-a"
      image        = "debian-cloud/debian-10"
      network      = "default"
      metadata_key = "your-ssh-key"
      metadata_startup_script = "apt-get update && apt-get install -y apache2 && echo 'Hello, World!' > /var/www/html/index.html"
    }
    # Adicione mais instâncias conforme necessário
  ]
}