PracticeApp::Application.routes.draw do
  devise_for :users, controllers: { :registrations => "registrations" }
    

  resources :dashboards do
    collection do
      get :new_question_paper
    end
  end

  resources :quizzes do
    resources :questions
    resources :answers
    get :result
  end  

  #resources :user_profiles, :path => :profile, :as => :profile
  #resource :profile, :controller => :user_profiles, :only => :show

  resource :profile, :controller => "user_profiles"
  
  #resources :user_profiles, :path => :profile, :as => :profile
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  #match "/user-profile/:id" => "user-profile#show"
  #match '/user_profiles/:id' => 'user_profile#show', :as => :profile
  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
  
  namespace :admin do
    resources :dashboards do
      collection do
        get :new_quiz
        post :create_quiz
      end      
    end
    resources :profiles do
      member do
        put   :deactivate
        put   :activate
      end
    end
    resources :quizzes do
      resources :answers do
        member do
          put :check_answers
        end
      end
    end
    resources :emails  do
      collection do
        post :delete_multiple
        get :sent_mail
        get :drafts
        get :trashed
        get :search_email
        get :display_emails
        get :sort
      end
      
      member do
        get :reply_email
        put :send_reply
        get :forward_email
        put :read_unread
        get :print
#        get :invite_friends
        get :friends
      end
    end

    resources :users do
      member do
        get :invite_friends
        get :friends
        post :send_invitation
      end
    end
      
  end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  root :to => 'dashboards#index'
    
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
