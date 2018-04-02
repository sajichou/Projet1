Rails.application.routes.draw do

  devise_for :users, controllers: { registrations:'user/registrations'}
  devise_for :teachers, controllers: { registrations:'teachers/registrations' }
  #devise_for :teachers
  #devise_scope :teachers do
   # get 'teachers/sign_up', to: 'teachers/sessions#create'
 # end


  root 'home#index'

  get 'cours/create'
 
  post 'cours/create' => 'cours#new'

  get 'cours/show'

  get 'cours/update'

  get 'cours/destroy'

  delete'cours/index' => 'cours#destroy'

  get 'cours/index'

  root 'cours#index'

  get 'cours' => 'cours#index'

  get 'cours/accueil'

  post 'cours/accueil' =>'cours#search'

  get 'cours/search'

  get 'cours/inscription'

  get 'cours/:id' => 'cours#show'

  get 'pages/monespace' 

  get 'pages/monprofil'

  post 'pages/monprofil' => 'pages#completer'

  get 'pages/completer'


  get 'admin/candidates'

  get 'admin/validated'

  get 'admin/validate'

  get 'admin/invalidate'

  get 'admin/teacher_profile'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
