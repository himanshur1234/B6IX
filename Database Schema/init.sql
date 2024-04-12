Table orders {
  id int [primary key]
  user_id int [not null, unique]
  status varchar
  created_at varchar
}

Table order_items [headercolor: #d35400] {
  order_id int
  product_id int
  quantity int
}

Table products [headercolor: #d35400] {
  id int [primary key]
  name varchar
  merchant_id int [not null]
  price int
  status varchar
  created_at varchar
  category_id int
}

Table users {
  id int [primary key]
  full_name varchar
  email varchar [unique]
  gender varchar
  date_of_birth varchar
  created_at varchar
  country_code int
}

Table merchants {
  id int [primary key]
  admin_id int
  merchant_name varchar
  country_code int
  created_at varchar
  
}

Table categories [headercolor: #d35400] {
  id int [primary key]
  cat_name varchar
  parent_id int
}

Table countries {
  code int [primary key]
  name varchar
  continent_name varchar
}

Ref {
  orders.user_id > users.id
}
Ref {
  order_items.order_id > orders.id
}

Ref {
  order_items.product_id > products.id
}

Ref {
  products.merchant_id > merchants.id
}

Ref {
  products.category_id > categories.id
}

Ref {
  categories.parent_id > categories.id
}

Ref {
  users.country_code > countries.code
}

Ref {
  merchants.admin_id > users.id
}

Ref {
  merchants.country_code > countries.code
}

tablegroup product_group {
  products
  order_items
  categories
}
