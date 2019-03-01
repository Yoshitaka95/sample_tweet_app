Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "posts#home"
  get "index" => "posts#index"
  get "new" => "posts#new"
  get "edit/:id" => "posts#edit_form"
  post "create" => "posts#create"
  post "edit/:id" => "posts#edit"
  post "destroy/:id" =>"posts#destroy"
end
