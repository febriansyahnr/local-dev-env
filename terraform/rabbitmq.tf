resource "docker_image" "rabbitmq" {
  name = "masstransit/rabbitmq"
  keep_locally = true
}

resource "docker_container" "rabbitmq" {
  image = docker_image.rabbitmq.image_id
  name = "rmq"
  restart = "always"
  remove_volumes = false

  ports {
    internal = 5672
    external = 5672
  }
  ports {
    internal = 15671
    external = 8071
  }
  ports {
    internal = 15672
    external = 8072
  }
}