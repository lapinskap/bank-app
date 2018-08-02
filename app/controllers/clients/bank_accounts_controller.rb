module Clients
    class BankAccountsController < ApplicationController
        before_action :load_parent_object
        before_action :load_object, only: [:edit, :update]

        def new
            @bank_account = BankAccount.new
        end

        def create
            @bank_account = BankAccount.new(bank_account_params)
            @bank_account.client = @client

            if @bank_account.save
                redirect_to bank_account_path(@bank_account.id)
            else
                render "new"
            end
        end

        def edit
        end

        def update
            @bank_account.client = @client

            if @bank_account.update(bank_account_params)
                redirect_to bank_account_path(@bank_account.id)
            else
                render "edit"
            end
        end
        
        private
        def load_object
            @bank_account = BankAccount.find(params[:id])
        end

        def load_parent_object
            @client = Client.find(params[:client_id])
        end

        def bank_account_params
            params.require(:bank_account).permit(:account_number)
        end
    end
end