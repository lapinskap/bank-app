module Api 
    module V1 
        class BankAccountsController < ApplicationController
            skip_before_action :verify_authenticity_token

            def new_transaction
                amount = params[:amount]
                transaction_type = params[:transaction_type]
                bank_account_id = params[:bank_account_id]

                errors = ::BankAccounts::ValidateNewTransaction.new(
                    amount: amount,
                    transaction_type: transaction_type,
                    bank_account_id: bank_account_id
                ).execute!

                if errors.size > 0
                    render json: { errors: errors }, status: 402
                else
                    bank_account = ::BankAccounts::PerformTransaction.new(
                        amount: amount,
                        transaction_type: transaction_type,
                        bank_account_id: bank_account_id
                    ).execute!

                    render json: { balance: bank_account.balance }
                end
            end
        end
    end
end