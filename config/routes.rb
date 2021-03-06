Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"

  resources :shelters

  resources :applications, except: [:destroy]


  resources :pets


  get "/shelters/:shelter_id/pets", to: "shelter_pets#index"
  get "/shelters/:shelter_id/pets/new", to: "shelter_pets#new"
  # post "/shelters/:shelter_id/pets", to: "shelter_pets#create", as: "pets_create"
  get "/shelters/:shelter_id/pets/:id", to: "pets#show"


  get "/admin/applications/:id", to: "admins#show"
  patch "/admin/applications/:id", to: "admins#update"



end
