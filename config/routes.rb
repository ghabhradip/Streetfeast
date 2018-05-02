StreetFeast::Application.routes.draw do
  get "blog/create"
  get "management/show_users"
  get "home/index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'home#dummy_homepage'
  # root 'home#under_construction'
  root 'home#index'

  get 'test_email' => 'application#test_email'

  get 'home/blacklist' => 'home#blacklist'
  post 'home/blacklist' => 'home#blacklist'

  get 'home/analytics' => 'home#analytics'
  post 'home/analytics' => 'home#analytics'

  get 'home/undo_blacklist' => 'home#undo_blacklist'
  post 'home/undo_blacklist' => 'home#undo_blacklist'

  get 'home/dashboard' => 'home#dashboard', as: :dashboard
  get 'home/dashboard_user' => 'home#dashboard_user'
  get 'home/:id/edit' => 'home#edit'
  patch 'home/:id/update' => 'home#update'
  post 'blog/create' => 'blog#create'
  post 'blog/create_blog_user' => 'blog#create_blog_user'
  get 'blog/new' => 'blog#new'

  get 'blog/edit/:id' => 'blog#edit'
  get 'blog/show/:id' => 'blog#show'

  patch 'blog/update/:id' => 'blog#update'

  post 'blog/add_picture_to_blog' => 'blog#add_picture_to_blog'
  get 'user/show/:id' => 'user#show'
  patch 'user/update/:id' => 'user#update'

  delete 'user/photo_remove/:id' => "user#photo_remove"


  patch 'blog/update_blog_user/:id' => 'blog#update_blog_user'



  get 'restaurant/new' => 'restaurant#new'

  post 'restaurant/create' => 'restaurant#create'

  get 'restaurant/show/:id' => 'restaurant#show'

  get 'restaurant/show_for_user/:id' => 'restaurant#show_for_user'

  get 'restaurant/show_pic/:id' => 'restaurant#show_pic'

  get 'like/pic_like/:id' => 'like#pic_like'

  get 'restaurant/address/:id' => 'restaurant#address'

  patch 'restaurant/update/:id' => 'restaurant#update'
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
