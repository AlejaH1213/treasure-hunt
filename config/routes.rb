Rails.application.routes.draw do
  get '/main', to: 'main#index'
  get '/main/randomize', to: 'main#randomize'
end
