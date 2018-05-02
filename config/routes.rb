Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resource :user, only: :show
    resources :users
    resources :teams do
      resources :projects
    end
  end

  devise_for :users, path: '', controllers: { omniauth_callbacks: 'omniauth' }
  get '/login', to: redirect('/auth/github')

  match '*foo', to: 'main#index', via: :all
  root to: 'main#index'
end
