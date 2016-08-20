Rails.application.routes.draw do

  post '/file_missing', :to => 'texts#file_missing'

end
