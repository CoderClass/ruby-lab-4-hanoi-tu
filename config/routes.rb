Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end
  root 'home#index'
  post 'login' => 'home#login'
  delete 'logout' => 'home#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
