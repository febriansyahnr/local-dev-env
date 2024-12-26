resource "docker_image" "redis" {
  name = "redis"
  keep_locally = true
}

resource "docker_container" "redis" {
  image = docker_image.redis.image_id
  name =  "redis"
  restart = "always"
  remove_volumes = false
  ports {
    internal = 6379
    external = var.redis_config.port
  }
}