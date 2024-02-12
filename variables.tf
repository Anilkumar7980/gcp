variable "project_id" {
  type = string
}

variable "region" {
  type = string
  default = "asia-south1"
}

variable "zone" {
  type = string
  default = "asia-south1-a"
}

variable "vpc_name" {
  type = string
  default = "gcp-infra"
}

variable "public_subnet_cidr" {
  type = string
  default = "10.10.10.0/24"
}

variable "private_subnet_cidr" {
  type = string
  default = "10.10.20.0/24"
}

# ... (Existing variables from previous response)

variable "db_password" {
  type = string
  sensitive = true
}

variable "gke_num_nodes" {
  type = number
  default = 1
}

variable "gke_node_type" {
  description = "The machine type for GKE nodes"
  type        = string
  default     = "e2-standard-2"
}


variable "google_credentials" {
  type = string
  default = <<JSON
{
  "type": "service_account",
  "project_id": "cicd-project-412206",
  "private_key_id": "d7cc05fe2e8b0a5e29204426f25ffb4ca99e172f",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC8kkPBhGl62/4m\ns6DFtWhUK+/nI7+W1i2TlSqSljSb1AalH3McfiNr7BOTnCX2kqyhI+ObTrC0uOw1\n4u7ZupbC19tswp8OAoJISV8Ij74EDTtqZ1ERSG9danvFqH4CiTWw3P+WfB+athyB\n73fKmlbBBbU9eE0xbJ6K6DE4cjVu2Y/zINxrEWlgG5lgTJpZujBMLmVW4HI6rjf9\nQD2aFU59427MH6Ymv8LDBwXsU3Zf6P18Di4HobuPAJTdxKL4rgxvU7bVGwzpDlut\noGi0bsEPtvl8pktUsqwcueek1aqFNCdoDpWGxcc9ba76ZUz+JNzjR0fD36ysREOn\nxqq5bvA9AgMBAAECggEADKSZ2l2wXMZnMd0VSGwzRIF1oj+pVsmhYKW9pvpfKJt8\nnpGPP



