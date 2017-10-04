Rails.application.routes.draw do
  
  root 'number_converter#index'
  post '/' => 'number_converter#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
