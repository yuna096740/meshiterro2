Rails.application.routes.draw do
  
  root to:'homes#top'
  devise_for :users
  get "homes/about" => "homes#about", as: "about"
  resources :users,only:[:show,:edit,:update]
  resources :post_images,only:[:new,:index,:show,:create,:destroy,:edit,:update] do
    resource :favorites, only:[:create,:destroy]
    resources :post_comments, only:[:create,:destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
