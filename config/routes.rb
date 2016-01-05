Rails.application.routes.draw do

  get 'courses/new'

  get 'instructors/new'

  get 'sessions/new'

  get 'students/new'

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

  root :to => 'team_management_system#home'
  get 'GroupArc' => 'team_management_system#home'

  get 'studentsignup'  => 'team_management_system#student_new'
  get 'studentSignup'  => 'student#student_new'

  post 'studentSignup' => 'student#student_create'

  get 'students' => 'team_management_system#student_show'
  get 'student' => 'student#student_show'

  get 'instructorsignup' => 'team_management_system#instructor_new'
  get 'instructorSignup' => 'instructor#instructor_new'

  post 'instructorSignup' => 'instructor#instructor_create'

  get 'instructors' => 'team_management_system#instructor_show'
  get 'instructor' => 'instructor#instructor_show'

  get    'studentlogin'   => 'sessions#student_login'
  post   'studentlogin'   => 'sessions#student_create'
  get    'instructorlogin'   => 'sessions#instructor_login'
  post   'instructorlogin'   => 'sessions#create_instructor'
  delete 'logout'  => 'sessions#destroy'

  get    'courseregistration' => 'team_management_system#register_to_a_course'
  get    'courseRegistration' => 'courses#register_to_a_course'

  post   'courseRegistration' => 'courses#create_course_registration'

  get    'newcourse'   => 'team_management_system#course_new'
  get    'newCourse'   => 'courses#course_new'

  post   'newCourse'   => 'courses#course_create'

  get    'newteamcollaboration' => 'team_management_system#add_team_collaboration'
  get    'newTeamCollaboration' => 'team_collaboration#add_team_collaboration'

  post   'newTeamCollaboration' => 'team_collaboration#create_team_collaboration'

  get 'teamcreation'  => 'team_management_system#team_new'
  get 'teamCreation'  => 'team#team_new'

  post 'teamCreation' => 'team#team_create'

  get 'teams' => 'team_management_system#team_show'
  get 'team' => 'team#team_show'

  get 'teamslist' => 'team_management_system#teams_list'
  get 'teamsList' => 'team#teams_list'

  put 'joinTeam'  => 'team#join_team'
  put 'acceptStudent' => 'team#accept_student'
end
