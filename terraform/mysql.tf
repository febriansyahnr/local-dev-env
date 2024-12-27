resource "docker_image" "mysql" {
  name         = "mysql"
  keep_locally = true
}

resource "docker_container" "mysql" {
  image   = docker_image.mysql.image_id
  name    = "mysql"
  restart = "always"

  env = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_config.root_password}",
  ]

  ports {
    internal = 3306
    external = var.mysql_config.external_port
  }

  networks_advanced {
    name = docker_network.local_network.name
  }

  remove_volumes = false
  volumes {
    host_path      = abspath("${path.cwd}/../_data/mysql")
    container_path = "/var/lib/mysql"
  }
}

