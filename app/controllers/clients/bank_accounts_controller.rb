module Clients
    class BankAccountsController < ApplicationController
        def new
            @bank_account = BankAccount.new
        end

        def create
            @client = Client.find(params[:client_id])
            @bank_account = BankAccount.new(bank_account_params)
            @bank_account.client = @client

            if @bank_account.save
                redirect_to bank_account_path(@bank_account.id)
            else
                render "new"
            end
        end

        def edit
            @client = Client.find(params[:client_id])
            @bank_account = BankAccount.new(bank_account_params)
        end

        def update
            @client = Client.find(params[:client_id])
            @bank_account = BankAccount.new(bank_account_params)
            @bank_account.client = @client

            if @bank_account.update(bank_account_params)
                redirect_to bank_account_path(@bank_account.id)
            else
                render "edit"
            end
        end
        
        private

        def bank_account_params
            params.require(:bank_account).permit(:account_number)
        end
    end
end