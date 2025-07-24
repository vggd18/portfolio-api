Rails.application.routes.draw do
  namespace :api do
    resources :contacts, only: %i[index create]
    resources :projects, except: %i[new edit]
    resources :skills, only: %i[index create update destroy]
  end
  
  get "up" => "rails/health#show", as: :rails_health_check
end
