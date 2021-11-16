Rails.application.routes.draw do
  root 'static_page#home'
  resources :activities, only: %i[index show]
  resources :cities, only: :index

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
