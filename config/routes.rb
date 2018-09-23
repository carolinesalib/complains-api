Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :complains
      post 'complains/undo', to: 'complains#undo'
    end
  end
end
