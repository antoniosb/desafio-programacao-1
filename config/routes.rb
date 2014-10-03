DesafioProgramacao1::Application.routes.draw do
  devise_for :users
  root 'home#index'
  post 'upload_input_file', to: 'home#parse_input_file'
end
