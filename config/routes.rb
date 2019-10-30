Rails.application.routes.draw do

  resources :users, only: [:index, :show, :update, :create] do
    resources :projects, only: [:index, :show, :update, :create, :destroy]
  end

  resources :projects, only: [:index, :show, :update, :create, :destroy] do
    resources :prompts, only: [:index, :show, :update, :create, :destroy] do
      resources :answers, only: [:index, :show, :update, :create, :destroy]
    end
  end

  resources :prompts, only: [:index, :show, :update, :create, :destroy] do
    resources :answers, only: [:index, :show, :update, :create, :destroy]
  end


end
