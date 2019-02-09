Rails.application.routes.draw do
  mount Lockup::Engine, at: '/pass'
  resources :tracks do
    collection do
      get :mark_raided
      end
    end
  resources :players
  root to: "players#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
