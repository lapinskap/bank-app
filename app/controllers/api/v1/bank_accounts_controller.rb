module Api 
    module V1 
        class BankAccountsController < ApplicationController
            def new_transaction
                amount = params[:amount]
                transaction_type = params[:transaction_type]
                bank_account_id = params[:bank_account_id]
            end
        end
    end
end