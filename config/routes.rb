Rails.application.routes.draw do
  root to: "pages#index"
  resources :bank_accounts, only: [:index,:show]
end
