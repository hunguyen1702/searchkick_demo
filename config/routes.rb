Rails.application.routes.draw do
  root to: "posts#index"

  get "static_pages/index"
  get "static_pages/posts"

  resources :authors, only: :show
  resources :posts, only: [:index, :show] do
    collection do
      get :autocomplete
    end
  end
end
