<div align="center" id="top"> 
  <img src="./gcp.gif" alt="GCP" />
</div>

&#xa0;
&#xa0;

## Terraform resources plan

```ruby
Terraform will perform the following actions:

  # google_compute_address.nat will be created
  + resource "google_compute_address" "nat" {
      + address            = (known after apply)
      + address_type       = "EXTERNAL"
      + creation_timestamp = (known after apply)
      + id                 = (known after apply)
      + name               = "nat"
      + network_tier       = "PREMIUM"
      + project            = (known after apply)
      + purpose            = (known after apply)
      + region             = (known after apply)
      + self_link          = (known after apply)
      + subnetwork         = (known after apply)
      + users              = (known after apply)
    }

  # google_compute_firewall.allow_ssh will be created
  + resource "google_compute_firewall" "allow_ssh" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "allow-ssh"
      + network            = "main"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [
          + "0.0.0.0/0",
        ]

      + allow {
          + ports    = [
              + "22",
            ]
          + protocol = "tcp"
        }
    }

  # google_compute_network.main will be created
  + resource "google_compute_network" "main" {
      + auto_create_subnetworks         = false
      + delete_default_routes_on_create = false
      + gateway_ipv4                    = (known after apply)
      + id                              = (known after apply)
      + internal_ipv6_range             = (known after apply)
      + mtu                             = 1460
      + name                            = "main"
      + project                         = (known after apply)
      + routing_mode                    = "REGIONAL"
      + self_link                       = (known after apply)
    }

  # google_compute_router.router will be created
  + resource "google_compute_router" "router" {
      + creation_timestamp = (known after apply)
      + id                 = (known after apply)
      + name               = "router"
      + network            = (known after apply)
      + project            = (known after apply)
      + region             = "us-central1"
      + self_link          = (known after apply)
    }

  # google_compute_router_nat.nat will be created
  + resource "google_compute_router_nat" "nat" {
      + enable_dynamic_port_allocation      = (known after apply)
      + enable_endpoint_independent_mapping = true
      + icmp_idle_timeout_sec               = 30
      + id                                  = (known after apply)
      + name                                = "nat"
      + nat_ip_allocate_option              = "MANUAL_ONLY"
      + nat_ips                             = (known after apply)
      + project                             = (known after apply)
      + region                              = "us-central1"
      + router                              = "router"
      + source_subnetwork_ip_ranges_to_nat  = "LIST_OF_SUBNETWORKS"
      + tcp_established_idle_timeout_sec    = 1200
      + tcp_transitory_idle_timeout_sec     = 30
      + udp_idle_timeout_sec                = 30

      + subnetwork {
          + name                     = (known after apply)
          + secondary_ip_range_names = []
          + source_ip_ranges_to_nat  = [
              + "ALL_IP_RANGES",
            ]
        }
    }

  # google_compute_subnetwork.private will be created
  + resource "google_compute_subnetwork" "private" {
      + creation_timestamp         = (known after apply)
      + external_ipv6_prefix       = (known after apply)
      + fingerprint                = (known after apply)
      + gateway_address            = (known after apply)
      + id                         = (known after apply)
      + ip_cidr_range              = "10.0.0.0/18"
      + ipv6_cidr_range            = (known after apply)
      + name                       = "private"
      + network                    = (known after apply)
      + private_ip_google_access   = true
      + private_ipv6_google_access = (known after apply)
      + project                    = (known after apply)
      + purpose                    = (known after apply)
      + region                     = "us-central1"
      + secondary_ip_range         = [
          + {
              + ip_cidr_range = "10.48.0.0/14"
              + range_name    = "k8s-pod-range"
            },
          + {
              + ip_cidr_range = "10.52.0.0/20"
              + range_name    = "k8s-service-range"
            },
        ]
      + self_link                  = (known after apply)
      + stack_type                 = (known after apply)
    }

  # google_container_cluster.primary will be created
  + resource "google_container_cluster" "primary" {
      + cluster_ipv4_cidr           = (known after apply)
      + datapath_provider           = (known after apply)
      + default_max_pods_per_node   = (known after apply)
      + enable_binary_authorization = false
      + enable_intranode_visibility = (known after apply)
      + enable_kubernetes_alpha     = false
      + enable_legacy_abac          = false
      + enable_shielded_nodes       = true
      + endpoint                    = (known after apply)
      + id                          = (known after apply)
      + initial_node_count          = 1
      + label_fingerprint           = (known after apply)
      + location                    = "us-central1-a"
      + logging_service             = "logging.googleapis.com/kubernetes"
      + master_version              = (known after apply)
      + monitoring_service          = "monitoring.googleapis.com/kubernetes"
      + name                        = "primary"
      + network                     = (known after apply)
      + networking_mode             = "VPC_NATIVE"
      + node_locations              = [
          + "us-central1-b",
        ]
      + node_version                = (known after apply)
      + operation                   = (known after apply)
      + private_ipv6_google_access  = (known after apply)
      + project                     = (known after apply)
      + remove_default_node_pool    = true
      + self_link                   = (known after apply)
      + services_ipv4_cidr          = (known after apply)
      + subnetwork                  = (known after apply)
      + tpu_ipv4_cidr_block         = (known after apply)

      + addons_config {
          + cloudrun_config {
              + disabled           = (known after apply)
              + load_balancer_type = (known after apply)
            }

          + dns_cache_config {
              + enabled = (known after apply)
            }

          + gce_persistent_disk_csi_driver_config {
              + enabled = (known after apply)
            }

          + gcp_filestore_csi_driver_config {
              + enabled = (known after apply)
            }

          + horizontal_pod_autoscaling {
              + disabled = false
            }

          + http_load_balancing {
              + disabled = true
            }

          + network_policy_config {
              + disabled = (known after apply)
            }
        }

      + authenticator_groups_config {
          + security_group = (known after apply)
        }

      + cluster_autoscaling {
          + enabled = (known after apply)

          + auto_provisioning_defaults {
              + boot_disk_kms_key = (known after apply)
              + image_type        = (known after apply)
              + oauth_scopes      = (known after apply)
              + service_account   = (known after apply)
            }

          + resource_limits {
              + maximum       = (known after apply)
              + minimum       = (known after apply)
              + resource_type = (known after apply)
            }
        }

      + confidential_nodes {
          + enabled = (known after apply)
        }

      + database_encryption {
          + key_name = (known after apply)
          + state    = (known after apply)
        }

      + default_snat_status {
          + disabled = (known after apply)
        }

      + ip_allocation_policy {
          + cluster_ipv4_cidr_block       = (known after apply)
          + cluster_secondary_range_name  = "k8s-pod-range"
          + services_ipv4_cidr_block      = (known after apply)
          + services_secondary_range_name = "k8s-service-range"
        }

      + logging_config {
          + enable_components = (known after apply)
        }

      + master_auth {
          + client_certificate     = (known after apply)
          + client_key             = (sensitive value)
          + cluster_ca_certificate = (known after apply)

          + client_certificate_config {
              + issue_client_certificate = (known after apply)
            }
        }

      + mesh_certificates {
          + enable_certificates = (known after apply)
        }

      + monitoring_config {
          + enable_components = (known after apply)
        }

      + node_config {
          + boot_disk_kms_key = (known after apply)
          + disk_size_gb      = (known after apply)
          + disk_type         = (known after apply)
          + guest_accelerator = (known after apply)
          + image_type        = (known after apply)
          + labels            = (known after apply)
          + local_ssd_count   = (known after apply)
          + machine_type      = (known after apply)
          + metadata          = (known after apply)
          + min_cpu_platform  = (known after apply)
          + node_group        = (known after apply)
          + oauth_scopes      = (known after apply)
          + preemptible       = (known after apply)
          + service_account   = (known after apply)
          + spot              = (known after apply)
          + tags              = (known after apply)
          + taint             = (known after apply)

          + gcfs_config {
              + enabled = (known after apply)
            }

          + gvnic {
              + enabled = (known after apply)
            }

          + reservation_affinity {
              + consume_reservation_type = (known after apply)
              + key                      = (known after apply)
              + values                   = (known after apply)
            }

          + shielded_instance_config {
              + enable_integrity_monitoring = (known after apply)
              + enable_secure_boot          = (known after apply)
            }

          + workload_metadata_config {
              + mode = (known after apply)
            }
        }

      + node_pool {
          + initial_node_count          = (known after apply)
          + instance_group_urls         = (known after apply)
          + managed_instance_group_urls = (known after apply)
          + max_pods_per_node           = (known after apply)
          + name                        = (known after apply)
          + name_prefix                 = (known after apply)
          + node_count                  = (known after apply)
          + node_locations              = (known after apply)
          + version                     = (known after apply)

          + autoscaling {
              + location_policy      = (known after apply)
              + max_node_count       = (known after apply)
              + min_node_count       = (known after apply)
              + total_max_node_count = (known after apply)
              + total_min_node_count = (known after apply)
            }

          + management {
              + auto_repair  = (known after apply)
              + auto_upgrade = (known after apply)
            }

          + node_config {
              + boot_disk_kms_key = (known after apply)
              + disk_size_gb      = (known after apply)
              + disk_type         = (known after apply)
              + guest_accelerator = (known after apply)
              + image_type        = (known after apply)
              + labels            = (known after apply)
              + local_ssd_count   = (known after apply)
              + machine_type      = (known after apply)
              + metadata          = (known after apply)
              + min_cpu_platform  = (known after apply)
              + node_group        = (known after apply)
              + oauth_scopes      = (known after apply)
              + preemptible       = (known after apply)
              + service_account   = (known after apply)
              + spot              = (known after apply)
              + tags              = (known after apply)
              + taint             = (known after apply)

              + gcfs_config {
                  + enabled = (known after apply)
                }

              + gvnic {
                  + enabled = (known after apply)
                }

              + reservation_affinity {
                  + consume_reservation_type = (known after apply)
                  + key                      = (known after apply)
                  + values                   = (known after apply)
                }

              + shielded_instance_config {
                  + enable_integrity_monitoring = (known after apply)
                  + enable_secure_boot          = (known after apply)
                }

              + workload_metadata_config {
                  + mode = (known after apply)
                }
            }

          + upgrade_settings {
              + max_surge       = (known after apply)
              + max_unavailable = (known after apply)
            }
        }

      + notification_config {
          + pubsub {
              + enabled = (known after apply)
              + topic   = (known after apply)
            }
        }

      + private_cluster_config {
          + enable_private_nodes   = true
          + master_ipv4_cidr_block = "172.16.0.0/28"
          + peering_name           = (known after apply)
          + private_endpoint       = (known after apply)
          + public_endpoint        = (known after apply)

          + master_global_access_config {
              + enabled = (known after apply)
            }
        }

      + release_channel {
          + channel = "REGULAR"
        }

      + service_external_ips_config {
          + enabled = (known after apply)
        }

      + vertical_pod_autoscaling {
          + enabled = (known after apply)
        }

      + workload_identity_config {
          + workload_pool = "your-project-id.svc.id.goog"
        }
    }

  # google_container_node_pool.general will be created
  + resource "google_container_node_pool" "general" {
      + cluster                     = (known after apply)
      + id                          = (known after apply)
      + initial_node_count          = (known after apply)
      + instance_group_urls         = (known after apply)
      + location                    = (known after apply)
      + managed_instance_group_urls = (known after apply)
      + max_pods_per_node           = (known after apply)
      + name                        = "general"
      + name_prefix                 = (known after apply)
      + node_count                  = 1
      + node_locations              = (known after apply)
      + operation                   = (known after apply)
      + project                     = (known after apply)
      + version                     = (known after apply)

      + management {
          + auto_repair  = true
          + auto_upgrade = true
        }

      + node_config {
          + disk_size_gb      = (known after apply)
          + disk_type         = (known after apply)
          + guest_accelerator = (known after apply)
          + image_type        = (known after apply)
          + labels            = {
              + "role" = "general"
            }
          + local_ssd_count   = (known after apply)
          + machine_type      = "e2-small"
          + metadata          = (known after apply)
          + min_cpu_platform  = (known after apply)
          + oauth_scopes      = [
              + "https://www.googleapis.com/auth/cloud-platform",
            ]
          + preemptible       = false
          + service_account   = (known after apply)
          + spot              = false
          + taint             = (known after apply)

          + shielded_instance_config {
              + enable_integrity_monitoring = (known after apply)
              + enable_secure_boot          = (known after apply)
            }

          + workload_metadata_config {
              + mode = (known after apply)
            }
        }

      + upgrade_settings {
          + max_surge       = (known after apply)
          + max_unavailable = (known after apply)
        }
    }

  # google_container_node_pool.spot will be created
  + resource "google_container_node_pool" "spot" {
      + cluster                     = (known after apply)
      + id                          = (known after apply)
      + initial_node_count          = (known after apply)
      + instance_group_urls         = (known after apply)
      + location                    = (known after apply)
      + managed_instance_group_urls = (known after apply)
      + max_pods_per_node           = (known after apply)
      + name                        = "spot"
      + name_prefix                 = (known after apply)
      + node_count                  = (known after apply)
      + node_locations              = (known after apply)
      + operation                   = (known after apply)
      + project                     = (known after apply)
      + version                     = (known after apply)

      + autoscaling {
          + max_node_count = 10
          + min_node_count = 0
        }

      + management {
          + auto_repair  = true
          + auto_upgrade = true
        }

      + node_config {
          + disk_size_gb      = (known after apply)
          + disk_type         = (known after apply)
          + guest_accelerator = (known after apply)
          + image_type        = (known after apply)
          + labels            = {
              + "team" = "devops"
            }
          + local_ssd_count   = (known after apply)
          + machine_type      = "e2-small"
          + metadata          = (known after apply)
          + min_cpu_platform  = (known after apply)
          + oauth_scopes      = [
              + "https://www.googleapis.com/auth/cloud-platform",
            ]
          + preemptible       = true
          + service_account   = (known after apply)
          + spot              = false
          + taint             = [
              + {
                  + effect = "NO_SCHEDULE"
                  + key    = "instance_type"
                  + value  = "spot"
                },
            ]

          + shielded_instance_config {
              + enable_integrity_monitoring = (known after apply)
              + enable_secure_boot          = (known after apply)
            }

          + workload_metadata_config {
              + mode = (known after apply)
            }
        }

      + upgrade_settings {
          + max_surge       = (known after apply)
          + max_unavailable = (known after apply)
        }
    }

  # google_project_iam_member.svc-devenes will be created
  + resource "google_project_iam_member" "svc-devenes" {
      + etag    = (known after apply)
      + id      = (known after apply)
      + member  = (known after apply)
      + project = "your-project-id"
      + role    = "roles/storage.admin"
    }

  # google_project_service.compute will be created
  + resource "google_project_service" "compute" {
      + disable_on_destroy = true
      + id                 = (known after apply)
      + project            = (known after apply)
      + service            = "compute.googleapis.com"
    }

  # google_project_service.container will be created
  + resource "google_project_service" "container" {
      + disable_on_destroy = true
      + id                 = (known after apply)
      + project            = (known after apply)
      + service            = "container.googleapis.com"
    }

  # google_service_account.kubernetes will be created
  + resource "google_service_account" "kubernetes" {
      + account_id = "kubernetes"
      + disabled   = false
      + email      = (known after apply)
      + id         = (known after apply)
      + name       = (known after apply)
      + project    = (known after apply)
      + unique_id  = (known after apply)
    }

  # google_service_account.svc-devenes will be created
  + resource "google_service_account" "svc-devenes" {
      + account_id = "svc-devenes"
      + disabled   = false
      + email      = (known after apply)
      + id         = (known after apply)
      + name       = (known after apply)
      + project    = (known after apply)
      + unique_id  = (known after apply)
    }

  # google_service_account_iam_member.svc-devenes will be created
  + resource "google_service_account_iam_member" "svc-devenes" {
      + etag               = (known after apply)
      + id                 = (known after apply)
      + member             = (known after apply)
      + role               = "roles/iam.workloadIdentityUser"
      + service_account_id = (known after apply)
    }

Plan: 15 to add, 0 to change, 0 to destroy.
```

## Apply

```ruby
$ terraform apply
google_project_service.compute: Refreshing state... [id=your-project-id/compute.googleapis.com]
google_project_service.container: Refreshing state... [id=your-project-id/container.googleapis.com]
google_service_account.svc-devenes: Refreshing state... [id=projects/your-project-id/serviceAccounts/svc-devenes@your-project-id.iam.gserviceaccount.com]
google_service_account.kubernetes: Refreshing state... [id=projects/your-project-id/serviceAccounts/kubernetes@your-project-id.iam.gserviceaccount.com]
google_service_account_iam_member.svc-devenes: Refreshing state... [id=projects/your-project-id/serviceAccounts/svc-devenes@your-project-id.iam.gserviceaccount.com/roles/iam.workloadIdentityUser/serviceAccount:your-project-id.svc.id.goog[staging/svc-devenes]]
google_project_iam_member.svc-devenes: Refreshing state... [id=your-project-id/roles/storage.admin/serviceAccount:svc-devenes@your-project-id.iam.gserviceaccount.com]
google_compute_network.main: Refreshing state... [id=projects/your-project-id/global/networks/main]
google_compute_address.nat: Refreshing state... [id=projects/your-project-id/regions/us-central1/addresses/nat]
google_compute_router.router: Refreshing state... [id=projects/your-project-id/regions/us-central1/routers/router]
google_compute_subnetwork.private: Refreshing state... [id=projects/your-project-id/regions/us-central1/subnetworks/private]
google_compute_firewall.allow_ssh: Refreshing state... [id=projects/your-project-id/global/firewalls/allow-ssh]
google_compute_router_nat.nat: Refreshing state... [id=your-project-id/us-central1/router/nat]
google_container_cluster.primary: Refreshing state... [id=projects/your-project-id/locations/us-central1-a/clusters/primary]
google_container_node_pool.spot: Refreshing state... [id=projects/your-project-id/locations/us-central1-a/clusters/primary/nodePools/spot]
google_container_node_pool.general: Refreshing state... [id=projects/your-project-id/locations/us-central1-a/clusters/primary/nodePools/general]

No changes. Your infrastructure matches the configuration.
```

## Add Nginx Ingress with Helm

```ruby
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm search repo nginx
helm install nginx-ingress ingress-nginx/ingress-nginx
```

```ruby
helm install my-ing ingress-nginx/ingress-nginx \
  --namespace ingress \
  --version 4.2.5 \
  --values nginx-values.yaml \
  --create-namespace
```
