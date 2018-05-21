Rails.application.routes.draw do


  #devise_for :teachers
  #devise_scope :teachers do
   # get 'teachers/sign_up', to: 'teachers/sessions#create'
 # end


  root 'cours#accueil'

  get 'cours/create'
 
  post 'cours/create' => 'cours#new'

  get 'cours/show'

  get 'cours/inscription'

  get 'charges/new'

  post 'cours/show' => 'charges#new'

  get 'cours/update'

  get 'cours/destroy'

  delete'cours/index' => 'cours#destroy'

  get 'cours/index'

  root 'cours#index'

  get 'cours' => 'cours#index'

  get 'cours/accueil'

  get 'cours/search'

  post 'cours/accueil' =>'cours#search'

  post 'cours/search' =>'cours#search'

  get 'cours/:id' => 'cours#show'

  get 'pages/monespace' 

  get 'pages/monprofil'

  post 'pages/monprofil' => 'pages#completer'

  get 'pages/maphoto'

  post 'pages/maphoto' => 'pages#modifier_maphoto'

  get 'pages/completer'

  get 'pages/medesabonner'

  get 'admin/candidates'

  get 'admin/validated'

  get 'admin/validate'

  get 'admin/invalidate'

  get 'admin/teacher_profile'

  devise_for :users, controllers: { registrations:'user/registrations', sessions:'user/sessions'}
  devise_for :teachers, controllers: { registrations:'teachers/registrations'}

  get 'charges/connect'

  resources :charges

  #get 'pages/contactus' =>'pages#contactus'

  post 'pages/contactus' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
