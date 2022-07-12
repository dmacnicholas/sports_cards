Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/brands', to: 'brands#index'
  get '/brands/new', to: 'brands#new'
  post '/brands', to: 'brands#create'
  get '/brands/:id', to: 'brands#show'
  get '/brands/:id/edit', to: 'brands#edit'
  patch '/brands/:id', to: 'brands#update'
  get '/brands/:id/cards', to: 'brand_cards#index'
  get '/brands/:id/cards/new', to: 'brand_cards#new'
  post '/brands/:id/cards', to: 'brand_cards#create'
  get '/cards', to: 'cards#index'
  get '/cards/:id', to: 'cards#show'
  get '/cards/:id/edit', to: 'cards#edit'
  patch '/cards/:id', to: 'cards#update'
end
