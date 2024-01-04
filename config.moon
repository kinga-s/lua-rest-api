import config from require "lapis.config"

config "production", ->
  server = "nginx"
  num_workers "2"
  code_cache "on"

config "development", ->
  server "nginx"
  code_cache "on"
  num_workers "1"
  postgres ->
    host "127.0.0.1"
    user "shop"
    password "shop"
    database "shop"
    port "5440"