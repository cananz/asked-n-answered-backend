Rails.application.routes.draw do

  resources :users, only: [:index, :show, :update, :create] do
    resources :projects, only: [:index, :show, :create, :update, :destroy]
  end

  resources :projects, only: [:index, :show, :create, :update, :destroy] do
    resources :prompts, only: [:index, :show, :create, :update, :destroy] do
      resources :answers, only: [:index, :show, :create, :update, :destroy]
    end
  end

  # resources :prompts, only: [:index, :show, :create, :update, :destroy] do
  #   resources :answers, only: [:index, :show, :create, :update, :destroy]
  # end


end
