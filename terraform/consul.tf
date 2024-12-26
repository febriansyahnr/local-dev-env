resource "docker_image" "consul" {
  name = "hashicorp/consul:latest"
  keep_locally = true
}

resource "docker_container" "consul" {
  image = docker_image.consul.image_id
  name = "consul-server"
  restart = "always"

  env = [
    "CONSUL_BIND_INTERFACE=eth0",
    "CONSUL_LOCAL_CONFIG={\"leave_on_terminate\": true}",
  ]

  ports {
    internal = 8500
    external = 8500
  }

  ports {
    internal = 8600
    external = 8600
    protocol = "udp"
  }

  remove_volumes = false
  volumes {
    volume_name = "consul-data"
    container_path = "/consul/data"
  }
}