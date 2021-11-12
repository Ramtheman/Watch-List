Rails.application.routes.draw do
  # you can destroy ambivilantly because you want to destroy a bookmark without affecting a list
  resources :bookmarks, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: %i[index show new create] do
    # nested because bookmarks belong to a list, you cant create bookmarks without it belonging to a list
    resources :bookmarks, only: %i[new create]
  end
  # you can destroy ambivilantly because you want to destroy a bookmark without affecting a list
end
