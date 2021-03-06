Rails.application.routes.draw do
devise_for :admin_users, ActiveAdmin::Devise.config
ActiveAdmin.routes(self)

devise_for :users  do
  get '/admin/login'=> 'active_admin/devise/sessions#new'

end


  # resources :users
  # get '/users' => 'devise/sessions#destroy'

    get 'lectures/index'
    get 'lectures/new'=>'lectures#new'
    get 'lectures/edit'
    get 'lectures/create'
    get 'lectures/destroy'
    get 'lectures/:id'=>'lectures#index'
    get 'courses/destroy'
    get 'courses/index'
    get 'lectures/:id' => 'lectures#show_course_lectures'
    get '/lecture'=>'lectures#show'
    get '/courses/new'=>'courses#new'
    get '/courses'=>'lectures#index'
    get 'lectures'=>'lectures#index'


  get 'home/index'
get 'comments/new'
get 'comments/edit'
get 'comments/show'
get 'comments/index'
get 'comments/create'
get 'lectures/:id/comments/new'=>'comments#create'
  resources :courses
  resources :lectures, only:[:show_course_lectures,:show,:edit,:destroy,:create,:new] do
    resources :comments

    member do
        put :upvote
        put :downvote
      end
    end
  mount Ckeditor::Engine => '/ckeditor'
  # root "lectures#index"
# get '/lectures/new'=>'lectures#new'
  # , :controllers => { registration: 'registration' }
  get 'welcome/index'
  root 'welcome#index'

  # resources :sessions , only: [:update]

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
