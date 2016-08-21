Rails.application.routes.draw do

  root 'persons#index'

  resources :persons, :only => :index do
    get :search, :on => :collection
    get :autocomplete, :on => :collection
    post :set_as_found, :on => :member
  end

  get :signin, :controller => :sessions, :action => :new
  post :login, :controller => :sessions, :action => :create
  delete :logout, :controller => :sessions, :action => :destroy

  post '/file_missing', :to => 'texts#file_missing'

end
