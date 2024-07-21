Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => "homes#about", as: :about
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :books do
    resources :book_comments, only: [:create,:destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update]
end
