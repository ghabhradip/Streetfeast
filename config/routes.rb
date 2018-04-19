StreetFeast::Application.routes.draw do
  get "blog/create"
  get "management/show_users"
  get "home/index"
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'home#index'
  # root 'home#under_construction'
  root 'home#index'

  get 'test_email' => 'application#test_email'
  get 'home/dashboard' => 'home#dashboard', as: :dashboard
  get 'home/dashboard_user' => 'home#dashboard_user'
  get 'home/:id/edit' => 'home#edit'
  patch 'home/:id/update' => 'home#update'
  post 'blog/create' => 'blog#create'
  post 'blog/create_blog_user' => 'blog#create_blog_user'
  get 'blog/new' => 'blog#new'

  get 'blog/edit/:id' => 'blog#edit'

  patch 'blog/update/:id' => 'blog#update'
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
