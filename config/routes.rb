Rails.application.routes.draw do
  devise_for :users, path: '', controllers: { omniauth_callbacks: 'omniauth' }
  get '/login', to: redirect('/auth/github')

  match '*foo', to: 'main#index', via: :all
  root to: 'main#index'
end
