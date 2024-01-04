local create_table, types
do
  local _obj_0 = require("lapis.db.schema")
  create_table, types = _obj_0.create_table, _obj_0.types
end
return {
  function(self)
    return create_table("product", {
      {
        "id",
        types.serial
      },
      {
        "name",
        types.text
      },
      "PRIMARY KEY (id)"
    })
  end
}
