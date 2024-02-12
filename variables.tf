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


variable "google_application_credentials" {
  type    = string
  default = <<JSON
{
  "type": "service_account",
  "project_id": "cicd-project-412206",
  "private_key_id": "d7cc05fe2e8b0a5e29204426f25ffb4ca99e172f",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC8kkPBhGl62/4m\ns6DFtWhUK+/nI7+W1i2TlSqSljSb1AalH3McfiNr7BOTnCX2kqyhI+ObTrC0uOw1\n4u7ZupbC19tswp8OAoJISV8Ij74EDTtqZ1ERSG9danvFqH4CiTWw3P+WfB+athyB\n73fKmlbBBbU9eE0xbJ6K6DE4cjVu2Y/zINxrEWlgG5lgTJpZujBMLmVW4HI6rjf9\nQD2aFU59427MH6Ymv8LDBwXsU3Zf6P18Di4HobuPAJTdxKL4rgxvU7bVGwzpDlut\noGi0bsEPtvl8pktUsqwcueek1aqFNCdoDpWGxcc9ba76ZUz+JNzjR0fD36ysREOn\nxqq5bvA9AgMBAAECggEADKSZ2l2wXMZnMd0VSGwzRIF1oj+pVsmhYKW9pvpfKJt8\nnpGPPDfQ1CmN3nW3reKDpIItfno2KsfDPpGqhfqWpRWn5pDd7SiJ56LTtlU83jSs\n6SNoMgpzPQYoqkXzvOPKL8OBd2t3Cv5uxt9xXqoeau6hCjAIrOmlb5bFxg0SPA5I\nZfEov8dbQm7UT36qauoI7Sj7i28Azuiej+P6fOb4m9j6Jv1r3tgog/swX2u6rLsA\ngLBlxaekGpOZGDP+upNNIRfoF5d1AnjubGgoJ0zbmdbPmpFQFe4XNaVKa8EkP53p\ngzMavudDzMBcKJzVoNgB9azA1nNY4wQe8VlqVG8zQQKBgQD/h7gABuulqWHrN5jF\nK6wWzHa/B1E2UQkCjmir11Eh6OVej4xB1lTYKoAsni1jT/Qcp7ra+IB6hT0vJ0Ji\nFaYbyEi7GQaKZaA4vt0IwP8w08hsSJqc7JAaOsovhg++QSWU87gqg8RtNFrSQqry\nxOqY1Wd8NJbcSkDoqQ0SQXrt6QKBgQC86wcO6EclXzYzF6IgXIVtjvy02hKoSKUB\nqtHWdTGeBvnAiYFlsmlShpl4ygGY64D7pcfR8vc0F2ntW1Mfwt55qPajrEJieUvT\nno/W1eWMWSeuGU7+RNGFMmygo2a5TSLl0d6E/u0m/2SbpDX4A4gsL4H289UlTn7B\nVSnxJqXXNQKBgHU4XUAl7JPiT/kHWB2bGyaaRR78zFSOeAOkMIAkFiPoItBuKXlK\nSUGgvYu6RDf6xZEfoKgytz19QcQPznQQWlMEXdj2cfmrBQUDCYKqhmZvwNFrvQGf\nw7tEnNuQNEiiugrKgwF90O4HxmIOEz2q97OEsiRYO5xys7QHWOe3Ah2BAoGADQhF\nl2Csr8ZOrd2egI8BYVpw0mUMzn


