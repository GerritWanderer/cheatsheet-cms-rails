CheatsheetCmsRails::Application.routes.draw do
  devise_for :users, :path => 'account', :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  resources :sheets, :path => "cheatsheets" do
    resources :blocks
    resources :cheats
  end
  resources :blocks
  resources :cheats
  get 'cheatsheets/:id/cheats/:cheat_id' => "sheets#show", :as => "sheet_cheat" 
  
  get "home/index"
  root :to => "home#index"
end