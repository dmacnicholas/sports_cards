Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/brands', to: 'brands#index'
  get '/brands/new', to: 'brands#new'
  post '/brands', to: 'brands#create'
  get '/brands/:id', to: 'brands#show'
  get '/cards', to: 'cards#index'
  get '/cards/:id', to: 'cards#show'
  get '/brands/:id/cards', to: 'brand_cards#index'

end
