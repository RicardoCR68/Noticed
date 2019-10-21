Rails.application.routes.draw do
  get 'notes/index'
  get 'notes/create'
  get 'notes/edit'
  get 'notes/update'
  get 'notes/delete'
  devise_for :users
  get 'pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"
end
