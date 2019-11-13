Rails.application.routes.draw do


  get '/sessions/live', to: 'sessions#index', as: 'sessions'
  get '/sessions/:pin', to: 'sessions#show', as: 'session'

  patch '/projects/:id/toggle', to: 'projects#toggle_session'

  resources :sessions, only: [:create, :update]
  resources :users, only: [:index, :show, :update, :create] do
    resources :projects, only: [:index, :show, :create, :update, :destroy]
  end

  resources :projects, only: [:index, :show, :create, :update, :destroy] do
    resources :prompts, only: [:index, :show, :create, :update, :destroy] do
      resources :answers, only: [:index, :show, :create, :update, :destroy]
    end
  end

  resources :prompts, only: :destroy
  #   resources :answers, only: [:index, :show, :create, :update, :destroy]
  # end


end
