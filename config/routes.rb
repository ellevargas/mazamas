Rails.application.routes.draw do
  root to: 'pages#index'

  stormpath_rails_routes

  get 'pages/index'
  get 'pages/test', as: 'test'

  post 'payments/stripe', to: 'payments#stripe'
  get 'payments/stripe', to: 'payments#stripe', as: 'payments'

  resources :mountains # param: :name (Attempted to use named routes but stopped)


  resources :climb_classes,
            :climb_leader_profiles,
            :climb_schedules,
            :climb_tags,
            :climbs,
            :climber_educations,
            :climber_experiences,
            :climber_profiles,
            :educations,
            :general_dates,
            :registrations,
            :routes,
            :specific_dates,
            :user_roles,
            :users




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
