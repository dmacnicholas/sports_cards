Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/brands', to: 'brands#index'
  get '/brands/:id', to: 'brands#show'
  get '/cards', to: 'cards#index'
end
