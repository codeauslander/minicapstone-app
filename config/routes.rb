Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'all_products_url'=>'products#all_products_method'
  
  get 'first_product_url'=>'products#first_product_method'

  get '/products'=>'products#index'

  post '/products'=>'products#create'

  get '/products/:id'=>'products#show'

  patch '/products/:id'=>'products#update'

  # put 'products/:id'=>'products#update'

  delete '/products/:id'=>'products#destroy'

  
end
