Rails.application.routes.draw do

  root 'persons#index'

  resources :persons, :only => :index

  get :signin, :controller => :sessions, :action => :new
  post :login, :controller => :sessions, :action => :create
  delete :logout, :controller => :sessions, :action => :destroy

end
