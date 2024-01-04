local config
config = require("lapis.config").config
config("production", function()
  local server = "nginx"
  num_workers("2")
  return code_cache("on")
end)
return config("development", function()
  server("nginx")
  code_cache("on")
  num_workers("1")
  return postgres(function()
    host("127.0.0.1")
    user("shop")
    password("shop")
    database("shop")
    return port("5440")
  end)
end)
