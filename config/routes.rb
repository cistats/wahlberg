Rails.application.routes.draw do
  match '*foo', to: 'main#index', via: :all
  root to: 'main#index'
end
