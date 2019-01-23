Rails.application.routes.draw do
  
  root    'home#index'
  get     'auth'                    => 'home#auth'
  post    'user_token'              => 'user_token#create'
  
  get     '/users'                  =>  'users#index'

  post    '/users/create'           =>  'users#create'
  patch   '/user/:id'               =>  'users#update'
  delete  '/user/:id'               =>  'users#destroy'

  post    '/products/create'        =>  'products#create'
  get     '/products'               =>  'products#index'
  get     '/product/:id'		        =>  'products#show'
  get     '/products/user/:id'      =>  'products#show_by_userid'
  get     '/products/user'          =>  'products#show_your_product'
  get     '/products/category/:id'  =>  'products#show_by_category'
  patch   '/product/:id'            =>  'products#update'
  delete  '/product/:id'            =>  'products#delete'

  post    '/categories/create'      =>  'categories#create'
  get     '/categories'             =>  'categories#index'
  get     '/category/:name'         =>  'categories#show'
  delete  '/category/:id'           =>  'categories#delete'
  patch   '/category/:id'           =>  'categories#update'

end
