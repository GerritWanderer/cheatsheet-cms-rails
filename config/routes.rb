CheatsheetCmsRails::Application.routes.draw do
  devise_for :users, :path => 'account', :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  
  resources :sheets, :path => "cheatsheets" do
    resources :categories
    resources :cheats
  end
  resources :categories
  resources :cheats
  resources :blocks
  get 'cheatsheets/:id/cheats/:cheat_id' => "sheets#show", :as => "sheet_cheat"
  post 'blocks/:template/position/:position' => "blocks#switch", :as => "block_switch"
  post 'blocks/add' => "blocks#add", :as => "block_add"
  
  get "home/index"
  root :to => "home#index"
end