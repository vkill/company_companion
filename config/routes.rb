CompanyCompanion::Application.routes.draw do

  

  namespace :client do
    root "main#home"

    devise_for :users

  end


end
