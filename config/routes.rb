Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'pages#home'
resources :users do
  resources :posts
end
get '/about-us', to: 'pages#about', as: 'aboutus'
get '/search', to: 'pages#search', as: 'search'
end
