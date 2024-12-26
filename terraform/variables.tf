# Setup terraform variables

# Mysql Config
variable "mysql_config" {
  description = "dynamic configuration for mysql"
  type = object({
    root_password = string,
    external_port = number,
  })
  default = {
    external_port = 3306,
    root_password = "123qweasdzxc",
  }
}

# Rabbitmq config
variable "rabbitmq_config" {
  description = "dynamic configuration for rabbitmq"
  type = object({
    main_port = number,
    http_port = number,
    https_port = number,
  })
  default = {
    main_port = 5672,
    http_port = 15671,
    https_port = 15672,
  }
}

# Redis config
variable "redis_config" {
  description = "dynamic configuration for redis"
  type = object({
    port = number,
  })
  default = {
    port = 6379,
  }
}

# Consul config
variable "consul_config"  {
  type = object({
    main_port = number,
    udp_port = number,
  })
  default = {
    main_port = 8500,
    udp_port = 8600,
  }
}