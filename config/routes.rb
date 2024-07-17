Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => "homes#about", as: :about
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
end
