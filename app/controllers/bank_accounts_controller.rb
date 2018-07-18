class BankAccountsController < ActionController::Base
    def index
        @bank_account = BankAccounts.all
    end

    def show
        @bank_account = BankAccounts.find(params[:id])
    end
end