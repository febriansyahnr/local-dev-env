resource "docker_network" "local_network" {
  name = "tf_local_network"
  check_duplicate = true
}