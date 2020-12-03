Rails.application.routes.draw do
  resources :breastfeedings
  resources :babies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'breastfeedings#index'


end
