# VPC
resource "google_compute_network" "vpc" {
  name    = var.vpc_name
  project = var.project_id
  
}

# Public subnet
resource "google_compute_subnetwork" "public_subnet" {
  name          = "${var.vpc_name}-public-subnet"
  ip_cidr_range = var.public_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.name
}

# Private subnet for GKE cluster
resource "google_compute_subnetwork" "private_subnet" {
  name          = "${var.vpc_name}-private-subnet"
  ip_cidr_range = var.private_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.name
}

# Create a static IP address for the jumpbox instance
resource "google_compute_address" "jumpbox_static_ip" {
  name   = "jumpbox-static-ip"
  region = var.region
}

# Windows 10 jumpbox instance
resource "google_compute_instance" "jumpbox" {
  name         = "${var.vpc_name}-jumpbox"
  machine_type = "n2-standard-2"
  zone         = var.zone
  deletion_protection = false  # Disable deletion protection


  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-2022"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.name

    access_config {
      // Assign the static public IP to the instance
      nat_ip = google_compute_address.jumpbox_static_ip.address
    }
    
  }
  
}

# Firewall rule to allow HTTP traffic
resource "google_compute_firewall" "allow-http" {
  name    = "kopicloud-fw-allow-http"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}

# Firewall rule to allow RDP traffic
resource "google_compute_firewall" "allow-rdp" {
  name    = "kopicloud-fw-allow-rdp"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
  
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["rdp"]
}

# Firewall rule to allow RDP traffic from IAP
resource "google_compute_firewall" "allow-rdp-iap" {
  name        = "allow-rdp-iap"
  network     = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  # Allow traffic only from IAP TCP
  source_ranges = ["35.235.240.0/20"]  # IAP TCP source IP range

  # Target the jump box instance by its target tag
  target_tags   = ["rdp"]
}




resource "google_compute_firewall" "allow-ssh-new" {
  name    = "kopicloud-fw-allow-ssh-new"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  
  source_ranges = ["35.235.240.0/20"]
}




## Create IAP SSH permissions for your test instance

resource "google_project_iam_member" "project" {
  project = var.project_id
  role    = "roles/iap.tunnelResourceAccessor"
  member  = "serviceAccount:ci-cd-615@cicd-project-412206.iam.gserviceaccount.com"
}

# Enable Service Networking API
resource "google_project_service" "service_networking" {
  project = var.project_id
  service = "servicenetworking.googleapis.com"
}


# ... (Existing resources)

# PostgreSQL database
resource "google_sql_database_instance" "db" {
  name             = "${var.vpc_name}-db"
  database_version = "POSTGRES_14"
  region           = var.region
  deletion_protection = false  # Disable deletion protection


  settings {
    tier = "db-f1-micro"
  }
}







resource "google_container_cluster" "gke_cluster" {
  name     = "${var.vpc_name}-gke-cluster"
  location = var.region
  deletion_protection = false  # Disable deletion protection

  # Specify the correct self-link of the existing subnetwork
  network     = google_compute_network.vpc.name
  subnetwork  = google_compute_subnetwork.private_subnet.self_link

  node_pool {
    name              = "default-node-pool"
    initial_node_count = var.gke_num_nodes

    node_config {
      machine_type = var.gke_node_type
      preemptible  = false
      disk_size_gb = 50   # Adjust disk size to a lower value
      disk_type    = "pd-ssd"
    }
  }

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block = "192.168.0.0/28"
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/14"
    services_ipv4_cidr_block = "/20"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "10.0.0.0/8"
    }
  }
}







