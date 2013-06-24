CompanyCompanion::Application.routes.draw do

  devise_for :users

  namespace :client do
    root "main#home"

  end


end
