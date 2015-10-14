Rails.application.routes.draw do
  devise_for :users
  #resources :forums
  #resources :topics
  resources :forums do 
   resources :topics , shallow: true do
    resources :posts, shallow: true
	end
	end
 

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'

   root 'forums#index'
   get 'latest', to: 'topics#index'
  

  
end
