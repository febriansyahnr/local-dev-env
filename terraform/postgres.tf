resource "docker_image" "postgres" {
  name         = "postgres:16-alpine"
  keep_locally = true
}

resource "docker_container" "postgres" {
  image   = docker_image.postgres.image_id
  name    = "postgres"
  restart = "always"

  env = [
    "POSTGRES_PASSWORD=${var.postgres_config.root_password}",
  ]

  ports {
    internal = 5432
    external = var.postgres_config.external_port
  }

  networks_advanced {
    name = docker_network.local_network.name
  }

  remove_volumes = false
  volumes {
    host_path      = abspath("${path.cwd}/../_data/postgres")
    container_path = "/var/lib/postgresql/data"
  }
}

