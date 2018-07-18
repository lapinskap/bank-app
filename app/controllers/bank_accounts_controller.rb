class BankAccountsController < ActionController::Base
    def index
        @bank_accounts = BankAccount.all
    end

    def show
        @bank_account = BankAccount.find(params[:id])
    end
end