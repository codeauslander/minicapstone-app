# Product.create!([
#   {name: "table", price: "46561339.0", description: "wood aaaaaaaaaaaaaaaaaaa", in_stock: true, supplier_id: 1},
#   {name: "chair", price: "10000000.0", description: "dark wood bbbbbbbbbbbbbb", in_stock: true, supplier_id: 2},
#   {name: "coach", price: "20000000.0", description: "light wood cccccccccccccccccccc", in_stock: true, supplier_id: 3},
#   {name: "board", price: "30000000.0", description: "middle wood ddddddddddddddddddddd", in_stock: true, supplier_id: 1}

# ])

# Image.create!([
#   {name:"Chicago",url:"https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Chicago_from_North_Avenue_Beach_June_2015_panorama_2.jpg/800px-Chicago_from_North_Avenue_Beach_June_2015_panorama_2.jpg",product_id:"1"},
#   {name:"Chicago 2",url:"https://nextcity.org/images/daily/_resized/CHICAGO_1.jpg",product_id:"2"},
#   {name:"Chicago 3",url:"http://theurbanbuzz.com/wp-content/uploads/2015/10/Chicago1.jpg",product_id:"2"}
# ])


# Order.create!([
#     {user_id:1, product_id:110, quantity:2}
#   ])

Category.create(name:"wood")
Category.create(name:"glass")
Category.create(name:"stone")

CategoryProduct.create([
    {category_id:1,product_id:110},
    {category_id:2,product_id:111},
    {category_id:3,product_id:110}
  ])

