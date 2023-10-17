Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "students#index"
  resources :students
  get 'download_pdf', to:  "students#download_pdf"
  # resources :students, only: [:index, :show]
  # namespace :monitors do
  #   resources  :students
  # end
end
