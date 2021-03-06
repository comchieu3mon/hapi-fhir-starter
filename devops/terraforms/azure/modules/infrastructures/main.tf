terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.3.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.1.2"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.11.1"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.12.2"
    }
  }
}

variable "project_name" {
  type    = string
  default = "healthcarelab"
}

variable "k8s_version" {
  type    = string
  default = "1.2.1"
}

variable "kubernetes" {
  type = object({
    host                   = string
    client_key             = string
    client_certificate     = string
    cluster_ca_certificate = string
    kube_config            = string
  })
}

variable "domain" {
  type = string
}

provider "kubectl" {
  host                   = var.kubernetes.host
  client_key             = var.kubernetes.client_key
  client_certificate     = var.kubernetes.client_certificate
  cluster_ca_certificate = var.kubernetes.cluster_ca_certificate
  load_config_file       = false
}

provider "kubernetes" {
  host                   = var.kubernetes.host
  client_key             = var.kubernetes.client_key
  client_certificate     = var.kubernetes.client_certificate
  cluster_ca_certificate = var.kubernetes.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = var.kubernetes.host
    client_key             = var.kubernetes.client_key
    client_certificate     = var.kubernetes.client_certificate
    cluster_ca_certificate = var.kubernetes.cluster_ca_certificate
  }
}
