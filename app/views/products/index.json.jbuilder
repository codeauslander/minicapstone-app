json.array! @products.each do |product|
  json.id product.id
  json.name product.name
  json.price product.price
  json.is_discounted product.is_discounted
  json.tax product.tax
  json.total product.total
  json.image_url product.image_url
  json.description product.description
  json.in_stock product.in_stock
  json.supplier_name product.supplier.name
end
