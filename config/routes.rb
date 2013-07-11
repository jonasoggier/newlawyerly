Newlawyerly::Application.routes.draw do
  
  root :to => 'home#index'  
    
  resource :session, :only => [:create, :destroy]

  resources :users do  
    resources :posts do # TODO exclude unneeded actions!
      resources :comments # TODO exclude unneeded actions!
    end
  end

  resources :relationships, :only => [:create, :destroy]
  resources :notifications, :only => [:destroy]
   
end