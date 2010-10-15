CheatsheetCmsRails::Application.routes.draw do
  devise_for :users, :path => 'account', :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  resources :sheets, :path => "cheatsheets"
  
  get "home/index"
  root :to => "home#index"
end