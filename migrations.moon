import create_table, types from require "lapis.db.schema"

{
  =>
    create_table "product", {
      {"id", types.serial}
      {"name", types.text}

      "PRIMARY KEY (id)"
    }
}