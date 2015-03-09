Rails.application.routes.draw do

  get 'admin' => 'admin#index'

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  resources :users

  root "store#index" , as: 'store'

  post '/line_items/:product_id', to: 'line_items#create', as: :line_items
  delete '/line_items/:id', to: 'line_items#destroy', as: :destroy_line_item

  get '/carts/:id', to: 'carts#show', as: :cart
  delete '/carts/:id', to: 'carts#destroy', as: :destroy_cart


  resources :users do
    member do
      get 'display'
    end
  end

  scope module: :admin do
    resources :posts, :comments
  end


  resources :products do
    collection do
      get 'search'
      post 'outofstock'
    end
  end

  resources :orders do
    resources :products
    member do
      get 'status'
      get 'last_edited'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
