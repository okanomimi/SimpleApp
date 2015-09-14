SimpleApp::Application.routes.draw do
  resources :my_threads

  resources :categories
  # root :to => "tweets#index"
  
  # get "users/new"
  # get "users/index"
  # get "users/:id" => "users#show"
  # get "users/:id"
  # get "users/:id" => "users/show"
  
  # root :to => "tweets#index"
  root :to => "categories#show_threads" #初期はスレッド一覧
  get ":category_id/show_tweet/:thread_id" => "my_threads#show_tweets"
  post ":category_id/show_tweet/:thread_id/:user_id" => "tweets#create"
  get "/:id" => "tweets#index"

  #after
  get "categories/show_threads/:category_id" => "categories#show_threads"
  get "my_threads/show_tweets/:id" => "tweets#index"
  get "categories/show_threads/:category_id/show_tweet/:thread_id" => "my_threads#show_tweets"
  get "categories/show_threads/:category_id/show_tweet/:thread_id/:user_id" => "my_threads#show_tweets"
  post "categories/show_threads/:category_id/show_tweet/:thread_id/:user_id" => "tweets#create"

  # before 
  get "tweets/index/:id" => "tweets#index"
  get "tweets/index/:category_id/:id" => "tweets#index"
  post "tweets/index" => "tweets#count"
  get "tweets/popularity"
  post "tweets/popularity" => "tweets#count2"
  get "tweets/new"
  post "tweets" => "tweets#create"
  
  # get "categories_id/"  #そのカテゴリに属するスレッド一覧
  # get ":categories_id/:my_threads_id"  #そのスレッドに属するTweet一覧
  resources :users

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
