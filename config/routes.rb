Rails.application.routes.draw do
  get '/movies', to: 'shows#movies'
  get '/seasons', to: 'shows#seasons'
  get '/movies-and-seasons', to: 'shows#movies_and_seasons'
  post '/purchase', to: 'shows#purchase'
  get '/library', to: 'shows#user_library'
end
