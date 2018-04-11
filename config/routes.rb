Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  root to: "job_postings#index"

  resources :job_postings, only: [:create, :edit, :index, :new, :show, :update]
  resources :locations, only: [:create, :new, :show]

  namespace :api do
    namespace :v1 do
      resources :categories, only: [:index]
      resources :job_posters, only: [:index]
      resources :job_posting_statuses, only: [:index]
      resources :job_postings, only: [:create, :index]
      resources :locations, only: [:index]
    end
  end
end
