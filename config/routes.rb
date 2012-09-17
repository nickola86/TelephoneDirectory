Telephone::Application.routes.draw do
  resources :entries, :except => [:destroy]
  root :to => 'entries#index'
end
