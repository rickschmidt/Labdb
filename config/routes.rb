Lab::Application.routes.draw do
  devise_for :users
devise_scope :user do
  get "/logout" => "devise/sessions#destroy"
end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
    resources :projects do 
		resources :pcrs 
		 member do
	  		delete 'remove_pcr_from_project'
		end
	end


	resources :genes

	 resources :pcrs do
		resources :tubes
    	member do
	     	delete 'remove_tube_from_pcr'
   		end    
	end
 
	 resources :dnasamples
 
	 resources :taxonomies
 
	 resources :primers
   
   resources :tubes

 

 	match 'erd'=>'welcome#erd'
	  #map.root :controller => "user_sessions", :action => "new"   

 		match 'dnasamples/submitgene'
 		match 'dnasamples/removegene'
		match 'experiments/sequencelayout'
		match 'projects/getdnasample'
		match 'projects/updateready'
		match 'projects/updatesuccess'
		match 'pcrs/submitdnasample'
		match 'pcrs/removednasample'
		match '/pcrs/getprimersequence'
		match 'pcrs/getdnasamplestats'
		
		
  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
