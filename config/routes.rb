Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users

  resources :tests
  resources :questions
  resources :answers

  resources :tests do
    resources :questions
  end

  resources :questions do
    resources :answers
  end


  get 'questions/create_question_with_test/:id' => 'questions#create_question_with_test', as: 'create_question_with_test'
  get 'answers/create_answer_with_question/:id' => 'answers#create_answer_with_question', as: 'create_answer_with_question'
  get 'student_tests/get_test/:id' => 'student_tests#get_test', as: 'get_test'
  get 'student_tests/student_test/:id' => 'student_tests#student_test', as: 'student_test'


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
