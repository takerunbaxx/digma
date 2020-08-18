Rails.application.routes.draw do

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#devise_for :admins
root to: "toppage#index" 

devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions'
}
  
devise_for :admins, controllers: {
  registrations: 'admins/registrations',
  sessions: 'admins/sessions',
 }
 
devise_scope :admin do
    get 'profile_edit', to: 'admins/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'admins/registrations#profile_update', as: 'profile_update'
end
 
 
  resources :users, only: [:show] do
  member do
    get :user_reservation end  #user側の入力一覧。 
  end
  
  
  resources :admins, only:[:show, :index] do
    collection do
      get :search_result end
    end
  
  resources :packages do   
    resources :reservations, only:[:new, :create, :destroy] #user側予約の入力フォーム、user側のshow、cancelのdestroy
    resources :comments, only:[ :index,:new, :create, :destroy ]
  end
  resources :reservations, only:[:index, :show]
  
  resources :events
  resources :cards
  
end
