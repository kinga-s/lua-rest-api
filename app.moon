lapis = require "lapis"
db = require "lapis.db.postgres"
import Model from require "lapis.db.postgres.model"

class Product extends Model

class extends lapis.Application
    [new: "/new"]: => respond_to {
        POST: =>
            new_product = Product\create name: @params.name
            json: new_product
    }

    [single_product: "/:product_id"]: => respond_to {
        before: =>
            @product = Product\find @params.product_id
            @write status: 404, "Not Found" unless @product

        GET: =>
            json: @product

        PUT: =>
            @product.name = @params.name
            @product\update "name"
            json: @product

        DELETE: =>
            @product\delete!
            json: "Product was deleted"
    }

    [index: "/"]: =>
        @products = Product\select!
        json: @products
