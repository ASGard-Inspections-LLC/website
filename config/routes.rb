Rails.application.routes.draw do

  # TODO - Delete this
  post "tmp/create_iteration" => "tmp#create_iteration", as: :tmp_create_iteration

  devise_for :users

  namespace :api do
  end

  resources :tracks, only: [:index, :show]
  resources :user_tracks, only: [:create]
  resources :solutions, only: [:show] do
    member do
      get :confirm_unapproved_completion
      patch :complete
      get :reflection
      patch :reflect
    end
  end

  resources :discussion_posts do
  end

  post "markdown/parse" => "markdown#parse"

  root to: "pages#index"
end