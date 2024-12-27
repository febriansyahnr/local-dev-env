resource "docker_image" "consul" {
  name = "hashicorp/consul:latest"
  keep_locally = true
}

resource "docker_container" "consul" {
  image = docker_image.consul.image_id
  name = "consul-server"
  restart = "always"

  command = [
  "agent",
  "-server",
  "-ui",
  "-bind", "0.0.0.0",
  "-client", "0.0.0.0",
  "-bootstrap",
  "-bootstrap-expect", "1"
  ]

  env = [
    "CONSUL_BIND_INTERFACE=eth0",
    "CONSUL_LOCAL_CONFIG={\"leave_on_terminate\": true}",
  ]

  ports {
    internal = 8500
    external = var.consul_config.main_port
  }

  ports {
    internal = 8600
    external = var.consul_config.udp_port
    protocol = "udp"
  }

  remove_volumes = false
  volumes {
    host_path = abspath("${path.cwd}/../_data/consul/data")
    container_path = "/consul/data"
  }
  volumes {
    host_path = abspath("${path.cwd}/../_data/consul/config")
    container_path = "/consul/config"
  }
}
