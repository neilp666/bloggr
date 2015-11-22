Rails.application.routes.draw do

  root 'posts#index'

  get 'about' => 'pages#about'

  get 'contact' => 'pages#contact'
  
  resources :posts do 
    resources :comments do
    end
  end
end
