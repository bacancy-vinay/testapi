Rails.application.routes.draw do
  resources :customers
  root to:'customers#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do 
      resources :customers
    end
  end
  get '/api' => redirect('/swagger/dist/index.html?url=/api/v1/api-docs.json')

end
