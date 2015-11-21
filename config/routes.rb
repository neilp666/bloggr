Rails.application.routes.draw do

  get 'about' => 'pages#about'

  get 'contact' => 'pages#contact'
  
  resources :posts do 
    resources :comments do
    end
  end
end
