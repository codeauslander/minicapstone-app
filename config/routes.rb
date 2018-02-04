Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'all_products_url'=>'products#all_products_method'
  get 'first_product_url'=>'products#first_product_method'

  get '/products'=>'products#index'
  post '/products'=>'products#create'
  get '/products/:id'=>'products#show'
  patch '/products/:id'=>'products#update'
  # put 'products/:id'=>'products#update'
  delete '/products/:id'=>'products#destroy'

  get '/suppliers' => 'suppliers#index'
  post '/suppliers' => 'suppliers#create'
  get '/suppliers/:id' => 'suppliers#show'
  patch '/suppliers/:id' => 'suppliers#update'
  delete '/suppliers/:id' => 'suppliers#destroy'

  post '/users' => 'users#create'

  get '/orders' => 'orders#index'
  post '/orders' => 'orders#create'

  get '/categories' => 'categories#index'

  get '/carted_products' => 'carted_products#index'
  post '/carted_products' => 'carted_products#create'


  
end
