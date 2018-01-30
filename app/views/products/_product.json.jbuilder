json.id product.id

json.name product.name
json.description product.description
json.images product.images

json.price product.price
json.tax product.tax
json.total product.total

 json.formatted do
                  json.price number_to_currency(product.price)
                  json.tax number_to_currency(product.tax)
                  json.total number_to_currency(product.total)
                 end

json.is_discounted product.is_discounted
json.in_stock product.in_stock
json.supplier product.supplier