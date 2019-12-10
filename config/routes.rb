Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    root 'pages#index_home'

    get 'projects/account' => 'projects#account'

    resources :projects do
      resources :comments
      resources :bonus
    end
    resources :pictures, only: [:create, :destroy]
    resources :tttags, only: [:show]
    resources :users, only: [:index]
    resources :categories
  end
end
