local lapis = require("lapis")
local db = require("lapis.db.postgres")
local Model
Model = require("lapis.db.postgres.model").Model
local Product
do
  local _class_0
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = "Product",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Product = _class_0
end
do
  local _class_0
  local _parent_0 = lapis.Application
  local _base_0 = {
    [{
      new = "/new"
    }] = function(self)
      return respond_to({
        POST = function(self)
          local new_product = Product:create({
            name = self.params.name
          })
          return {
            json = new_product
          }
        end
      })
    end,
    [{
      single_product = "/:product_id"
    }] = function(self)
      return respond_to({
        before = function(self)
          self.product = Product:find(self.params.product_id)
          if not (self.product) then
            return self:write({
              status = 404
            }, "Not Found")
          end
        end,
        GET = function(self)
          return {
            json = self.product
          }
        end,
        PUT = function(self)
          self.product.name = self.params.name
          self.product:update("name")
          return {
            json = self.product
          }
        end,
        DELETE = function(self)
          self.product:delete()
          return {
            json = "Product was deleted"
          }
        end
      })
    end,
    [{
      index = "/"
    }] = function(self)
      self.products = Product:select()
      return {
        json = self.products
      }
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = nil,
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  return _class_0
end
