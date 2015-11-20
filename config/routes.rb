Rails.application.routes.draw do

  get 'notifications/new'

  get 'notifications/create'

	devise_for :users, :controllers => { :registrations => "registrations" }
	resources :users do
		get 'ban'
		get 'unban'
	end

	resources :notifications
	resources :exchanges
	resources :reports
	resources :books do
		collection do
			get 'sell'
			post 'create_sell'
		end
		resources :listings do
			get 'buy'
			resources :offers
		end
 
	end

	match '/pages/terms' => "pages#terms", :via => [:get], :as => 'terms'
	match '/pages/library_exchange' => "pages#library_exchange", :via => [:get], :as => 'library_exchange'
	
	# match '/exchanges/library_inventory' => "exchanges#library_inventory", :via => [:get], :as => 'library_inventory'

	get 'library_inventory', to: 'exchanges#library_inventory'

	
	root 'application#landing'

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
