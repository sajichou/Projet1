Rails.application.routes.draw do


  get 'images/show'

  get 'messages/index'

  get 'messages/show'

  post 'messages/show' => "messages#new"

  get 'messages/create'

  get 'messages/new'

  get 'messages/destroy'

  get 'messages/mark_as_read_and_read'

  #devise_for :teachers
  #devise_scope :teachers do
   # get 'teachers/sign_up', to: 'teachers/sessions#create'
 # end


  root 'cours#accueil'

  get 'cours/create'

  get 'cours/overlay'
 
  post 'cours/create' => 'cours#new'

  get 'cours/show'

  get 'cours/inscription'

  get 'charges/new'

  get 'charges/custom_connect'

  get 'charges/create_account'

  post 'charges/custom_connect' =>'charges#create_account'

  post 'cours/show' => 'cours#contacter_prof'

  get 'cours/update'

  get 'cours/destroy'

  delete'cours/index' => 'cours#destroy'

  get 'cours/index'

  root 'cours#index'

  get 'cours' => 'cours#index'

  get 'cours/accueil'

  post 'cours/search' =>'cours#search'

  post 'cours/accueil' =>'cours#search'

  get 'cours/search'


  get 'cours/modifier'

  get 'cours/modifier_ex_def'

  post 'cours/modifier' =>'cours#modifier_ex_def'


  get 'cours/accepter_inscription'

  get 'cours/refuser_inscription'

  get 'cours/show_inscrit'

  get 'cours/show_prof'

  post 'cours/show_prof' =>'cours#maj'

  get 'cours/:id' => 'cours#show'



  get 'pages/monespace' 

  get 'pages/monprofil'

  post 'pages/monprofil' => 'pages#completer'

  get 'pages/maphoto'

  get 'pages/paiement'

  get 'pages/code_promo'

  get 'pages/messages'

  post 'pages/maphoto' => 'pages#modifier_maphoto'

  post 'pages/code_promo' => 'pages#code_promo_create'

  get 'pages/completer'

  get 'pages/medesabonner'

  get 'pages/abonnement'

  get 'pages/dashboard'

  get 'admin/candidates'

  get 'admin/validated'

  get 'admin/validate'

  get 'admin/invalidate'

  get 'admin/teacher_profile'

  get 'admin/detruire_prof'

  get 'admin/detruire_eleve'

  get 'admin/eleves'

  get 'admin/info_eleve'

  get 'admin/really_detruire_prof'

  get 'admin/spams'

  devise_for :users, controllers: { registrations:'user/registrations', sessions:'user/sessions', confirmations: 'user/confirmations'}
  devise_for :teachers, controllers: { registrations:'teachers/registrations', confirmations: 'teachers/confirmations'}

  get 'charges/connect'

  resources :charges

  post 'pages/contactus' =>'pages#contactus'

  #get 'pages/contactus' 

  get 'annexe/quisommesnous'


  get 'annexe/CGU'

  get 'annexe/Guide'

  get 'annexe/professeur'

  get 'annexe/politique_de_confidentialite'

  get 'blog/index'
  get 'blog/create'
  post 'blog/create' =>'blog#new'
  get 'blog/show'
  get 'blog/edit'
  post 'blog/edit' =>'blog#update'
  get 'blog/destroy'

  get 'absences/ponctuelle'

  resources :notifications do
    collection do 
        post :mark_as_read
    end 
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
