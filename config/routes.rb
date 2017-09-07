Rails.application.routes.draw do


  resources :articles do
    resources :comments
  end
  resources :authors,       except: [ :destroy ]
  resources :tags
  root 'articles#show'

  resources :author_sessions, only: [ :new, :create, :destroy ]

  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
