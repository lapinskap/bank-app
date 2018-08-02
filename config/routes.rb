Rails.application.routes.draw do
  root to: "pages#index"
  resources :bank_accounts

  resources :clients do
    resources :bank_accounts, controller: "clients/bank_accounts", except: [:index, :show, :destroy]
  end
  
  namespace :api do
    namespace :v1 do
      post "bank_accounts/new_transaction", to: "bank_accounts#new_transaction"
    end
  end
end
