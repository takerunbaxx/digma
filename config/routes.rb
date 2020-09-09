Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#devise_for :admins
root to: "toppage#index" 
get "cancel-policy", to: "toppage#cancel_policy"
get "company-detail", to: "toppage#company"
get "howtouse", to: "toppage#how_to"
get "admin_howto", to: "toppage#admin_howto"
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
    get :user_reservation 
    get :likes_list  #user側の入力一覧。 
    get :user_about  end 
  end
  
  
  resources :admins, only:[:show, :index] do
    member do
      get "packs_index", to: "packages#packs_index" end
    collection do
      get :search_result 
      get :search_bycategory 
      get :search_index  end
    end
  
  resources :packages, only:[:new, :create, :show, :edit, :update, :destroy] do
    collection do 
     get :stock_list end
     resources :comments, only:[ :index,:new, :create, :destroy ]
     resources :reservations, only:[:new, :create] 
     post "/reservations/confirmation", to: "reservations#confirmation"
     post "/reservations/new", to: "reservations#back"
  end
  
  
  resources :reservations, only:[:index, :show, :destroy] do 
    member do
      get :adminside_show
      post :pay end
    collection do
      get :adminside_index end 
  end
  
  resources :notifications, only: [:index, :destroy]
  resources :likes, only:[:create, :destroy]
  get "/events/event_calendar", to: "events#event_calendar"
  resources :events, only: [:create, :destroy]


end
